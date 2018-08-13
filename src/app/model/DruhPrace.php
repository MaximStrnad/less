<?php

namespace App\Model;

use Nette;


class DruhPrace extends Nette\Object
{
    private $kod;
    private $poradi;
    private $nazev;
    private $nazev_en;

    /**
     * DruhPrace constructor.
     * @param $kod
     * @param $poradi
     * @param $nazev
     * @param $nazev_en
     */
    public function __construct($kod, $poradi, $nazev, $nazev_en)
    {
        $this->kod = $kod;
        $this->poradi = $poradi;
        $this->nazev = $nazev;
        $this->nazev_en = $nazev_en;
    }

    /**
     * @return int
     */
    public function getKod()
    {
        return $this->kod;
    }

    /**
     * @return int
     */
    public function getPoradi()
    {
        return $this->poradi;
    }

    /**
     * @return string
     */
    public function getNazev()
    {
        return $this->nazev;
    }

    /**
     * @return string
     */
    public function getNazevEn()
    {
        return $this->nazev_en;
    }
}