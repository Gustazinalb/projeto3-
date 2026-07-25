<?php

session_start();

if(!isset($_SESSION['admin'])){

    header("Location: admin.php");
    exit;

}

include 'header.php';
?>

<div class="container mt-5">

    <h1>Painel Administrativo</h1>

    <hr>

    <h3>Bem-vindo administrador!</h3>

    <a href="logout.php" class="btn btn-danger">
        Sair
    </a>

</div>

<footer class="footer">
    <?php 
        include 'footer.php'; 
    ?>
</footer>