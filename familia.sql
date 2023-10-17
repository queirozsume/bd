-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Out-2023 às 12:44
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `familia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `filhos`
--

CREATE TABLE `filhos` (
  `filho_id` int(11) NOT NULL,
  `filho_nome` varchar(20) NOT NULL,
  `pai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `filhos`
--

INSERT INTO `filhos` (`filho_id`, `filho_nome`, `pai`) VALUES
(1, 'zezinho', 1),
(2, 'zefinha', 1),
(3, 'joãozinho', 2),
(4, 'joaninha', 2),
(5, 'chiquinho', 3),
(6, 'chiquinha', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

CREATE TABLE `pais` (
  `pai_id` int(11) NOT NULL,
  `pai_nome` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`pai_id`, `pai_nome`) VALUES
(1, 'José'),
(2, 'João'),
(3, 'Francisco');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `filhos`
--
ALTER TABLE `filhos`
  ADD PRIMARY KEY (`filho_id`),
  ADD KEY `fk_pai` (`pai`);

--
-- Índices para tabela `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`pai_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filhos`
--
ALTER TABLE `filhos`
  MODIFY `filho_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pais`
--
ALTER TABLE `pais`
  MODIFY `pai_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `filhos`
--
ALTER TABLE `filhos`
  ADD CONSTRAINT `fk_pai` FOREIGN KEY (`pai`) REFERENCES `pais` (`pai_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
