<?php

namespace App\Model;

use Nette;


class Klient
{
	use Nette\SmartObject;

    private $nazev;
    private $popisek;
    private $popisek_en;
    private $dalsiObrazky;

    /**
     * Klient constructor.
     * @param $nazev
     * @param $popisek
     * @param $popisek_en
     * @param $dalsiObrazky
     */
    public function __construct($nazev, $popisek, $popisek_en, $dalsiObrazky)
    {
        $this->nazev = $nazev;
        $this->popisek = $popisek;
        $this->popisek_en = $popisek_en;
        $this->dalsiObrazky = $dalsiObrazky;
    }

    /**
     * @return mixed
     */
    public function getNazev()
    {
        return $this->nazev;
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
    public function getPopisekEn()
    {
        return $this->popisek_en;
    }

    /**
     * @return mixed
     */
    public function getDalsiObrazky()
    {
        return $this->dalsiObrazky;
    }
}