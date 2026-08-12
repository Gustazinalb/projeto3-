import { buscarProdutos } from "./api.js";
import { calcularEstoqueTotal, calcularValorEstoque, filtrarEstoqueCritico, encontrarProdutoMaisCaro } from "./calculos.js";
const formatarMoeda = (valor) => {
    return valor.toLocaleString("pt-BR", {
        style: "currency",
        currency: "BRL"
    });
};
const carregarDashboard = async () => {
    const totalProdutos = document.querySelector("#totalProdutos");
    const totalEstoque = document.querySelector("#totalEstoque");
    const valorEstoque = document.querySelector("#valorEstoque");
    const estoqueCritico = document.querySelector("#estoqueCritico");
    const produtoDestaque = document.querySelector("#produtoDestaque");
    if (!totalProdutos ||
        !totalEstoque ||
        !valorEstoque ||
        !estoqueCritico ||
        !produtoDestaque) {
        console.error("Elementos da Dashboard não foram encontrados.");
        return;
    }
    const produtos = await buscarProdutos();
    if (produtos.length === 0) {
        totalProdutos.textContent = "0";
        totalEstoque.textContent = "0";
        valorEstoque.textContent = "R$ 0,00";
        estoqueCritico.textContent = "Nenhum produto";
        produtoDestaque.textContent = "Nenhum produto";
        return;
    }
    const estoqueTotal = calcularEstoqueTotal(produtos);
    const valorTotal = calcularValorEstoque(produtos);
    const produtosCriticos = filtrarEstoqueCritico(produtos);
    const produtoMaisCaro = encontrarProdutoMaisCaro(produtos);
    totalProdutos.textContent = produtos.length.toString();
    totalEstoque.textContent = estoqueTotal.toString();
    valorEstoque.textContent = formatarMoeda(valorTotal);
    estoqueCritico.textContent =
        produtosCriticos.length.toString();
    if (produtoMaisCaro) {
        produtoDestaque.textContent =
            `${produtoMaisCaro.nome_produto} - ${formatarMoeda(produtoMaisCaro.preco)}`;
    }
    else {
        produtoDestaque.textContent = "Nenhum produto";
    }
};
carregarDashboard();
