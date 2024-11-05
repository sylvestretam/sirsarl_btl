<?php

    require_once("src/model/degustation.php");

    class DegustationRepository
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
                    "SELECT * FROM BTL_degustation"
                );


                $statement->execute();
                
                $degustations = [];

                while($row = $statement->fetch(PDO::FETCH_ASSOC))
                {        
                    $degustation = new degustation();
                    $degustation->degustation_id = $row['degustation_id'];
                    $degustation->date_degustation = $row['date_degustation'];
                    $degustation->observation = $row['observation'];
                    $degustation->enreg_by = $row['enreg_by'];
                    $degustation->status = $row['status'];
                    $degustation->market_develloper = $row['market_develloper'];
                    $degustation->point_de_vente = $row['point_de_vente'];

                    $degustations[] = $degustation;
                }
                
                return $degustations;

            }catch(Exception $e){$GLOBALS['error'] = $e->getMessage(); }

        }

        public function save($degustation)
        {
            try{
                
                $statement = $this->dbconnect->getConection()->prepare(
                    "INSERT INTO BTL_degustation(degustation_id,date_degustation,market_develloper,point_de_vente) 
                    VALUES(:degustation_id,:date_degustation,:market_develloper,:point_de_vente)"
                );

                $statement->bindParam(':degustation_id',$degustation->degustation_id);
                $statement->bindParam(':date_degustation',$degustation->date_degustation);
                $statement->bindParam(':market_develloper',$degustation->market_develloper);
                $statement->bindParam(':point_de_vente',$degustation->point_de_vente);

                $statement->execute();
                                                
                return $degustation;

            }catch(Exception $e){$GLOBALS['error'] = $e->getMessage(); }

        }

        public function delete($degustation)
        {
            try{
                
                $statement = $this->dbconnect->getConection()->prepare(
                    "DELETE FROM BTL_ligne_degustation WHERE degustation = :degustation_id"
                );
                $statement->bindParam(':degustation_id',$degustation->degustation_id);
                $statement->execute();
                
                $statement = $this->dbconnect->getConection()->prepare(
                    "DELETE FROM BTL_degustation WHERE degustation_id = :degustation_id"
                );
                $statement->bindParam(':degustation_id',$degustation->degustation_id);
                $statement->execute();
                                
                return $degustation;

            }catch(Exception $e){$GLOBALS['error'] = $e->getMessage(); }

        }


    }