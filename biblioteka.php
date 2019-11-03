<?php
session_start();
require_once 'database.php';

header("Cache-Control: max-age=300, must-revalidate");      //zabezpieczenie przed 'the page has expired error'

if(!isset($_SESSION['logged_id'])){   

if (isset($_POST['login'])) {
    
    $login = filter_input(INPUT_POST, 'login');
    $password = filter_input(INPUT_POST, 'pass');
    //$password_hash = password_hash($password, PASSWORD_DEFAULT);
    
    
    $userQuery = $db->prepare('SELECT id_user, haslo FROM users WHERE login = :login');
    $userQuery->bindValue(':login', $login, PDO::PARAM_STR);
    $userQuery->execute();
    
    
    $user = $userQuery->fetch();
   

        if($user && password_verify($password, $user['haslo'])) {
            $_SESSION['logged_id'] = $user['id_user'];                        //logged_id
            unset($_SESSION['bad_attempt']);
            
        } else {
            $_SESSION['bad_attempt'] = true;
            header('Location: index.php');
            
            exit();
        }
        
} else {
    
    header('Location: index.php');
    exit();
}
}

// Pobierz karta użytkownika
$wszystkieQuery = $db->prepare('SELECT * FROM karta WHERE id_hodowcy = :logged_id AND usun != 1 ORDER BY status ASC, kurnik ASC');
$wszystkieQuery->bindValue(':logged_id', $_SESSION['logged_id'], PDO::PARAM_INT);
$wszystkieQuery->execute();

$wszystkie = $wszystkieQuery->fetchAll();
?>


<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dostępne książki</title>
</head>
<body>

<div>
<h1>Dostępne książki</h1>
</div>
<table>
        <thead>
                      <tr>
                      <th colspan="5">Łącznie rekordów: <?= $wszystkieQuery->rowCount()?></th></tr>
                      <tr><th>data wstawienia</th>
                      <th>numer karty</th>
                      <th>rasa</th>
                      <th>kurnik</th>
                      <th>ilość wstawiona [szt]</th>
                      <th>% upadków</th>
                      <th>wylęgarnia</th>
                      <th>powierzchnia kurnika [m^2]</th>
                      <th>numer faktury</th>
                      <th>stado reprodukcyjne</th>
                      <th>nr WZ </th>
                      </tr>
                  </thead>
                  <tbody>
                      <?php
                      foreach ($wszystkie as $rząd) {

                                    // Pobierz wylegarnie
                                $dostepneQuery = $db->prepare('SELECT * FROM `ksiazki` WHERE sztuki > 0 AND id_ksiazki = :id');
                                $dostepneQuery->bindValue(':id', $wszystkie["id_ksiazki"], PDO::PARAM_INT);
                                $dostepneQuery->execute();

                                $dostepne = $dostepneQuery->fetchAll(); 

                                
// pobierz karta -> wyciągnij dane z każdego dnia -> wypisz -> pobierz następny karta 
                        
                            
                            // Pobierz z karty padłe i selekcja 
                        $dniQuery = $db->prepare('SELECT padle, selekcja FROM `dane` WHERE id_karta= :id_karta');
                        $dniQuery->bindValue(':id_karta', $karta["id"], PDO::PARAM_INT);
                        $dniQuery->execute();

                        $dni = $dniQuery->fetchAll(); 
                           

                            $narast= 0;
                        // sumy padłych
                            foreach ($dni as $dzien) {

                                $razem = $dzien ['padle'] + $dzien ['selekcja'];
                                $narast = $narast + $razem;                                                            
                            }

                        // jeśli wstawione != 0,  podaj procent upadków zaokrąglony do 2 miejsca
                            if ($karta ['ilosc'] != 0) {
                                $p_upadki = round($narast / $karta ['ilosc'] * 100, 1); 
                            } else {
                                $p_upadki = "-";
                            }


                            if ($status == 1){
                                echo '<tr style=" background-color: lightgrey;">';
                            }  else { echo "<tr>";}
                            
                            
                            echo
                            "
                                                        
                            
                            <td><a href='dni.php?id_karta={$karta['id']}'> {$karta ['data']}</a></td> 
                            <td>{$karta ['id']}</td>
                            <td>{$rasa [0][1]}</td>
                            <td>{$karta ['kurnik']}</td>
                            <td>{$karta ['ilosc']}</td>
                            <td>{$p_upadki}%</td>
                            <td>{$wylegarnia[0][1]}</td>
                            <td>{$karta ['powierzchnia']}</td>
                            <td>{$karta ['nr_faktury']}</td>
                            <td>{$karta ['stado']}</td>
                            <td>{$karta ['nr_wz']}</td>
                            ";
                            
                            if ($status == 1){
                                echo "
                                <td></td>
                                <td><a href='karta-zamknij-dodaj.php?id_karta={$karta['id']}'>otwórz kartę</a></td>
                                <td><a href='makepdf.php?id_karta={$karta['id']}'>utwórz pdf</a></td>
                                ";
                            } else {
                                echo
                            

                            "
                            <td><a href='karta-modyf.php?id_karta={$karta['id']}'>modyfikuj</a></td>
                            <td><a href='karta-zamknij-dodaj.php?id_karta={$karta['id']}'>zamknij kartę</a></td>
                            <td><a href='makepdf.php?id_karta={$karta['id']}'>utwórz pdf</a></td>
                                </tr>
                               
                            ";}
                        } 
                        ?>
                  </tbody>
              </table>    


</body>
</html>