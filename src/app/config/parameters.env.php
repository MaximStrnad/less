<?php

return [
	'parameters' => [
		'database' => [
			'host' => getenv('MYSQL_HOST'),
			'name' => getenv('MYSQL_NAME'),
			'user' => getenv('MYSQL_USER'),
			'port' => getenv('MYSQL_PORT'),
			'pass' => getenv('MYSQL_PASS'),
		],
	],
];
