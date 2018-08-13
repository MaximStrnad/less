<?php

namespace App\Model;

use Nette;


class Helpers extends Nette\Object
{
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

    public function getAllDruhPrace()
    {
        $all = array();
        $result = $this->database->query('SELECT kod, poradi, nazev, nazev_en FROM d3_druhy_projektu');
        foreach ($result as $row) {
            $all[] = new DruhPrace($row['kod'], $row['poradi'], $row['nazev'], $row['nazev_en']);
        }
        usort($all, function ($a, $b) {
            return $a->getPoradi() < $b->getPoradi() ? -1 : 1;
        });
        return $all;
    }

    public function getPrace($praceId = '', $size = -1, $others = '')
    {
        $all = array();

        if($others != ''){
            $othersArr = explode (";", $others);
            $othersString = "";

            foreach($othersArr as $other){
                $othersString .= " AND d.kod != '".$other."'";
            }

            $othersString = ltrim($othersString, 'AND ');

            if($size == -1){
                $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o INNER JOIN d3_druhy_projektu d  ON o.druh = d.id WHERE '.$othersString.' ORDER BY RAND()');
            }else{
                $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o INNER JOIN d3_druhy_projektu d  ON o.druh = d.id WHERE '.$othersString.' ORDER BY RAND() LIMIT %i', $size);
            }

        }else{
            if($praceId == ''){
                if($size == -1){
                    $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o ORDER BY RAND()');
                }else{
                    $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o ORDER BY RAND() LIMIT %i', $size);
                }
            }else{
                if($size == -1){
                    $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o INNER JOIN d3_druhy_projektu d  ON o.druh = d.id WHERE d.kod = %s ORDER BY RAND()', $praceId);
                }else{
                    $result = $this->database->query('SELECT o.id, o.soubor FROM d3_obrazky o INNER JOIN d3_druhy_projektu d  ON o.druh = d.id WHERE d.kod = %s ORDER BY RAND() LIMIT %i', $praceId, $size);
                }
            }
        }


        $rows = array();
        foreach ($result as $row) {
            $rows[] = $row;
        }
        foreach ($rows as $row) {
            $all[] = new Prace($row['id'], null, null, null, null, $row['soubor'], null, null, null);
        }
        return $all;
    }

    public function getPracaDetail($id = 0){
        $all = array();

        $result = $this->database->query('SELECT o.id, o.soubor, o.titulek, o.popisek, o.titulek_en, o.popisek_en, o.druh, o.rok, o.poznamka, o.poznamka_en, o.klient, k.jmeno as k_jmeno, k.popisek as k_popisek, k.popisek_en as k_popisek_en, d.kod as d_kod, d.nazev as d_nazev, d.nazev_en as d_nazev_en FROM d3_obrazky o INNER JOIN d3_klienti k ON o.klient = k.id INNER JOIN d3_druhy_projektu d ON o.druh = d.id WHERE o.klient = (SELECT oi.klient FROM d3_obrazky as oi WHERE oi.id = %i)', $id);

        $rows = array();
        foreach ($result as $row) {
            $rows[] = $row;
        }
        foreach ($rows as $row) {
            $klientObrazky = array();
            foreach ($rows as $rowob) {
                if($row['klient'] == $rowob['klient']) {
                    $strArray = explode('/', $rowob['soubor']);
                    $strArray[count($strArray) - 1] = 'big_' . $strArray[count($strArray) - 1];
                    $klientObrazky[$rowob['id']] = implode('/', $strArray);
                }
            }
            $druh = new DruhPrace($row['d_kod'], null, $row['d_nazev'], $row['d_nazev_en']);
            $klient = new Klient($row['k_jmeno'], $row['k_popisek'], $row['k_popisek_en'], $klientObrazky);
            $all[] = new Prace($row['id'], $row['titulek'], $row['popisek'], $row['titulek_en'], $row['popisek_en'], $row['soubor'], $row['rok'], $row['poznamka'], $row['poznamka_en'], $druh, $klient);
        }
        return $all;
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

