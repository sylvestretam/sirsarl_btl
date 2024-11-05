<?php

    class DegustationController{

        private $dbconnect;

        public function __construct()
        {
            $this->dbconnect = new DbConnect();
        }

        public function show()
        {
            $Total = "00";
            $Nbre = "10";
            $moyenne = "120";

            require("template/degustation.php");
        }  
    }