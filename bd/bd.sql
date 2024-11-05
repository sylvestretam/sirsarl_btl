#Ma base de données : 

DROP TABLE IF EXISTS BTL_food_trucker;
CREATE TABLE BTL_food_trucker(
        employee     varchar(25),
        noms     varchar(255),
        target_vente     integer,
        target_prospection     integer,
        PRIMARY KEY (employee)
);

DROP TABLE IF EXISTS BTL_superviseur;
CREATE TABLE BTL_superviseur(
        employee     varchar(25),
        noms     varchar(255),
        target_vente     integer,
        target_prospection     integer,
        PRIMARY KEY (employee)
);

DROP TABLE IF EXISTS BTL_rapport_ft;
CREATE TABLE BTL_rapport_ft(
        food_trucker     varchar(25),
        date_jour       date,
        vente     integer,
        prospection     integer,
        convertion     integer,
        observation     varchar(500),
        PRIMARY KEY (food_trucker)
);

DROP TABLE IF EXISTS BTL_presence_ft;
CREATE TABLE BTL_presence_ft(
        date_jour       date,
        observation     varchar(500),
        PRIMARY KEY (date_jour)
);

DROP TABLE IF EXISTS BTL_ligne_presence_ft;
CREATE TABLE BTL_ligne_presence_ft(
        date_presence     date,
        food_trucker     varchar(25),
        status     varchar(25),

        PRIMARY KEY (date_presence,food_trucker)
);

DROP TABLE IF EXISTS BTL_prospect;
CREATE TABLE BTL_prospect(
        prospection_id     integer auto_increment,
        date_prospection     date,
        noms     varchar(255),
        contact     varchar(25),
        adresse     varchar(255),
        nom_point_de_vente     varchar(255),
        type_point_de_pointe     varchar(255),
        observation     varchar(255),
        status     varchar(25),
        food_trucker     varchar(25),
        status_by     varchar(25),
        PRIMARY KEY (prospection_id)
);



DROP TABLE IF EXISTS BTL_point_de_vente;
CREATE TABLE BTL_point_de_vente(
        code_pv     varchar(25),
        nom     varchar(255),
        description     varchar(255),
        localisation     varchar(255),
        type     varchar(255),
        status     varchar(25),
        status_by     varchar(25),
        prospect     integer,
        PRIMARY KEY (code_pv)
);



DROP TABLE IF EXISTS BTL_magasin;
CREATE TABLE BTL_magasin(
        code     varchar(25),
        designation     varchar(255),
        localisation     varchar(255),
        PRIMARY KEY (code)
);

DROP TABLE IF EXISTS BTL_retour_magasin_ft;
CREATE TABLE BTL_retour_magasin_ft(
        retour_id     integer auto_increment,
        date_retour     date,
        valeur_total     integer,
        observation     varchar(25),
        enreg_by     varchar(25),
        magasin     varchar(25),
        food_trucker     varchar(25),
        uuid     varchar(500) unique,
        PRIMARY KEY (retour_id)
);

DROP TABLE IF EXISTS BTL_retour_magasin_pv;
CREATE TABLE BTL_retour_magasin_pv(
        retour_id     integer auto_increment,
        date_retour     date,
        valeur_total     integer,
        observation     varchar(255),
        enreg_by     varchar(25),
        point_de_vente     varchar(25),
        magasin     varchar(25),
        uuid     varchar(500) unique,
        PRIMARY KEY (retour_id)
);

DROP TABLE IF EXISTS BTL_sortie_magasin_ft;
CREATE TABLE BTL_sortie_magasin_ft(
        sortie_id     integer auto_increment,
        date_sortie     date,
        valeur_total     integer,
        observation     varchar(25),
        enreg_by     varchar(25),
        food_trucker     varchar(25),
        magasin     varchar(25),
        uuid     varchar(500) unique,
        PRIMARY KEY (sortie_id)
);


DROP TABLE IF EXISTS BTL_sortie_magasin_pv;
CREATE TABLE BTL_sortie_magasin_pv(
        sortie_id     integer auto_increment,
        date_sortie     date,
        valeur_total     integer,
        observation     varchar(25),
        enreg_by     varchar(25),
        point_de_vente     varchar(25),
        magasin     varchar(25),
        uuid     varchar(500) unique,
        PRIMARY KEY (sortie_id)
);

