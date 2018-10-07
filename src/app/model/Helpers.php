<?php

namespace App\Model;

use Nette;


class Helpers
{
	use Nette\SmartObject;

    /**
     * @var \Dibi\Connection
     */
    private $database;

    /**
     * @param \Dibi\Connection $database
     */
    public function __construct(\Dibi\Connection $database)
    {
        $this->database = $database;
    }

    public function getNovinka($id = 0)
    {
        $all = array();
        $result = null;
        if($id == 0) {
            //get all
            $result = $this->database->query('SELECT * FROM d3_novinky ORDER BY DATUM DESC');
        } else {
            //get one
            $result = $this->database->query('SELECT * FROM d3_novinky WHERE id = %i AND kategorie = "novinky"', $id);
        }
        foreach($result as $row) {
            $all[] = new Novinka($row['id'], $row['datum'], $row['titulek'], $row['text'], $row['titulek_en'], $row['text_en'], $row['soubor'], $row['youtube'], $row['kategorie']);
        }
        return $all;
    }

    public function getClanky($id = 0)
    {
        $all = array();
        $result = null;
        if($id == 0) {
            //get all
            $result = $this->database->query('SELECT * FROM d3_novinky WHERE kategorie = "clanky" ORDER BY DATUM DESC');
        } else {
            //get one
            $result = $this->database->query('SELECT * FROM d3_novinky WHERE id = %i AND kategorie = "clanky"', $id);
        }
        foreach($result as $row) {
            $all[] = new Novinka($row['id'], $row['datum'], $row['titulek'], $row['text'], $row['titulek_en'], $row['text_en'], $row['soubor'], $row['youtube'], $row['kategorie']);
        }
        return $all;
    }
}

