-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 17-Nov-2023 às 16:17
-- Versão do servidor: 10.6.12-MariaDB-0ubuntu0.22.04.1
-- versão do PHP: 8.1.2-1ubuntu2.14

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

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `filhos`
--

CREATE TABLE `filhos` (
  `filho_id` int(11) NOT NULL,
  `filho_nome` varchar(20) NOT NULL,
  `pai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `filhos`:
--   `pai`
--       `pais` -> `pai_id`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `pais`:
--

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


--
-- AUTO_INCREMENT de tabela `pais`
--


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
