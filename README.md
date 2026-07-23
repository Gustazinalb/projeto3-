# Proj_TDS_2bi

<div class="cabeçalio">
                <h2>Vodka</h2>
            </div>
            <div class="container">
                <div class="item">
                    <img src="img/balalaika.png" alt="">
                    <h2>Balalaika</h2>
                </div>
                <div class="item">
                    <img src="img/ciroc.png" alt="">
                    <h2>Ciroc</h2>
                </div>
                <div class="item">
                    <img src="img/vodka.png" alt="">
                    <h2>Intencion</h2>
                </div>
                <div class="item">
                    <img src="img/skyy.png" alt="">
                    <h2>Skyy</h2>
                </div>
            </div>


            include("config.php");

$sql = "SELECT * FROM produtos";

$resultado = mysqli_query($config, $sql);
?>
    <main>
    <div class="container-produtos">

<?php
while($produto = mysqli_fetch_assoc($resultado)){
?>

    <div class="produto">
        <img src="img/<?php echo $produto['imagem']; ?>">

        <h3>
            <?php echo $produto['nome']; ?>
        </h3>

        <p>
            R$ <?php echo $produto['preco']; ?>
        </p>

        <p>
            <?php echo $produto['descricao']; ?>
        </p>
    </div>

<?php
}
?>
