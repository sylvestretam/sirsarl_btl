<?php

    class Degustation
    {
        public $degustation_id;
        public $date_degustation;
        public $quantite = 0;
        public $valeur_total = 0;
        public $observation;
        public $enreg_by;
        public $status;
        public $market_develloper;
        public $point_de_vente;
        public $MD_name = "";

        public $lignes = [];

        public function setLignes($lignes)
        {   
            foreach ($lignes as $ligne) {
                if( $ligne->degustation == $this->degustation_id){
                    $this->lignes[] = $ligne;
                    $this->valeur_total = $this->valeur_total + $ligne->valeur;
                    $this->quantite = $this->quantite + $ligne->quantite;
                }
            }
        }

        public function setMDName($mds)
        {
            foreach ($mds as $md) {
                if( $md->employee == $this->market_develloper){
                    $this->MD_name = $md->noms;
                }
            }
        }
    }