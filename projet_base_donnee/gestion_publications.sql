 -- source de creation de la base  
CREATE TABLE PAYS (
              id_p SERIAL NOT NULL,
              libelle_p VARCHAR (30) NOT NULL ,
              ville VARCHAR (50), 
              PRIMARY KEY (id_p)
) ;

CREATE TABLE INSTITUTIONS (
               id_inst SERIAL  NOT  NULL, 
               nom_inst VARCHAR(50) NOT NULL,
               type_inst VARCHAR(50) ,
               i_pays SERIAL CONSTRAINT i_pays REFERENCES pays (id_p),
               PRIMARY KEY (id_inst)
) ;

CREATE TABLE CHERCHEUR (
               id_ch SERIAL  NOT NULL,
               nom_ch VARCHAR(50)  NOT NULL,
               prenom_ch VARCHAR(50)  NOT NULL,
               num_orcid INTEGER  UNIQUE, 
               mail VARCHAR (50)   UNIQUE,
               c_pays SERIAL CONSTRAINT c_pays REFERENCES pays (id_p),
            PRIMARY KEY (id_ch)
) ; 

CREATE TABLE AFFILIATION (
               af_chercheur SERIAL CONSTRAINT af_chercheur REFERENCES chercheur(id_ch) , 
               af_institutions SERIAL CONSTRAINT af_institutions REFERENCES institutions(id_inst),
                PRIMARY KEY (af_chercheur, af_institutions)
) ;

CREATE TABLE ARTICLE (
                id_art SERIAL NOT NULL,
                titre_art VARCHAR (100) NOT NULL ,
                PRIMARY KEY (id_art)
) ;

CREATE TABLE ECRIT (
               e_chercheur SERIAL CONSTRAINT e_chercheur REFERENCES chercheur(id_ch) ,
               e_article SERIAL CONSTRAINT e_article REFERENCES article(id_art) ,
               PRIMARY KEY (e_chercheur, e_article)
) ;

CREATE TABLE MOTS_CLES (
                id_th SERIAL NOT NULL,
                libelle_th VARCHAR (30) NOT NULL,
                PRIMARY KEY (id_th)
) ;

CREATE TABLE APPARTIENT (
               a_mots_cles SERIAL CONSTRAINT a_mots_cles REFERENCES  mots_cles (id_th) ,
               a_article SERIAL  CONSTRAINT  a_article REFERENCES article(id_art) ,
               PRIMARY KEY (a_mots_cles, a_article) 
) ;

CREATE TABLE STATUT_ARTICLE (
              id_sart  SERIAL NOT NULL,
              libelle_sart VARCHAR(30),
              PRIMARY KEY (id_sart)
) ;

CREATE TABLE POSSEDE (
            p_date DATE,
            p_article SERIAL  CONSTRAINT  p_article REFERENCES article(id_art), 
            p_statut_article SERIAL  CONSTRAINT p_statut_article REFERENCES statut_article(id_sart),
            PRIMARY KEY (p_article, p_statut_article)
) ;

CREATE TABLE CONFERENCE (
           id_c SERIAL NOT NULL,
          titre_c VARCHAR (100) NOT NULL,
          annee_c INTEGER ,
          c_pays  SERIAL CONSTRAINT c_pays  REFERENCES pays (id_p),
         PRIMARY KEY (id_c)
) ;

CREATE TABLE  PUBLIE_1 (
               p1_Date DATE,
               p1_article SERIAL CONSTRAINT p1_article  REFERENCES article (id_art) ,
               p1_conference SERIAL CONSTRAINT p1_conference REFERENCES conference (id_c) ,
              PRIMARY KEY (p1_article, p1_conference)
) ;


CREATE TABLE LIVRE (
             id_l SERIAL NOT NULL,
            titre_l VARCHAR (100) NOT NULL,
            editeur VARCHAR (50),
            PRIMARY KEY (id_l)
) ;

