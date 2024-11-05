<?php

    require_once("src/repository/employee.php");
    require_once("src/repository/food_trucker.php");
    require_once("src/repository/article.php");
    require_once("src/repository/unite_stock.php");
    require_once("src/repository/degustation.php");
    require_once("src/repository/ligne_degustation.php");

    class DegustationController{

        private $dbconnect;

        private $repoFood_trucker;
        private $repoArticle;
        private $repoUnite;
        private $repoDegustation;
        private $repoLigneDegustation;

        private $degustations = [];
        private $lignes_degustations = [];
        private $food_truckers = [];

        public function __construct()
        {
            $this->dbconnect = new DbConnect();

            $this->repoFood_trucker = new Food_truckerRepository($this->dbconnect);
            $this->repoArticle = new ArticleRepository($this->dbconnect);
            $this->repoUnite = new Unite_stockRepository($this->dbconnect);
            $this->repoDegustation = new DegustationRepository($this->dbconnect);
            $this->repoLigneDegustation = new LigneDegustationRepository($this->dbconnect);

            $this->subactions();
            $this->init();
        }

        public function show()
        {
            $articles = $this->repoArticle->getAll();
            $unites_stocks = $this->repoUnite->getAll();
            $food_truckers = $this->food_truckers;

            $degustations = $this->degustations;
            $lignes_degustations = $this->lignes_degustations;

            $Total = array_reduce($this->degustations,function($carry, $object){ return  $carry+($object->valeur_total);},0);;
            $Nbre = sizeof($degustations);
            $moyenne = ($Nbre == 0) ? 0 : $Total/$Nbre;
            $last_degustation = ( empty( $degustations[ sizeof($degustations)-1 ] ) ? new Degustation() : $degustations[ sizeof($degustations)-1 ]);

            require("template/degustation.php");
        }

        public function subactions()
        {
            if(isset($_REQUEST['subaction'])){

                switch ($_REQUEST['subaction']) {
    
                    case 'saveDegustation':
                        $this->saveDegustation();
                        break;
                    case 'deleteDegustation':
                        $this->deleteDegustation();
                        break;
                    default:
                        break;
                }
            }
        }

        function init(){
            $this->food_truckers = $this->repoFood_trucker->getAll();
            $this->degustations = $this->repoDegustation->getAll();
            $this->lignes_degustations = $this->repoLigneDegustation->getAll();

            array_map(function($object){$object->setLignes($this->lignes_degustations);},$this->degustations);
            array_map(function($object){$object->setMDName($this->food_truckers);},$this->degustations);
        }

        public function saveDegustation()
        {
            $degustation = new Degustation();
            $degustation->market_develloper = $_REQUEST['market_develloper'];
            $degustation->date_degustation = $_REQUEST['date_degustation'];
            $degustation->degustation_id = uniqid('dg_');
            $this->repoDegustation->save($degustation);

            $this->save_ligne_vente($degustation);
        }

        public function save_ligne_vente($degustation)
        {
            if(!empty( $_REQUEST['ligne_degustation'] )){
                $Lignes = json_decode($_REQUEST['ligne_degustation']);
                foreach ($Lignes as $key => $value) 
                {
                    $ligne = new LigneDegustation();
                    $ligne->article = $key;
                    $ligne->quantite = $value->quantite;
                    $ligne->unite = $value->unite;
                    $ligne->valeur = $value->valeur;
                    $ligne->degustation = $degustation->degustation_id;

                    $this->repoLigneDegustation->save($ligne);
                }
            }
        }

        public function deleteDegustation()
        {
            $degustation = new Degustation();
            $degustation->degustation_id = $_REQUEST['degustation_id'];

            $this->repoDegustation->delete($degustation);
        }
        
        
    }