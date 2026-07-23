<?php
include 'config.php'; // Inclua o arquivo de conexão com o banco de dados

// Verifica se há uma consulta de pesquisa
if (isset($_GET['query'])) {
    $query = htmlspecialchars($_GET['query']); // Sanitiza a entrada do usuário

    // Consulta SQL para buscar produtos com base na categoria ou nome
    $sql = "SELECT * FROM produtos WHERE categoria LIKE ? OR nome LIKE ?";
    $stmt = $conn->prepare($sql);
    $searchTerm = "%$query%";
    $stmt->bind_param("ss", $searchTerm, $searchTerm);
    $stmt->execute();
    $result = $stmt->get_result();

    // Exibe os resultados
    echo "<h1>Resultados da pesquisa para: " . $query . "</h1>";
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            echo "<div>";
            echo "<h2>" . $row['nome'] . "</h2>";
            echo "<p>Categoria: " . $row['categoria'] . "</p>";
            echo "<p>Preço: R$" . $row['preco'] . "</p>";
            echo "</div>";
        }
    } else {
        echo "<p>Nenhum resultado encontrado.</p>";
    }
} else {
    echo "<p>Por favor, insira um termo de pesquisa.</p>";
}
?>
