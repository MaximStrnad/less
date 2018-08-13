<?php

return [
	'parameters' => [
		'database' => [
			'host' => getenv('DB_HOST'),
			'name' => getenv('DB_DATABASE'),
			'user' => getenv('DB_USER'),
			'port' => getenv('DB_PORT'),
			'pass' => getenv('DB_PASS'),
		],
		'smtp' => [
			'host' => getenv('MAIL_HOST'),
			'port' => getenv('MAIL_PORT'),
			'username' => getenv('MAIL_USER'),
			'password' => getenv('MAIL_PASS'),
			'secure' => getenv('MAIL_SECURE'),
		],
	],
];
