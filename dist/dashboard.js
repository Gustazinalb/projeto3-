import { buscarProdutos } from "./api.js";
import { calcularEstoqueTotal, calcularValorEstoque, filtrarEstoqueCritico, formatarProdutos, encontrarProdutoDestaque } from "./calculos.js";
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
    const listaEstoqueCritico = document.querySelector("#listaEstoqueCritico");
    if (!totalProdutos ||
        !totalEstoque ||
        !valorEstoque ||
        !estoqueCritico ||
        !produtoDestaque ||
        !listaEstoqueCritico) {
        console.error("Elementos da Dashboard não foram encontrados.");
        return;
    }
    try {
        const produtos = await buscarProdutos();
        if (produtos.length === 0) {
            totalProdutos.textContent = "0";
            totalEstoque.textContent = "0";
            valorEstoque.textContent = "R$ 0,00";
            estoqueCritico.textContent = "0";
            produtoDestaque.textContent =
                "Nenhum produto";
            return;
        }
        /*
         * REDUCE
         * Calcula o estoque total.
         */
        const estoqueTotal = calcularEstoqueTotal(produtos);
        /*
         * REDUCE
         * Calcula o valor total do estoque.
         */
        const valorTotal = calcularValorEstoque(produtos);
        /*
         * FILTER
         * Encontra produtos com estoque crítico.
         */
        const produtosCriticos = filtrarEstoqueCritico(produtos);
        if (produtosCriticos.length === 0) {
            listaEstoqueCritico.innerHTML = `
        <p class="sem-criticos">
            Nenhum produto com estoque crítico.
        </p>
    `;
        }
        else {
            listaEstoqueCritico.innerHTML =
                produtosCriticos
                    .map((produto) => {
                    return `
                    <div class="produto-critico">

                        <div>
                            <strong>
                                ${produto.nome_produto}
                            </strong>

                            <span>
                                ${produto.nome_categoria}
                            </span>
                        </div>

                        <strong>
                            ${produto.estoque} unidades
                        </strong>

                    </div>
                `;
                })
                    .join("");
        }
        /*
         * MAP
         * Formata os produtos para apresentação.
         */
        const produtosFormatados = formatarProdutos(produtos);
        /*
         * RANKING
         * Encontra o produto com maior
         * valor armazenado em estoque.
         */
        const produtoDestaqueAtual = encontrarProdutoDestaque(produtos);
        /*
         * DASHBOARD
         */
        totalProdutos.textContent =
            produtos.length.toString();
        totalEstoque.textContent =
            estoqueTotal.toString();
        valorEstoque.textContent =
            formatarMoeda(valorTotal);
        estoqueCritico.textContent =
            produtosCriticos.length.toString();
        /*
         * PRODUTO DESTAQUE
         */
        if (produtoDestaqueAtual) {
            const valorDestaque = produtoDestaqueAtual.preco *
                produtoDestaqueAtual.estoque;
            produtoDestaque.textContent =
                `${produtoDestaqueAtual.nome_produto} - ${formatarMoeda(valorDestaque)}`;
        }
        else {
            produtoDestaque.textContent =
                "Nenhum produto";
        }
        /*
         * MAP FOI EXECUTADO.
         *
         * Mantemos o resultado pronto para futuras
         * informações da dashboard.
         */
        console.log("Produtos formatados:", produtosFormatados);
    }
    catch (erro) {
        console.error("Erro ao carregar a Dashboard:", erro);
        totalProdutos.textContent =
            "Erro";
        totalEstoque.textContent =
            "Erro";
        valorEstoque.textContent =
            "Erro";
        estoqueCritico.textContent =
            "Erro";
        produtoDestaque.textContent =
            "Não foi possível carregar os dados.";
    }
};
carregarDashboard();