DROP TABLE IF EXISTS BTL_convertion;
CREATE TABLE BTL_convertion(
        convertion_id     integer auto_increment,
        date_convertion     date,
        quantite_converti     integer,
        quantite_obtenu     integer,
        observation     varchar(255),
        unite_converti     varchar(25),
        unite_obtenu     varchar(25),
        article     varchar(25),
        magasin     varchar(25),
        enreg_by     varchar(25),
        PRIMARY KEY (convertion_id)
);

DROP TABLE IF EXISTS BTL_vente_ft;
CREATE TABLE BTL_vente_ft(
        vente_id     varchar(25),
        date_vente     date,
        valeur_total     integer,
        observation     varchar(255),
        enreg_by     varchar(255),
        status     varchar(25),
        status_by     varchar(25),
        food_trucker     varchar(25),
        PRIMARY KEY (vente_id)
);

DROP TABLE IF EXISTS BTL_vente_pv;
CREATE TABLE BTL_vente_pv(
        vente_id     varchar(25),
        date_vente     date,
        valeur_total     integer,
        observation     varchar(255),
        enreg_by     varchar(255),
        status     varchar(25),
        status_by     varchar(25),
        pv     varchar(25),
        PRIMARY KEY (vente_id)
);

DROP TABLE IF EXISTS BTL_article;
CREATE TABLE BTL_article(
        code     varchar(25),
        designation     varchar(255),
        description     Varchar (500),
        PRIMARY KEY (code)
);

DROP TABLE IF EXISTS BTL_unite_stock;
CREATE TABLE BTL_unite_stock(
        code_unite     varchar(25),
        designation     varchar(255),
        description     Varchar (500),
        PRIMARY KEY (code_unite)
);

DROP TABLE IF EXISTS BTL_unite_article;
CREATE TABLE BTL_unite_article(
        article     varchar(25),
        unite     varchar(25),
        PRIMARY KEY (article,unite)
);

DROP TABLE IF EXISTS BTL_commande_prospect;
CREATE TABLE BTL_commande_prospect(
        commande_id     integer auto_increment,
        date_livraison     date,
        prospect     integer,
        PRIMARY KEY (commande_id)
);

DROP TABLE IF EXISTS BTL_stock_magasin;
CREATE TABLE BTL_stock_magasin(
        quantite     integer,
        valeur     integer,
        article     varchar(25),
        unite     varchar(25),
        magasin     varchar(25),
        PRIMARY KEY (article,unite,magasin)
);

DROP TABLE IF EXISTS BTL_ligne_sortie_ft;
CREATE TABLE BTL_ligne_sortie_ft(
        quantite     integer,
        valeur     integer,
        sortie_ft     integer,
        article     varchar(25),
        unite     varchar(25),
        PRIMARY KEY (sortie_ft,article,unite)
);


DROP TABLE IF EXISTS BTL_ligne_retour_ft;
CREATE TABLE BTL_ligne_retour_ft(
        quantite     integer,
        valeur     integer,
        unite     varchar(25),
        retour_ft     integer,
        article     varchar(25),
        PRIMARY KEY (unite,retour_ft,article)
);

DROP TABLE IF EXISTS BTL_ligne_sortie_pv;
CREATE TABLE BTL_ligne_sortie_pv(
        quantite     integer,
        valeur     integer,
        unite     varchar(25),
        article     varchar(25),
        sortie_pv     integer,
        PRIMARY KEY (unite,article,sortie_pv)
);

DROP TABLE IF EXISTS BTL_ligne_retour_pv;
CREATE TABLE BTL_ligne_retour_pv(
        quantite     integer,
        valeur     integer,
        retour_pv     integer,
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (retour_pv,unite,article)
);

DROP TABLE IF EXISTS BTL_ligne_vente_ft;
CREATE TABLE BTL_ligne_vente_ft(
        quantite     integer,
        valeur     integer,
        vente_ft     varchar(25),
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (vente_ft,unite,article)
);

DROP TABLE IF EXISTS BTL_ligne_vente_pv;
CREATE TABLE BTL_ligne_vente_pv(
        quantite     integer,
        valeur     integer,
        vente_pv     varchar(25),
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (vente_pv,unite,article)
);

DROP TABLE IF EXISTS BTL_target_pv;
CREATE TABLE BTL_target_pv(
        quantite     integer,
        valeur     integer,
        point_de_vente     varchar(25),
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (point_de_vente,unite,article)
);

DROP TABLE IF EXISTS BTL_target_ft;
CREATE TABLE BTL_target_ft(
        quantite     integer,
        valeur     integer,
        food_trucker     varchar(25),
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (food_trucker,unite,article)
);

