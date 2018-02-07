<?php

namespace App\Presenters;

use Nette;
use Nette\Application\UI;
use Nette\Mail\Message;
use Tracy\Debugger;
use Tracy\ILogger;

class PagePresenter extends Nette\Application\UI\Presenter
{
    /** @persistent */
    public $locale;

    /** @var \Kdyby\Translation\Translator @inject */
    public $translator;

    /** @var Nette\Mail\IMailer @inject */
    public $mailer;

    /**
     * @var \App\Model\Helpers
     */
    private $helpers;

    /**
     * @param \App\Model\Helpers
     */
    public function __construct(\App\Model\Helpers $helpers)
    {
        $this->helpers = $helpers;
    }

    public function beforeRender()
    {
        $this->template->locale = $this->locale;
    }

    public function renderDefault()
    {
        $this->template->hasFooter = true;
        $this->template->hasSpecialCss = "homepage-responsive-size";
    }

    public function renderSeznamStudii()
    {
        $this->template->hasFooter = true;
    }

    public function renderOnas()
    {
        $this->template->hasFooter = true;
    }

    public function renderVytvarimePrezentace()
    {
        $this->template->hasFooter = true;
    }

    public function renderObsahForma()
    {
        $this->template->hasFooter = true;
    }

    public function renderKlubKlicovychZakaznikuPlzenskyPrazdroj()
    {
        $this->template->hasFooter = false;
        $this->template->hasSpecialCss = "skins/kkz";
    }

    public function renderDestro()
    {
        $this->template->hasFooter = false;
        $this->template->hasSpecialCss = "skins/destro";
    }

    public function renderPetrackovyHorickeTrubicky()
    {
        $this->template->hasFooter = false;
        $this->template->hasSpecialCss = "skins/pht";
    }

    public function renderDrevosrot()
    {
        $this->template->hasFooter = false;
        $this->template->hasSpecialCss = "skins/drevosrot";
    }

	public function renderKontakt()
    {
        $this->template->hasFooter = true;
    }

    public function renderDownload()
    {
        $this->template->hasFooter = true;
    }

	public function renderLead()
    {
        $this->template->hasFooter = true;
    }

    public function renderDekovnaStranka()
    {
        $this->template->hasFooter = true;
    }

    public function renderCookies()
    {
        $this->template->hasFooter = true;
    }

    public function renderChybaOdeslani()
    {
        $this->template->hasFooter = true;
    }

    public function renderNasePrace($filter = '', $others = '')
    {
        $this->template->hasFooter = true;
        $this->template->druhy = $this->helpers->getAllDruhPrace();
        $prace = $this->helpers->getPrace($filter, -1, $others);
        $this->template->prace = $prace;
        $this->template->filter = $this->getParameter('filter');
    }

    public function renderVytvarimeLoga()
    {
        $this->template->hasFooter = true;
        $prace = $this->helpers->getPrace('logo', 27);
        $this->template->prace = $prace;
    }

    public function renderVytvarimeObaly()
    {
        $this->template->hasFooter = true;
        $prace = $this->helpers->getPrace('obal', 18);
        $this->template->prace = $prace;
    }

    public function renderVytvarimeWeby()
    {
        $this->template->hasFooter = true;
        $prace = $this->helpers->getPrace('web', 27);
        $this->template->prace = $prace;
    }

    public function renderGetDetail($id)
    {
        $detail = $this->helpers->getPracaDetail($id);
        $this->template->detail = $detail;
    }
    
    public function renderNovinky($id = 0)
    {
        $this->template->novinky = $this->helpers->getNovinka($id);
        $this->template->showOlder = $id == 0 ? false : true;
    }

    public function renderClanky($id = 0)
    {
        $this->template->clanky = $this->helpers->getClanky($id);
        $this->template->showOlder = $id == 0 ? false : true;
    }
    
    protected function createComponentContactForm()
    {
        $form = new UI\Form;
        $form->addText('name', $this->translator->translate('translation.form.contact.name'))->setAttribute('class', 'form-control')->setRequired();
        $form->addText('contact', $this->translator->translate('translation.form.contact.email'))->setAttribute('class', 'form-control')->setRequired();
        $form->addTextArea('text', $this->translator->translate('translation.form.contact.message'))->setAttribute('class', 'form-control')->setAttribute('rows', '8');
        $form->addSubmit('send', $this->translator->translate('translation.form.contact.button'))->setAttribute('class', 'btn btn-orange');
        $form->addText("username")->setAttribute('class', 'antispam');
        $form->onSuccess[] = [$this, "contactFormSuccess"];

        $renderer = $form->getRenderer();
        $renderer->wrappers['controls']['container'] = NULL;
        $renderer->wrappers['pair']['container'] = 'div class=form-group';
        $renderer->wrappers['control']['container'] = NULL;
        $renderer->wrappers['label']['container'] = NULL;
        return $form;
    }

