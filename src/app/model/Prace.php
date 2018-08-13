<?php

namespace App\Model;

use Nette;


class Prace extends Nette\Object
{
    private $id;
    private $titulek;
    private $popisek;
    private $titulek_en;
    private $popisek_en;
    private $soubor;
    private $rok;
    private $poznamka;
    private $poznamka_en;

    /**
     * @var DruhPrace
     */
    private $druh;
    /**
     * @var Klient
     */
    private $klient;

    /**
     * Prace constructor.
     * @param $id
     * @param $titulek
     * @param $popisek
     * @param $titulek_en
     * @param $popisek_en
     * @param $soubor
     * @param $rok
     * @param $poznamka
     * @param $poznamka_en
     * @param DruhPrace $druh
     * @param Klient $klient
     */
    public function __construct($id, $titulek, $popisek, $titulek_en, $popisek_en, $soubor, $rok, $poznamka, $poznamka_en, DruhPrace $druh = null, Klient $klient = null)
    {
        $this->id = $id;
        $this->titulek = $titulek;
        $this->popisek = $popisek;
        $this->titulek_en = $titulek_en;
        $this->popisek_en = $popisek_en;
        $this->soubor = $soubor;
        $this->rok = $rok;
        $this->druh = $druh;
        $this->poznamka = $poznamka;
        $this->poznamka_en = $poznamka_en;
        $this->klient = $klient;
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @return mixed
     */
    public function getTitulek()
    {
        return $this->titulek;
    }

    /**
     * @return mixed
     */
    public function getPopisek()
    {
        return $this->popisek;
    }

    /**
     * @return mixed
     */
    public function getTitulekEn()
    {
        return $this->titulek_en;
    }

    /**
     * @return mixed
     */
    public function getPopisekEn()
    {
        return $this->popisek_en;
    }

    /**
     * @return mixed
     */
    public function getSoubor()
    {
        return $this->soubor;
    }

    /**
     * @return mixed
     */
    public function getSouborBig()
    {
        $strArray = explode('/', $this->soubor);
        $strArray[count($strArray) - 1] = 'big_' . $strArray[count($strArray) - 1];

        return implode('/', $strArray);
    }

    /**
     * @return mixed
     */
    public function getRok()
    {
        return $this->rok;
    }

    /**
     * @return DruhPrace
     */
    public function getDruh()
    {
        return $this->druh;
    }

    /**
     * @return Klient
     */
    public function getKlient()
    {
        return $this->klient;
    }

    /**
     * @return mixed
     */
    public function getPoznamka()
    {
        return $this->poznamka;
    }

    /**
     * @return mixed
     */
    public function getPoznamkaEn()
    {
        return $this->poznamka_en;
    }
}