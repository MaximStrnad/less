<?php
namespace App;

use ErrorException;
use Exception;
use Nette\Mail\IMailer;
use Nette\Mail\Message;
use Throwable;
use Tracy\Dumper;
use Tracy\Helpers;

class TracyMailer
{
	/** @var string */
	protected $fromEmail;
	/** @var IMailer */
	protected $mailer;
	/**
	 * Constructor
	 *
	 * @param IMailer $mailer
	 * @param string $fromEmail
	 * @return void
	 */
	public function __construct(IMailer $mailer, $fromEmail = NULL)
	{
		$this->setMailer($mailer);
		$this->setFromEmail($fromEmail);
	}
	/**
	 * @param  string|Exception|Throwable
	 * @return string
	 */
	protected function formatMessage($message)
	{
		if ($message instanceof Exception || $message instanceof Throwable) {
			while ($message) {
				$tmp[] = ($message instanceof ErrorException ? Helpers::errorTypeToString($message->getSeverity()) . ': ' . $message->getMessage() : Helpers::getClass($message) . ': ' . $message->getMessage() . ($message->getCode() ? ' #' . $message->getCode() : '')
					) . ' in ' . $message->getFile() . ':' . $message->getLine();
				$message = $message->getPrevious();
			}
			$message = implode("\ncaused by ", $tmp);
		} elseif (!is_string($message)) {
			$message = Dumper::toText($message);
		}
		return trim($message);
	}
	/**
	 * Send email
	 *
	 * @param string $message
	 * @param string $email
	 * @return void
	 */
	public function send($message, $email)
	{
		$host = preg_replace('#[^\w.-]+#', '', isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : php_uname('n'));
		$parts = str_replace(
			["\r\n", "\n"], ["\n", PHP_EOL], [
				'headers' => array(
					'X-Mailer' => 'Tracy',
					'Content-Type' => 'text/plain; charset=UTF-8',
					'Content-Transfer-Encoding' => '8bit',
				),
				'subject' => "PHP: An error occurred on the server $host",
				'body' => $this->formatMessage($message) . "\n\nsource: " . Helpers::getSource(),
			]
		);
		$mailer = $this->getMailer();
		$messageItem = new Message();
		$messageItem->setFrom($this->getFromEmail() ?: "noreply@$host");
		$messageItem->addTo($email);
		$messageItem->setSubject($parts['subject']);
		$messageItem->setBody($parts['body']);
		foreach ($parts['headers'] as $name => $value) {
			$messageItem->setHeader($name, $value);
		}
		$mailer->send($messageItem);
	}

	/**
	 * FromEmail getter
	 *
	 * @return string
	 */
	public function getFromEmail()
	{
		return $this->fromEmail;
	}
	/**
	 * FromEmail setter
	 *
	 * @param string $fromEmail
	 * @return self Provides fluent interface
	 */
	public function setFromEmail($fromEmail)
	{
		$this->fromEmail = $fromEmail;
		return $this;
	}
	/**
	 * Mailer getter
	 *
	 * @return IMailer
	 */
	public function getMailer()
	{
		return $this->mailer;
	}
	/**
	 * Mailer setter
	 *
	 * @param IMailer $mailer
	 * @return self Provides fluent interface
	 */
	public function setMailer(IMailer $mailer)
	{
		$this->mailer = $mailer;
		return $this;
	}

}