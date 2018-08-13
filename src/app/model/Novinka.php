<?php

namespace App\Model;

use Nette;


class Novinka extends Nette\Object
{
    private $id;
    private $datum;
    private $titulek;
    private $text;
    private $titulek_en;
    private $text_en;
    private $soubor;
    private $youtube;
    private $kategorie;

    /**
     * Novinka constructor.
     * @param $id
     * @param $datum
     * @param $titulek
     * @param $text
     * @param $titulek_en
     * @param $text_en
     * @param $soubor
     * @param $youtube
     * @param $kategorie
     */
    public function __construct($id, $datum, $titulek, $text, $titulek_en, $text_en, $soubor, $youtube, $kategorie)
    {
        $this->id = $id;
        $this->datum = $datum;
        $this->titulek = $titulek;
        $this->text = $text;
        $this->titulek_en = $titulek_en;
        $this->text_en = $text_en;
        $this->soubor = $soubor;
        $this->youtube = $youtube;
        $this->kategorie = $kategorie;
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
    public function getDatum()
    {
        return $this->datum;
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
    public function getText()
    {
        return $this->text;
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
    public function getTextEn()
    {
        return $this->text_en;
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
    public function getYoutube()
    {
        return $this->youtube;
    }

    /**
     * @return mixed
     */
    public function getKategorie()
    {
        return $this->kategorie;
    }
}