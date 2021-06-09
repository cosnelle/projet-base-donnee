<?php
$connect = pg_connect ("host=serveur-etu.polytech-lille.fr  user=cdjoumek password=postgres  dbname=gestion_publications");
     if (!$connect){
        echo "erreur de connexion";
        exit;
     }
    $type=$_POST['typeArt'];
    if ($type == 'livre'){
            $request = "SELECT  titre_art, titre_l ,  nom_ch  FROM article, publie_2 , livre, chercheur, ecrit WHERE publie_2.p2_article = article.id_art AND publie_2.p2_livre = livre.id_l AND ecrit.e_article = article.id_art AND ecrit.e_chercheur = chercheur.id_ch";
            $result = pg_query ($connect, $request);
            if ($result){ 
               echo "<h1> livres </h1>"; 
               echo "<table border=1>";
               echo "<tr>";
               echo "<th> titre_art </th>";
               echo "<th> titre_l </th>";
               echo "<th> nom_ch </th>";
               echo "</tr>";
    
    
       /* tant qu'il y'a de resultat dans la requête chaque ligne est mise dans la variable $ligne qui est un tableau */
              while ($ligne = pg_fetch_array($result)){
    
            /* chacun des valeurs des champs pour cette ligne est mise dans une variable */
                $titre_art = $ligne['titre_art']; 
                $titre_l = $ligne['titre_l'];
                $nom_ch = $ligne['nom_ch'];
    
            /* ces valeurs sont ensuites mise dans le tableau*/
                echo "<tr>";
                echo "<td> $titre_art </td>";
                echo "<td> $titre_l </td>";
                echo "<td> $nom_ch </td>";
                echo "</tr>";
              }
              echo "</table>"; 
         }
         else {
           echo "erreur SQL\n";
           exit;
        }
   }



    else if ($type == 'conference'){ 
     $request = "SELECT titre_art,nom_ch, titre_c, annee_c FROM article, publie_1, conference, chercheur, ecrit  WHERE publie_1.p1_article = article.id_art AND publie_1.p1_conference = conference.id_c AND ecrit.e_article= article.id_art AND ecrit.e_chercheur= chercheur.id_ch";
     $result = pg_query ($connect, $request);
     if($result){ 
       echo "<h1> conference  </h1>"; 
       echo "<table border=1>";
       echo "<tr>";
       echo "<th> titre_art </th>";
       echo "<th> titre_c </th>";
       echo "<th> annee_c </th>";
       echo "<th> nom_ch </th>";
       echo "</tr>";
    
    
       /* tant qu'il y'a de resultat dans la requête chaque ligne est mise dans la variable $ligne qui est un tableau */
       while ($ligne = pg_fetch_array($result)){
    
            /* chacun des valeurs des champs pour cette ligne est mise dans une variable */
            $titre_art = $ligne['titre_art']; 
            $titre_c = $ligne['titre_c'];
            $annee_c = $ligne['annee_c'];
            $nom_ch = $ligne['nom_ch'];
    
            /* ces valeurs sont ensuites mise dans le tableau*/
            echo "<tr>";
            echo "<td> $titre_art </td>";
            echo "<td> $titre_c </td>";
            echo "<td> $annee_c </td>";
            echo "<td> $nom_ch </td>";
            echo "</tr>";
       }
       echo "</table>";
    }

    else {
       echo "erreur SQL\n";
       exit;
    }
  }

   
        
      
        
        else if ($type = 'these'){
                $request = "SELECT titre_art, universite, annee, nom_ch FROM article, publie_3 , these, chercheur, ecrit WHERE  publie_3.p3_article = article.id_art AND publie_3.p3_these = these.id_t AND ecrit.e_article = article.id_art AND ecrit.e_chercheur = chercheur.id_ch";
                $result = pg_query ($connect, $request);
                if ($result){ 
                 echo "<h1> these </h1>"; 
                 echo "<table border=1>";
                 echo "<tr>";
                 echo "<th> titre_art </th>";
                 echo "<th> universite </th>";
                 echo "<th> annee </th>";
                 echo "<th> nom_ch </th>";
                 echo "</tr>";
    
    
        /*tant qu'il y'a de resultat dans la requête chaque ligne est mise dans la variable $ligne qui est un tableau */
                 while ($ligne = pg_fetch_array($result)){ 
    
            /* chacun des valeurs des champs pour cette ligne est mise dans une variable */
                    $titre_art = $ligne['titre_art']; 
                    $universite = $ligne['universite'];
                    $annee = $ligne['annee'];
                    $nom_ch = $ligne['nom_ch']; 
    
            /* ces valeurs sont ensuites mise dans le tableau*/
                    echo "<tr>";
                    echo "<td> $titre_art </td>";
                    echo "<td> $universite </td>";
                    echo "<td> $annee </td>";
                    echo "<td> $nom_ch </td>";
                   echo "</tr>"; 
              }
               echo "</table>"; 
            }

            else {
              echo "erreur SQL\n";
              exit;
            }
      } 


             else if ( $type = 'revue_scientifique'){
                   $request = "SELECT titre_art, titre_rs, annee_rs, nom_ch FROM article, publie_4, revue_scientifique, chercheur, ecrit  WHERE publie_4.p4_article = article.id_art AND publie_4.p4_revue_scientifique = revue_scientifique.id_rs AND ecrit.e_article = article.id_art AND ecrit.e_chercheur = chercheur.id_ch ";
                  $result = pg_query ($connect, $request);
                  if ($result){ 
                     echo "<h1> revue-scientifique </h1>"; 
                     echo "<table border=1>";
                     echo "<tr>";
                     echo "<th> titre_art </th>";
                     echo "<th> titre_rs </th>";
                     echo "<th> annee_rs </th>";
                     echo "<th> nom_ch </th>";
                     echo "</tr>";
    
    
       /* tant qu'il y'a de resultat dans la requête chaque ligne est mise dans la variable $ligne qui est un tableau */
                    while ($ligne = pg_fetch_array($result)){
    
            /* chacun des valeurs des champs pour cette ligne est mise dans une variable */
                        $titre_art = $ligne['titre_art']; 
                        $titre_rs = $ligne['titre_rs'];
                        $annee_rs = $ligne['annee_rs'];
                        $nom_ch = $ligne['nom_ch'];
    
            /* ces valeurs sont ensuites mise dans le tableau*/
                        echo "<tr>";
                        echo "<td> $titre_art </td>";
                        echo "<td> $titre_rs </td>";
                        echo "<td> $annee_rs </td>";
                        echo "<td> $nom_ch </td>";
                        echo "</tr>";
                    }
                   echo "</table>";
               }
               else {
                   echo "erreur SQL\n";
                   exit;
               }
          } 
 ?>
  