CREATE TABLE   PUBLIE_2 (
                p2_Date DATE,
                p2_article SERIAL CONSTRAINT p2_article  REFERENCES article (id_art) ,
                p2_livre SERIAL CONSTRAINT p2_livre REFERENCES livre (id_l) ,
                PRIMARY KEY (p2_article, p2_livre)
) ;

CREATE TABLE THESE (
               id_t SERIAL NOT NULL,
               universite VARCHAR (100) NOT NULL,
               annee  INTEGER,
               PRIMARY KEY (id_t)
) ;      


  CREATE TABLE   PUBLIE_3 (
                p3_Date DATE,
                p3_article SERIAL CONSTRAINT p3_article  REFERENCES article (id_art) ,
               p3_these SERIAL CONSTRAINT p3_these  REFERENCES these (id_t) ,
               PRIMARY KEY (p3_article, p3_these)
) ;

CREATE TABLE REVUE_SCIENTIFIQUE (
               id_rs  SERIAL NOT NULL,
              titre_rs  VARCHAR (100) NOT NULL,
              annee_rs  INTEGER,
              PRIMARY KEY (id_rs)
 ) ;   
CREATE TABLE  PUBLIE_4 (
                p4_Date DATE,
               p4_article SERIAL CONSTRAINT p4_article  REFERENCES article (id_art) ,
               p4_revue_scientifique SERIAL  CONSTRAINT p4_revue_scientifique REFERENCES              revue_scientifique (id_rs) ,
             PRIMARY KEY (p4_article, p4_revue_scientifique)
 ) ;


insert into PAYS values (1, 'FRANCE', 'LILLE');
insert into PAYS values (2, 'ALLEMAGNE', 'BERLIN');
insert into PAYS values (3, 'ETATS-UNIS', 'CHICAGO');
insert into PAYS values (4, 'ROYAUME-UNI', 'GLASGOW');
insert into PAYS values (5, 'BRESIL', 'SAO PAOLO');
insert into PAYS values (6, 'BRESIL', 'CURITIBA');
insert into PAYS values (7, 'PAYS-BAS', 'LEIDEN');


insert into INSTITUTIONS values (1,'CRISTAL','LABORATOIRE', 1);
insert into INSTITUTIONS values (2,'UNIVERSITÉ DE CHICAGO','UNIVERSITÉ', 3);
insert into INSTITUTIONS values (3,'UNIVERSITÉ TECHNIQUE DE BERLIN','UNIVERSITÉ', 2);
insert into INSTITUTIONS values (4,'UNIVERSITÉ DE LILLE','UNIVERSITÉ',1 );


insert into CHERCHEUR values (1,'CHAVALERIN','DANIEL', 12234, 'DANIELCHAVALERIN@CRYSTAL.NET', 1 );
insert into CHERCHEUR values (2,'MULLER','FELIX', 37689, 'MULLERFELIX@UTEK.COM', 2 );
insert into CHERCHEUR values (3,'SMITH','CLINT', 98001, 'SMITHCLINT@CU.COM', 3 );
insert into CHERCHEUR values (4,' Marcondes Pavelski','LUCAS', 98720, 'UNKNOWN',6  );


insert into AFFILIATION values (2,3);
insert into AFFILIATION values (1,1);
insert into AFFILIATION values (3,2);


insert into ARTICLE values (1,' Multi-objective Automatic Algorithm Configuration for the Classification Problem of Imbalanced Data');
insert into ARTICLE values (2,'A SHORT CONTRIBUTION TO THE THEORY OF REGULAR CHAINS ');
insert into ARTICLE values (3,' Recommending Meta-Heuristics for the Flowshop Problem via Meta-Learning: Analysis and Design');
insert into ARTICLE values (4,' New Initialisation Techniques for Multi-objective Local Search');
insert into ARTICLE values (5,'AN INDUCTIVE INFERENCE MACHINE');


