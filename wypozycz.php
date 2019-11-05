<?php
session_start();
require_once 'database.php';

header("Cache-Control: max-age=300, must-revalidate");      //zabezpieczenie przed 'the page has expired error'

if(!isset($_SESSION['logged_id'])){   

    
    header('Location: index.php');
    exit();
}




$id_ksiazki =  htmlspecialchars($_GET['id_ksiazki'], ENT_QUOTES);
$czas = date("Y-m-d");


$ksiazkiQuery = $db->prepare('SELECT COUNT(id_czytelnika) FROM wypozyczenia where id_czytelnika =:logged_id AND termin_oddania =NULL');
$ksiazkiQuery->bindValue(':logged_id', $_SESSION['logged_id'], PDO::PARAM_INT);
$ksiazkiQuery->execute();

$ksiazki = $ksiazkiQuery->fetchAll();

if( $ksiazki[0][0] > 3 ){
    echo "Przekroczono limit wypożyczeń ";
} else {

    $query = $db->prepare
    ('INSERT INTO `wypozyczenia`
    (`id_wypozyczenia`, `id_ksiazki`, `id_czytelnika`,`termin_wypozyczenia`)
     VALUES 
     (NULL, 3, 1, NULL)');
$query->bindValue(':id_ksiazki', $id_ksiazki, PDO::PARAM_STR);
$query->bindValue(':id_czytelnika', $_SESSION['logged_id'], PDO::PARAM_STR);
$query->bindValue(':termin_wypozyczenia', $czas, PDO::PARAM_STR);

$query->execute();
echo"Wypozyczono książkę </br> <a href='biblioteka.php'>powrót</a>";

} 
;



?>
