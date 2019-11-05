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

$ksiazkiQuery = $db->prepare('SELECT * FROM ksiazki');
$ksiazkiQuery->execute();

$ksiazki = $ksiazkiQuery->fetchAll();





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
                      <th colspan="5">Łącznie pozycji: <?= $ksiazkiQuery->rowCount()?></th></tr>
                      <tr>
                      
                      <th></th>
                      <th>Tytuł</th>
                      <th>Autor</th>
                      <th>wydawnictwo</th>
                      <th>ISBN</th>
                      <th>sztuki</th>
                      
                      </tr>
                  </thead>
                  <tbody>
                      <?php
                      foreach ($ksiazki as $ksiazka) {
                        echo "                          
                            <tr>
                            
                            <td>{$ksiazka ['id_ksiazki']}</td>
                            <td>{$ksiazka ['tytul']}</td>
                            <td>{$ksiazka ['autor']}</td>
                            <td>{$ksiazka ['wydawnictwo']}</td>
                            <td>{$ksiazka['ISBN']}</td>
                            <td>{$ksiazka ['sztuki']}</td>
                            <td><a href='wypozycz.php?id_ksiazki={$ksiazka ['id_ksiazki']}'>Wypożycz!</a> 
                            </tr>
                            ";
                                                        
                            }
                         
                        ?>
                  </tbody>
              </table>    


</body>
</html>