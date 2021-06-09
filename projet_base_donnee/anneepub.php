<?php
$connect = pg_connect ("host=serveur-etu.polytech-lille.fr  user=cdjoumek password=postgres  dbname=gestion_publications");
     if (!$connect){
        echo "erreur de connexion";
        exit;
     }
     $annee=$_POST['annee_publication'];
     $request= "SELECT distinct id_art, titre_art FROM article ,publie_1, publie_2, publie_3, publie_4 WHERE publie_1.p1_article = article.id_art AND publie_2.p2_article = article.id_art AND publie_3.P3_article = article.id_art AND publie_4.p4_article = article.id_art AND p1_date BETWEEN '$annee-01-01'  AND '$annee-12-31' OR p2_date BETWEEN '$annee-01-01'  AND '$annee-12-31' OR p3_date BETWEEN '$annee-01-01' AND '$annee-12-31' OR p4_date BETWEEN '$annee-01-01'  AND '$annee-12-31' ";
 
    $result = pg_query ($connect, $request); 
    if($result){ 
       echo "<h1> liste des publications dont vous avez selectionné l'année de publication </h1>"; 
       echo "<table border=1>";
       echo "<tr>";
       echo "<th> id_art </th>";
       echo "<th> titre_art </th>";
       echo "</tr>";
    
    
       /* tant qu'il y'a de resultat dans la requête chaque ligne est mise dans la variable $ligne qui est un tableau */
       while ($ligne = pg_fetch_array($result)){
    
            /* chacun des valeurs des champs pour cette ligne est mise dans une variable */
            $id_art = $ligne['id_art']; 
            $titre_art = $ligne['titre_art'];
           
    
            /* ces valeurs sont ensuites mise dans le tableau*/
            echo "<tr>";
            echo "<td> $id_art </td>";
            echo "<td> $titre_art </td>";
            echo "</tr>";
       }
       echo "</table>";
   }
   else {
       echo "erreur SQL\n";
       exit;
   }
   ?>
  





  




