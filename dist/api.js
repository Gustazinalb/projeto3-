export const buscarProdutos = async () => {
    const resposta = await fetch("./api/produtos.php");
    if (!resposta.ok) {
        throw new Error("Não foi possível acessar a API.");
    }
    const dados = await resposta.json();
    if (!Array.isArray(dados)) {
        throw new Error("A API não retornou uma lista de produtos.");
    }
    return dados;
};
