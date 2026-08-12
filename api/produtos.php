<?php

header('Content-Type: application/json; charset=utf-8');

require_once '../config.php';

try {

    $resultado = $conexao->query("CALL BuscarProdutos()");

    if (!$resultado) {
        throw new Exception("Erro ao buscar produtos.");
    }

    $produtos = [];

    while ($produto = $resultado->fetch_assoc()) {

        $produtos[] = [
            'id_produto' => (int) $produto['id_produto'],
            'nome_produto' => $produto['nome_produto'],
            'preco' => (float) $produto['preco'],
            'estoque' => (int) $produto['estoque'],
            'imagem' => $produto['imagem'],
            'id_categoria' => (int) $produto['id_categoria'],
            'nome_categoria' => $produto['nome_categoria']
        ];
    }

    $resultado->free();

    while ($conexao->more_results()) {
        $conexao->next_result();
    }

    echo json_encode(
        $produtos,
        JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );

} catch (Exception $erro) {

    http_response_code(500);

    echo json_encode([
        'erro' => true,
        'mensagem' => $erro->getMessage()
    ], JSON_UNESCAPED_UNICODE);
}