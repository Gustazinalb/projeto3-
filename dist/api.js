export const buscarProdutos = async () => {
    try {
        const resposta = await fetch("./api/produtos.php");
        if (!resposta.ok) {
            throw new Error("Não foi possível acessar a API.");
        }
        const produtos = await resposta.json();
        return produtos;
    }
    catch (erro) {
        console.error("Erro ao buscar produtos:", erro);
        return [];
    }
};