DROP TABLE IF EXISTS BTL_activation_pv;
CREATE TABLE BTL_activation_pv(
        activation_id integer auto_increment,
        date_activation     date,
        valeur     integer,
        point_de_vente     varchar(25),
        PRIMARY KEY (activation_id)
);

DROP TABLE IF EXISTS BTL_ligne_activation_pv;
CREATE TABLE BTL_ligne_activation_pv(
        quantite     integer,
        valeur     integer,
        activation_id     integer,
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (activation_id,unite,article)
);

DROP TABLE IF EXISTS BTL_reception_magasin;
CREATE TABLE BTL_reception_magasin(
        reception_id integer auto_increment,
        date_reception     date,
        magasin     varchar(25),
        uuid     varchar(500) unique,
        PRIMARY KEY (reception_id)
);

DROP TABLE IF EXISTS BTL_ligne_reception_magasin;
CREATE TABLE BTL_ligne_reception_magasin(
        quantite     integer,
        valeur     integer,
        reception     integer,
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (reception,unite,article)
);

DROP TABLE IF EXISTS BTL_stock_ft;
CREATE TABLE BTL_stock_ft(
        quantite     integer,
        food_trucker     varchar(25),
        unite     varchar(25),
        article     varchar(25),
        PRIMARY KEY (food_trucker,unite,article)
);

DROP TABLE IF EXISTS BTL_ligne_commande_prospect;
CREATE TABLE BTL_ligne_commande_prospect(
        quantite     integer,
        valeur     integer,
        commande_id     integer,
        article     varchar(25),
        unite     varchar(25),
        PRIMARY KEY (commande_id,article,unite)
);

/***** DEDUSTATION *****/

DROP TABLE IF EXISTS BTL_degustation;
CREATE TABLE BTL_degustation(
        degustation_id     varchar(25),
        date_degustation     date,
        quantite     integer,
        valeur_total     integer,
        observation     varchar(255),
        enreg_by     varchar(255),
        status     varchar(25),
        market_develloper     varchar(25),
        point_de_vente     varchar(25),
        PRIMARY KEY (degustation_id)
);

DROP TABLE IF EXISTS BTL_ligne_degustation;
CREATE TABLE BTL_ligne_degustation(
        quantite     integer,
        valeur     integer,
        degustation     varchar(25),
        article     varchar(25),
        unite     varchar(25),
        PRIMARY KEY (degustation,article,unite)
);

ALTER TABLE BTL_ligne_degustation ADD CONSTRAINT FK_BTL_ligne_degustation_degustation FOREIGN KEY (degustation) REFERENCES BTL_degustation(degustation_id);

/**** FIN DEGUSTATION *****/

ALTER TABLE BTL_ligne_presence_ft ADD CONSTRAINT FK_BTL_presence_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_ligne_presence_ft ADD CONSTRAINT FK_BTL_linge_presence_ft_presence_ft FOREIGN KEY (date_presence) REFERENCES BTL_presence_ft(date_jour);

ALTER TABLE BTL_activation_pv ADD CONSTRAINT FK_BTL_activation_pv_point_de_vente FOREIGN KEY (point_de_vente) REFERENCES BTL_point_de_vente(code_pv);

ALTER TABLE BTL_ligne_activation_pv ADD CONSTRAINT FK_BTL_ligne_activation_pv_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_activation_pv ADD CONSTRAINT FK_BTL_ligne_activation_pv_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_activation_pv ADD CONSTRAINT FK_BTL_ligne_activation_pv_activation FOREIGN KEY (activation_id) REFERENCES BTL_activation_pv(activation_id);

ALTER TABLE BTL_rapport_ft ADD CONSTRAINT FK_BTL_rapport_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);

ALTER TABLE BTL_food_trucker ADD CONSTRAINT FK_BTL_food_trucker_employee FOREIGN KEY (employee) REFERENCES AT_employee(matricule);

ALTER TABLE BTL_unite_article ADD CONSTRAINT FK_BTL_unite_article_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_unite_article ADD CONSTRAINT FK_BTL_unite_article_article FOREIGN KEY (article) REFERENCES BTL_article(code);

ALTER TABLE BTL_target_ft ADD CONSTRAINT FK_BTL_target_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_target_ft ADD CONSTRAINT FK_BTL_target_ft_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_target_ft ADD CONSTRAINT FK_BTL_target_ft_article FOREIGN KEY (article) REFERENCES BTL_article(code);

