<?php
$connect = pg_connect ("host=serveur-etu.polytech-lille.fr  user=cdjoumek password=postgres  dbname=gestion_publications");
     if (!$connect){
        echo "erreur de connexion";
        exit;
     }

     $titre=$_POST['titre_art'] ;
     $etat=$_POST['nouveauEtat_art'] ;
     $request= "UPDATE STATUT_ARTICLE NATURAL JOIN POSSEDE NATURAL JOIN ARTICLE SET libelle_sart=’$etat’  WHERE titre_art= ‘ $titre ' " ;

    if (pg_query($connect,$request) {
         echo "Modification réussie " ;
    }
    else {
         echo « erreur » ;
    }

?>
