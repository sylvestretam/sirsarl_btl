<?php

    require_once("src/model/ligne_degustation.php");

    class LigneDegustationRepository
    {
        private $dbconnect;

        public function __construct($dbconnect)
        {
            $this->dbconnect = $dbconnect;
        }

        public function getAll()
        {
            try{
                
                $statement = $this->dbconnect->getConection()->prepare(
                    "SELECT * FROM BTL_ligne_degustation"
                );


                $statement->execute();
                
                $ligne_degustations = [];

                while($row = $statement->fetch(PDO::FETCH_ASSOC))
                {        
                    $ligne_degustation = new LigneDegustation();
                    $ligne_degustation->degustation = $row['degustation'];
                    $ligne_degustation->quantite = $row['quantite'];
                    $ligne_degustation->valeur = $row['valeur'];
                    $ligne_degustation->article = $row['article'];
                    $ligne_degustation->unite = $row['unite'];

                    $ligne_degustations[] = $ligne_degustation;
                }
                
                return $ligne_degustations;

            }catch(Exception $e){$GLOBALS['error'] = $e->getMessage(); }

        }

        public function save($ligne_degustation)
        {
            try{
                
                $statement = $this->dbconnect->getConection()->prepare(
                    "INSERT INTO BTL_ligne_degustation(degustation,quantite,valeur,article,unite) 
                    VALUES(:degustation,:quantite,:valeur,:article,:unite)"
                );

                $statement->bindParam(':degustation',$ligne_degustation->degustation);
                $statement->bindParam(':valeur',$ligne_degustation->valeur);
                $statement->bindParam(':quantite',$ligne_degustation->quantite);
                $statement->bindParam(':article',$ligne_degustation->article);
                $statement->bindParam(':unite',$ligne_degustation->unite);

                $statement->execute();
                                
                return $ligne_degustation;

            }catch(Exception $e){$GLOBALS['error'] = $e->getMessage(); }

        }
        
    }