ALTER TABLE BTL_prospect ADD CONSTRAINT FK_BTL_prospect_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_point_de_vente ADD CONSTRAINT FK_BTL_point_de_vente_prospect FOREIGN KEY (prospect) REFERENCES BTL_prospect(prospection_id);
ALTER TABLE BTL_retour_magasin_ft ADD CONSTRAINT FK_BTL_retour_magasin_ft_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_retour_magasin_ft ADD CONSTRAINT FK_BTL_retour_magasin_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_retour_magasin_pv ADD CONSTRAINT FK_BTL_retour_magasin_pv_point_de_vente FOREIGN KEY (point_de_vente) REFERENCES BTL_point_de_vente(code_pv);
ALTER TABLE BTL_retour_magasin_pv ADD CONSTRAINT FK_BTL_retour_magasin_pv_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_sortie_magasin_ft ADD CONSTRAINT FK_BTL_sortie_magasin_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_sortie_magasin_ft ADD CONSTRAINT FK_BTL_sortie_magasin_ft_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_sortie_magasin_pv ADD CONSTRAINT FK_BTL_sortie_magasin_pv_point_de_vente FOREIGN KEY (point_de_vente) REFERENCES BTL_point_de_vente(code_pv);
ALTER TABLE BTL_sortie_magasin_pv ADD CONSTRAINT FK_BTL_sortie_magasin_pv_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_convertion ADD CONSTRAINT FK_BTL_convertion_unite_converti FOREIGN KEY (unite_converti) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_convertion ADD CONSTRAINT FK_BTL_convertion_unite_obtenu FOREIGN KEY (unite_obtenu) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_convertion ADD CONSTRAINT FK_BTL_convertion_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_convertion ADD CONSTRAINT FK_BTL_convertion_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_vente_ft ADD CONSTRAINT FK_BTL_vente_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_commande_prospect ADD CONSTRAINT FK_BTL_commande_prospect_prospect FOREIGN KEY (prospect) REFERENCES BTL_prospect(prospection_id);
ALTER TABLE BTL_stock_magasin ADD CONSTRAINT FK_BTL_stock_magasin_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_stock_magasin ADD CONSTRAINT FK_BTL_stock_magasin_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_stock_magasin ADD CONSTRAINT FK_BTL_stock_magasin_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_ligne_sortie_ft ADD CONSTRAINT FK_BTL_ligne_sortie_ft_sortie_ft FOREIGN KEY (sortie_ft) REFERENCES BTL_sortie_magasin_ft(sortie_id);
ALTER TABLE BTL_ligne_sortie_ft ADD CONSTRAINT FK_BTL_ligne_sortie_ft_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_sortie_ft ADD CONSTRAINT FK_BTL_ligne_sortie_ft_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_retour_ft ADD CONSTRAINT FK_BTL_ligne_retour_ft_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_retour_ft ADD CONSTRAINT FK_BTL_ligne_retour_ft_retour_ft FOREIGN KEY (retour_ft) REFERENCES BTL_retour_magasin_ft(retour_id);
ALTER TABLE BTL_ligne_retour_ft ADD CONSTRAINT FK_BTL_ligne_retour_ft_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_sortie_pv ADD CONSTRAINT FK_BTL_ligne_sortie_pv_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_sortie_pv ADD CONSTRAINT FK_BTL_ligne_sortie_pv_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_sortie_pv ADD CONSTRAINT FK_BTL_ligne_sortie_pv_sortie_pv FOREIGN KEY (sortie_pv) REFERENCES BTL_sortie_magasin_pv(sortie_id);
ALTER TABLE BTL_ligne_retour_pv ADD CONSTRAINT FK_BTL_ligne_retour_pv_retour_pv FOREIGN KEY (retour_pv) REFERENCES BTL_retour_magasin_pv(retour_id);
ALTER TABLE BTL_ligne_retour_pv ADD CONSTRAINT FK_BTL_ligne_retour_pv_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_retour_pv ADD CONSTRAINT FK_BTL_ligne_retour_pv_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_vente_ft ADD CONSTRAINT FK_BTL_ligne_vente_ft_vente_ft FOREIGN KEY (vente_ft) REFERENCES BTL_vente_ft(vente_id);
ALTER TABLE BTL_ligne_vente_ft ADD CONSTRAINT FK_BTL_ligne_vente_ft_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_vente_ft ADD CONSTRAINT FK_BTL_ligne_vente_ft_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_target_pv ADD CONSTRAINT FK_BTL_target_pv_point_de_vente FOREIGN KEY (point_de_vente) REFERENCES BTL_point_de_vente(code_pv);
ALTER TABLE BTL_target_pv ADD CONSTRAINT FK_BTL_target_pv_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_target_pv ADD CONSTRAINT FK_BTL_target_pv_article FOREIGN KEY (article) REFERENCES BTL_article(code);


