<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Logowanie</title>
</head>
<body>
    
<div class="container">

<header>
    <h1>Zaloguj się</h1>
</header>

<main>
    <article>
        <form method="post" action="biblioteka.php">
            <label>Login <input type="text" name="login"></label>
            <label>Hasło <input type="password" name="pass"></label>
            
            <input type="submit" value="Zaloguj się!">
            
            <?php
            if (isset($_SESSION['bad_attempt'])) {
                echo '<p>Niepoprawny login lub hasło! </p>';
                
                unset($_SESSION['bad_attempt']);
            }
            ?>
            
            
        </form>
    </article>
</main>

</div>


</body>
</html>