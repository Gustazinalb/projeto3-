<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>BRASA-BAR - Admin</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>

    <link rel="stylesheet" href="styles.css">

</head>

<body>
<?php
session_start();

if(isset($_SESSION['admin'])){
    header("Location: dashboard.php");
    exit;
}

include 'header.php';
?>

<link rel="stylesheet" href="admin.css">

<section class="admin-container">

    <div class="login-card">

        <img src="img/logo.png" class="logo-admin">

        <h1><span>BRASA</span>-BAR</h1>
        <h3>Painel Administrativo</h3>

        <form id="loginForm" action="login.php" method="POST">

            <div class="campo">

                <label>Usuário</label>

                <div class="input-box">

                    <i class="fa-solid fa-user"></i>

                    <input
                        type="text"
                        name="usuario"
                        placeholder="Digite seu usuário"
                        required
                    >

                </div>

            </div>

            <div class="campo">

                <label>Senha</label>

                <div class="input-box">

                    <i class="fa-solid fa-lock"></i>

                    <input
                        type="password"
                        id="senha"
                        name="senha"
                        placeholder="Digite sua senha"
                        required
                    >

                    <span id="mostrarSenha">
                        <i class="fa-solid fa-eye"></i>
                    </span>

                </div>

            </div>

            <button type="submit" class="btn-login">
                Entrar
            </button>

        </form>

        <p class="restrito">
            🔒 Acesso restrito. Apenas administradores.
        </p>

    </div>

</section>

<script src="admin.js"></script>

<footer class="footer">
    <?php 
        include 'footer.php'; 
    ?>
</footer>
</body>

</html>