ALTER TABLE BTL_reception_magasin ADD CONSTRAINT FK_BTL_reception_magasin_magasin FOREIGN KEY (magasin) REFERENCES BTL_magasin(code);
ALTER TABLE BTL_ligne_reception_magasin ADD CONSTRAINT FK_BTL_ligne_reception_magasin_reception FOREIGN KEY (reception) REFERENCES BTL_reception_magasin(reception_id);
ALTER TABLE BTL_ligne_reception_magasin ADD CONSTRAINT FK_BTL_ligne_reception_magasin_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_ligne_reception_magasin ADD CONSTRAINT FK_BTL_ligne_reception_magasin_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_stock_ft ADD CONSTRAINT FK_BTL_stock_ft_food_trucker FOREIGN KEY (food_trucker) REFERENCES BTL_food_trucker(employee);
ALTER TABLE BTL_stock_ft ADD CONSTRAINT FK_BTL_stock_ft_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);
ALTER TABLE BTL_stock_ft ADD CONSTRAINT FK_BTL_stock_ft_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_commande_prospect ADD CONSTRAINT FK_BTL_ligne_commande_prospect_commande_id FOREIGN KEY (commande_id) REFERENCES BTL_commande_prospect(commande_id);
ALTER TABLE BTL_ligne_commande_prospect ADD CONSTRAINT FK_BTL_ligne_commande_prospect_article FOREIGN KEY (article) REFERENCES BTL_article(code);
ALTER TABLE BTL_ligne_commande_prospect ADD CONSTRAINT FK_BTL_ligne_commande_prospect_unite FOREIGN KEY (unite) REFERENCES BTL_unite_stock(code_unite);


DROP TRIGGER IF EXISTS BTL_LigneReceptionINSERTUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneReceptionINSERTUpdateStockMagasin AFTER INSERT
ON BTL_ligne_reception_magasin FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;
    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SELECT magasin INTO @m_magasin FROM BTL_reception_magasin WHERE reception_id = NEW.reception;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;


    SET n_quantite = m_quantite + NEW.quantite;
    SET n_valeur = m_valeur + NEW.valeur;
    
	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, NEW.article, NEW.unite, @m_magasin);
    
END |

DROP TRIGGER IF EXISTS BTL_LigneReceptionDELETEUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneReceptionDELETEUpdateStockMagasin AFTER DELETE
ON BTL_ligne_reception_magasin FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_article varchar(25);
    DECLARE m_unite varchar(25);

    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;

    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SET m_article = OLD.article;
    SET m_unite = OLD.unite;

    SELECT magasin INTO @m_magasin FROM BTL_reception_magasin WHERE reception_id = OLD.reception;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;


    SET n_quantite = m_quantite - OLD.quantite;
    SET n_valeur = m_valeur - OLD.valeur;
    
	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, m_article, m_unite, @m_magasin);
    
END |



DROP TRIGGER IF EXISTS BTL_LigneSortieFTINSERTUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneSortieFTINSERTUpdateStockMagasin AFTER INSERT
ON BTL_ligne_sortie_ft FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;
    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SELECT magasin INTO @m_magasin FROM BTL_sortie_magasin_ft WHERE sortie_id = NEW.sortie_ft;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;


    SET n_quantite = m_quantite - NEW.quantite;
    SET n_valeur = m_valeur - NEW.valeur;
    
	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, NEW.article, NEW.unite, @m_magasin);
    
END |

DROP TRIGGER IF EXISTS BTL_LigneSortieFTDELETEUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneSortieFTDELETEUpdateStockMagasin AFTER DELETE
ON BTL_ligne_sortie_ft FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_article varchar(25);
    DECLARE m_unite varchar(25);

    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;

    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SET m_article = OLD.article;
    SET m_unite = OLD.unite;

    SELECT magasin INTO @m_magasin FROM BTL_sortie_magasin_ft WHERE sortie_id = OLD.sortie_ft;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;

    SET n_quantite = m_quantite + OLD.quantite;
    SET n_valeur = m_valeur + OLD.valeur;
     
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, m_article, m_unite, @m_magasin);
    
