import { Produto } from "./tipos.js";

export const buscarProdutos = async (): Promise<Produto[]> => {

    try {

        const resposta = await fetch("./api/produtos.php");

        if (!resposta.ok) {
            throw new Error("Não foi possível acessar a API.");
        }

        const produtos: Produto[] = await resposta.json();

        return produtos;

    } catch (erro) {

        console.error("Erro ao buscar produtos:", erro);

        return [];
    }
};