    protected function createComponentContactFormSmall()
    {
        $form = new UI\Form;
        $form->elementPrototype->setAttribute('class', 'form-horizontal');
        $form->addText('contact')->setAttribute('placeholder', $this->translator->translate('translation.form.small.input'))->setAttribute('class', 'form-control')->setRequired();
        $form->addSubmit('send', $this->translator->translate('translation.form.small.button'))->setAttribute('class', 'btn btn-orange');
        $form->addText("username")->setAttribute('class', 'antispam');
        $form->onSuccess[] = [$this, "contactFormSuccess"];

        $renderer = $form->getRenderer();
        $renderer->wrappers['controls']['container'] = NULL;
        $renderer->wrappers['pair']['container'] = NULL;
        $renderer->wrappers['control']['container'] = NULL;
        $renderer->wrappers['label']['container'] = NULL;
        return $form;
    }

    public function contactFormSuccess($form, $formData) {
        if($formData['username'] != ""){
            $this->redirect('chybaOdeslani');
            exit;
        }

        $mailto = $this->context->parameters['contact']['mail'];

        $latte = new \Latte\Engine;
        $params = [
            'contact' => $formData['contact']
        ];
        if(isset($formData['name'])) {
            $params['name'] = $formData['name'];
        }
        if(isset($formData['text'])) {
            $params['text'] = $formData['text'];
        }

        $from = explode(';', $mailto)[0];

        $mail = new Message;
        $mail->setFrom($from)
            ->setSubject("Zpráva z kontaktního formuláře")
            ->setHtmlBody($latte->renderToString(__DIR__ . '/templates/Email/contact.latte', $params));

        foreach(explode(';', $mailto) as $mailAddr) {
            $mail->addTo($mailAddr);
        }
        try {
            $this->mailer->send($mail);
        } catch(\Exception $ex) {
	        Debugger::log($ex, ILogger::CRITICAL);
            //$this->flashMessage($this->locale === 'cs' ? 'Něco se pokazilo při odesílání e-mailu.' : 'Something went wrong when sending the e-mail.', 'danger text-center');
            $this->redirect('chybaOdeslani');
            exit;
        }
        //$this->flashMessage($this->locale === 'cs' ? 'E-mail úspěšně odeslán.' : 'E-mail succesfully send.', 'success');
        $this->redirect('dekovnaStranka');
    }

    protected function createComponentLeadForm()
    {
        $form = new UI\Form;
        $form->addHidden("name");
        $form->addHidden("company");
        $form->addHidden("contact");
        $form->addHidden("product");
        $form->addHidden("typeProduct");
        $form->addHidden("budget", "5000 Kč");
        $form->addHidden("info");
        $form->addText("username")->setAttribute('class', 'antispam');
        $form->onSuccess[] = [$this, "LeadFormSuccess"];

        $renderer = $form->getRenderer();
        $renderer->wrappers['controls']['container'] = NULL;
        $renderer->wrappers['pair']['container'] = NULL;
        $renderer->wrappers['control']['container'] = NULL;
        $renderer->wrappers['label']['container'] = NULL;

        return $form;
    }

    public function LeadFormSuccess($form, $formData) {
        if($formData['username'] != ""){
            $this->redirect('chybaOdeslani');
            exit;
        }

        $mailto = $this->context->parameters['contact']['mail'];

        $latte = new \Latte\Engine;
        $params = [];
        if(isset($formData['name'])) {
            $params['name'] = $formData['name'];
        }
        if(isset($formData['company'])) {
            $params['company'] = $formData['company'];
        }
        if(isset($formData['contact'])) {
            $params['contact'] = $formData['contact'];
        }
        if(isset($formData['product'])) {
            $params['product'] = $formData['product'];
        }
        if(isset($formData['typeProduct'])) {
            $params['typeProduct'] = $formData['typeProduct'];
        }
        if(isset($formData['budget'])) {
            $params['budget'] = $formData['budget'];
        }
        if(isset($formData['info'])) {
            $params['info'] = $formData['info'];
        }

        $from = explode(';', $mailto)[0];

        $mail = new Message;
        $mail->setFrom($from)
            ->setSubject("Zpráva z lead stránky")
            ->setHtmlBody($latte->renderToString(__DIR__ . '/templates/Email/lead.latte', $params));

        foreach(explode(';', $mailto) as $mailAddr) {
            $mail->addTo($mailAddr);
        }
        try {
            $this->mailer->send($mail);
        } catch(\Exception $ex) {
        	Debugger::log($ex, ILogger::CRITICAL);
            //$this->flashMessage($this->locale === 'cs' ? 'Něco se pokazilo při odesílání e-mailu.' : 'Something went wrong when sending the e-mail.', 'danger text-center');
            $this->redirect('chybaOdeslani');
            exit;
        }
        //$this->flashMessage($this->locale === 'cs' ? 'E-mail úspěšně odeslán.' : 'E-mail succesfully send.', 'success');
        $this->redirect('dekovnaStranka');
    }
}