END |



DROP TRIGGER IF EXISTS BTL_LigneSortiePVINSERTUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneSortiePVINSERTUpdateStockMagasin AFTER INSERT
ON BTL_ligne_sortie_pv FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;
    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SELECT magasin INTO @m_magasin FROM BTL_sortie_magasin_pv WHERE sortie_id = NEW.sortie_pv;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;

    SET n_quantite = m_quantite - NEW.quantite;
    SET n_valeur = m_valeur - NEW.valeur;
    	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, NEW.article, NEW.unite, @m_magasin);
    
END |

DROP TRIGGER IF EXISTS BTL_LigneSortiePVDELETEUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneSortiePVDELETEUpdateStockMagasin AFTER DELETE
ON BTL_ligne_sortie_pv FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_article varchar(25);
    DECLARE m_unite varchar(25);

    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;

    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SET m_article = OLD.article;
    SET m_unite = OLD.unite;

    SELECT magasin INTO @m_magasin FROM BTL_sortie_magasin_pv WHERE sortie_id = OLD.sortie_pv;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;

    SET n_quantite = m_quantite + OLD.quantite;
    SET n_valeur = m_valeur + OLD.valeur;
    	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, m_article, m_unite, @m_magasin);
    
END |



DROP TRIGGER IF EXISTS BTL_LigneRetourFTINSERTUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneRetourFTINSERTUpdateStockMagasin AFTER INSERT
ON BTL_ligne_retour_ft FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;
    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SELECT magasin INTO @m_magasin FROM BTL_retour_magasin_ft WHERE retour_id = NEW.retour_ft;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;


    SET n_quantite = m_quantite + NEW.quantite;
    SET n_valeur = m_valeur + NEW.valeur;
    
	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, NEW.article, NEW.unite, @m_magasin);
    
END |

DROP TRIGGER IF EXISTS BTL_LigneRetourFTDELETEUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneRetourFTDELETEUpdateStockMagasin AFTER DELETE
ON BTL_ligne_retour_ft FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_article varchar(25);
    DECLARE m_unite varchar(25);

    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;

    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SET m_article = OLD.article;
    SET m_unite = OLD.unite;

    SELECT magasin INTO @m_magasin FROM BTL_retour_magasin_ft WHERE retour_id = OLD.retour_ft;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;

    SET n_quantite = m_quantite - OLD.quantite;
    SET n_valeur = m_valeur - OLD.valeur;
     
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, m_article, m_unite, @m_magasin);
    
END |



DROP TRIGGER IF EXISTS BTL_LigneRetourPVINSERTUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneRetourPVINSERTUpdateStockMagasin AFTER INSERT
ON BTL_ligne_retour_pv FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;
    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SELECT magasin INTO @m_magasin FROM BTL_retour_magasin_pv WHERE retour_id = NEW.retour_pv;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;

    SET n_quantite = m_quantite + NEW.quantite;
    SET n_valeur = m_valeur + NEW.valeur;
    	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = NEW.article AND unite = NEW.unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, NEW.article, NEW.unite, @m_magasin);
    
END |

DROP TRIGGER IF EXISTS BTL_LigneRetourPVDELETEUpdateStockMagasin;
DELIMITER |
CREATE TRIGGER BTL_LigneRetourPVDELETEUpdateStockMagasin AFTER DELETE
ON BTL_ligne_retour_pv FOR EACH ROW
BEGIN

    DECLARE m_magasin varchar(25);
    DECLARE m_article varchar(25);
    DECLARE m_unite varchar(25);

    DECLARE m_quantite integer default 0;
    DECLARE m_valeur integer default 0;

    DECLARE n_quantite integer default 0;
    DECLARE n_valeur integer default 0;

    SET m_article = OLD.article;
    SET m_unite = OLD.unite;

    SELECT magasin INTO @m_magasin FROM BTL_retour_magasin_pv WHERE retour_id = OLD.retour_pv;
    
    SELECT quantite INTO m_quantite FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    SELECT valeur INTO m_valeur FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;

    SET n_quantite = m_quantite - OLD.quantite;
    SET n_valeur = m_valeur - OLD.valeur;
    	 
    DELETE FROM BTL_stock_magasin WHERE magasin = @m_magasin AND article = m_article AND unite = m_unite;
    
    INSERT INTO BTL_stock_magasin(quantite,valeur,article,unite,magasin)  VALUES( n_quantite, n_valeur, m_article, m_unite, @m_magasin);
    
END |