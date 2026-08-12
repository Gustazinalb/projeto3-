export const calcularEstoqueTotal = (produtos) => {
    return produtos.reduce((total, produto) => {
        return total + produto.estoque;
    }, 0);
};
export const calcularValorEstoque = (produtos) => {
    return produtos.reduce((total, produto) => {
        return total + (produto.preco * produto.estoque);
    }, 0);
};
export const filtrarEstoqueCritico = (produtos) => {
    return produtos.filter((produto) => {
        return produto.estoque <= 5;
    });
};
export const formatarProdutos = (produtos) => {
    return produtos.map((produto) => {
        return `${produto.nome_produto} - R$ ${produto.preco.toFixed(2)}`;
    });
};
export const encontrarProdutoMaisCaro = (produtos) => {
    if (produtos.length === 0) {
        return null;
    }
    return produtos.reduce((maior, produto) => {
        if (produto.preco > maior.preco) {
            return produto;
        }
        return maior;
    });
};
