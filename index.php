<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brasa-bar</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="styles.css">
    
</head>


<body>
    <?php 
        include 'header.php'; 
    ?>
</body>
<main>
        <div>
            <img src="img/home.png" alt="fundo">
            
                <a href="catalogo.php" class="botao botao-laranja">VER CATÁLOGO</a>
                <a href="cronograma.php" class="botao botao-borda">VER EVENTOS</a>
            
        </div>
</main>
<footer class="footer">

    <div class="footer-logo">
        <h2>BRASA-BAR</h2>
        <p>Onde cada noite tem uma história.</p>
    </div>

    <div class="footer-contato">
        <span>📍 Campo Mourão - PR</span>
        <span>📞 (44) 99714-9528</span>
        <span>📸 @brasa-bar</span>
    </div>

    <nav class="footer-menu">
        <a href="index.php">Home</a>
        <a href="catalogo.php">Catálogo</a>
        <a href="cronograma.php">Cronograma</a>
        <a href="contato.php">Contato</a>
    </nav>

    <div class="footer-copy">
        © 2026 Brasa-bar - Todos os direitos reservados
    </div>

</footer>

</html>