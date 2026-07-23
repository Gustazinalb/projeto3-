-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/06/2026 às 02:55
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome_categoria` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome_categoria`, `descricao`) VALUES
(1, 'Whisky', 'Bebidas destiladas'),
(2, 'Vinho', 'Vinhos nacionais e importados'),
(3, 'Cerveja', 'Cervejas artesanais'),
(4, 'Whisky', NULL),
(5, 'Cerveja', NULL),
(6, 'Gin', NULL),
(7, 'Vodka', NULL),
(8, 'Vinho', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `id_contato` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `data_envio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cronograma`
--

CREATE TABLE `cronograma` (
  `id_cronograma` int(11) NOT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `horario_inicio` time DEFAULT NULL,
  `horario_fim` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cronograma`
--

INSERT INTO `cronograma` (`id_cronograma`, `dia_semana`, `titulo`, `descricao`, `horario_inicio`, `horario_fim`) VALUES
(1, 'Sexta-feira', 'Happy Hour', 'Promoções especiais', '18:00:00', '22:00:00'),
(2, 'Sábado', 'Noite do Sertanejo', 'Música ao vivo', '20:00:00', '23:59:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `nome`, `descricao`, `preco`, `estoque`, `imagem`, `id_categoria`) VALUES
(1, 'Jack Daniels', 'Whisky Tennessee', 149.90, 20, NULL, 1),
(2, 'Vinho Chileno Reservado', 'Vinho tinto seco', 79.90, 15, NULL, 2),
(3, 'Heineken Long Neck', 'Cerveja Premium', 8.99, 100, NULL, 3),
(4, 'Jack Daniels', 'Whisky Jack Daniels', 149.90, 0, 'jack-daniels.png', 1),
(5, 'Chivas Regal', 'Whisky Chivas Regal', 169.90, 0, 'chivas.png', 1),
(6, 'Jack Daniels Apple', 'Whisky sabor maçã', 159.90, 0, 'jack-apple.png', 1),
(7, 'Red Label', 'Whisky Johnnie Walker Red Label', 99.90, 0, 'red-label.png', 1),
(8, 'Skol', 'Cerveja Skol', 4.99, 0, 'skol.png', 2),
(9, 'Original', 'Cerveja Original', 6.99, 0, 'original.png', 2),
(10, 'Itaipava', 'Cerveja Itaipava', 4.50, 0, 'itaipava.png', 2),
(11, 'Antarctica', 'Cerveja Antarctica', 5.99, 0, 'antarctica.png', 2),
(12, 'Gordon\'s', 'Gin Gordon\'s', 89.90, 0, 'gordons.png', 3),
(13, 'Intencion Blue', 'Gin Intencion Blue', 69.90, 0, 'intencion-blue.png', 3),
(14, 'Intencion Pink', 'Gin Intencion Pink', 69.90, 0, 'intencion-pink.png', 3),
(15, 'Rocks', 'Gin Rocks', 79.90, 0, 'rocks.png', 3),
(16, 'Balalaika', 'Vodka Balalaika', 24.90, 0, 'balalaika.png', 4),
(17, 'Ciroc', 'Vodka Ciroc', 199.90, 0, 'ciroc.png', 4),
(18, 'Intencion Vodka', 'Vodka Intencion', 39.90, 0, 'intencion-vodka.png', 4),
(19, 'Skyy', 'Vodka Skyy', 59.90, 0, 'skyy.png', 4),
(20, 'Pérola', 'Vinho Pérola', 49.90, 0, 'perola.png', 5),
(21, 'San Severo', 'Vinho San Severo', 54.90, 0, 'san-severo.png', 5),
(22, 'Quinta Moraes', 'Vinho Quinta Moraes', 64.90, 0, 'quinta-moraes.png', 5),
(23, 'Reservado', 'Vinho Reservado', 59.90, 0, 'reservado.png', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `cargo` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `senha`, `cargo`) VALUES
(1, 'gustavo', 'gustazin.2501.albuquerque@gmail.com', '123456', 'Admin');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id_contato`);

--
-- Índices de tabela `cronograma`
--
ALTER TABLE `cronograma`
  ADD PRIMARY KEY (`id_cronograma`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id_contato` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cronograma`
--
ALTER TABLE `cronograma`
  MODIFY `id_cronograma` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