insert into ECRIT values (3, 2);
insert into ECRIT values (1, 1);
insert into ECRIT values (2, 4);
insert into ECRIT values (4, 3);
insert into ECRIT values (1, 5);


insert into MOTS_CLES values (1,'COMPUTER SCIENCE');
insert into MOTS_CLES values (2,'STATISC');
insert into MOTS_CLES values (3,'OPTIMISATION');
insert into MOTS_CLES values (4,'ALGEBRA');
insert into MOTS_CLES values (5,'TASK ANALYSIS');


insert into APPARTIENT values (3,1);
insert into APPARTIENT values (2,2);
insert into APPARTIENT values (1,1);
insert into APPARTIENT values (4,3);
insert into APPARTIENT values (5,4);
insert into APPARTIENT values (3,5)

insert into STATUT_ARTICLE values (1, 'accepté');
Insert into STATUT_ARTICLE values (2, 'refusé') ;
Insert into STATUT_ARTICLE values(3, 'soumis') ;
Insert into STATUT_ARTICLE values (4, 'en révision') ;


insert into POSSEDE values ( '27/11/2020' , 2, 3) ;
insert into POSSEDE values ( '02/12/2020' , 1, 1) ;
insert into POSSEDE values ( '18/02/2019' , 3, 3) ;
insert into POSSEDE values ( '27/03/2019' , 2, 1) ;
insert into POSSEDE values ( '10/04/2019' , 4, 3) ;
insert into POSSEDE values ( '30/05/2019' , 3, 4) ;
insert into POSSEDE values ( '27/06/2019' , 4, 2) ;
insert into POSSEDE values ( '06/11/2019' , 5, 2) ;
insert into POSSEDE values ( '06/11/2019' , 5, 3) ;
insert into POSSEDE values ( '06/11/2019' , 1, 3) ;

insert into CONFERENCE values (1, 'Congress on Evolutionary Computation (CEC)',2017,4);
insert into CONFERENCE values (2, 'CONFERENCE TURING',2009,3);
insert into CONFERENCE values (3, 'CONFERENCE GAUSS',2016,2);
insert into CONFERENCE values (4, 'Brazilian Conference on Intelligent Systems (BRACIS)',2018,5);
insert into CONFERENCE values (5, 'International Conference on Parallel Problem Solving from Nature',2020,7);



insert into PUBLIE_1 values ('19-10-2017',1,2);
insert into PUBLIE_1 values ('17-12-2018',3,4);
insert into PUBLIE_1 values ('17-12-2018',2,1);



insert into LIVRE values (1,'OPTIMIZATION', 'FRACTALE');
insert into LIVRE values (2,'MACHINE LEARNING', 'VUIBERT');
insert into LIVRE values (3,'THEORIE DE LIE', 'RAITON');
insert into LIVRE values (4,'MESURE ET INTEGRATION', 'BLUE');
insert into LIVRE values (5,'International Journal of 3-D Information Modeling (IJ3DIM)', 'BLUE');


insert into PUBLIE_2 values ('2017-10-19',1 ,2);


insert into THESE values (1,'UNIVERSITÉ DE METZ', 2017);
insert into THESE values (2,'UNIVERSITÉ DE LYON', 2017);
insert into THESE values (3,'UNIVERSITÉ DE WASHINGTON', 2017);
insert into THESE values (4,'UNIVERSITÉ DU CAP', 2018);


insert into PUBLIE_3 values ('2017-10-21', 1 , 1 );
insert into PUBLIE_3 values ('2017-06-21', 2 , 3 );


insert into REVUE_SCIENTIFIQUE values (1, 'BOUKHAROV', 2017);
insert into REVUE_SCIENTIFIQUE values (2, 'ALKWARIZMI', 2017);
insert into REVUE_SCIENTIFIQUE values (3, 'XHOSA', 2017);



insert into PUBLIE_4 values ('2017-10-06', 5,2);
insert into PUBLIE_4 values ('2017-06-08', 4,3);


