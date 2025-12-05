-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 05-Dez-2025 às 16:03
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_academia`
--
CREATE DATABASE IF NOT EXISTS `bd_academia` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_academia`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `CPF` varchar(16) NOT NULL,
  `Nome` varchar(50) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telefone` varchar(15) NOT NULL,
  `Idade` int(2) NOT NULL,
  `Altura` double(3,2) NOT NULL,
  `Peso` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CPF`, `Nome`, `Email`, `Telefone`, `Idade`, `Altura`, `Peso`) VALUES
('123.456.789-00', 'João Luiz', 'Joaoluiz@gmail.com', '(14) 99067-5671', 16, 1.83, 86.42),
('454.768.899-79', 'Emerminho', 'Emerminho07', '(03) 00303-3003', 16, 1.97, 89.32),
('534.798.565-09', 'Nicolas', 'Nicolasaugtoreli@gmail.com', '(14) 99045-7834', 16, 1.71, 76.61),
('545.867.998-97', 'Emerson', 'Emersongotardi06@gmail.com', '(14) 99903-2595', 16, 1.87, 85.55);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
CREATE TABLE `itens_venda` (
  `Cod_Item` varchar(11) NOT NULL,
  `Valor_Item` double(7,2) NOT NULL,
  `Quantidade` varchar(3) NOT NULL,
  `IdServico` int(11) NOT NULL,
  `Id_Vendas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE `servico` (
  `Id` int(11) NOT NULL,
  `Nutricao` varchar(50) NOT NULL,
  `AvaliacaoFisica` varchar(30) NOT NULL,
  `CodPersonalTrainer` int(3) NOT NULL,
  `ValServico` float(5,2) NOT NULL,
  `Suplementos` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`Id`, `Nutricao`, `AvaliacaoFisica`, `CodPersonalTrainer`, `ValServico`, `Suplementos`) VALUES
(1230, 'Carnivora', 'Acima da Média', 31, 10.00, 'Nenhum'),
(1231, 'Padrão', 'Apta', 2, 24.00, 'Nenhum'),
(1232, 'Padrão', 'Apta', 3, 25.00, 'Nenhum'),
(1233, 'Padrão', 'Abaixo da Média', 4, 26.00, 'Testosterona'),
(1234, 'Padrão', 'Apta', 1, 23.00, 'Creatina'),
(1235, 'Carnivora', 'Acima da Média', 5, 27.00, 'Testosterona'),
(1236, 'Vegetariana', 'Apta', 6, 28.00, 'Creatina'),
(1237, 'Padrão', 'Apta', 7, 29.00, 'Trembolona'),
(1238, 'Vegetariana', 'Abaixo da Média', 8, 30.00, 'Nenhum'),
(1239, 'Vegetariana', 'Acima da Média', 9, 31.00, 'Nenhum');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `Login` varchar(20) NOT NULL,
  `Senha` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`Login`, `Senha`) VALUES
('', ''),
('Ermin', '321');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE `vendas` (
  `Id_Vendas` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Valor` double(7,2) NOT NULL,
  `CPF_Cliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CPF`);

--
-- Índices para tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD PRIMARY KEY (`Cod_Item`),
  ADD KEY `IdServico` (`IdServico`),
  ADD KEY `Id_Vendas` (`Id_Vendas`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`Id`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Login`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`Id_Vendas`),
  ADD KEY `CPF_Cliente` (`CPF_Cliente`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1240;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `Id_Vendas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `itens_venda`
--
ALTER TABLE `itens_venda`
  ADD CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`IdServico`) REFERENCES `servico` (`Id`),
  ADD CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`Id_Vendas`) REFERENCES `vendas` (`Id_Vendas`);

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`CPF_Cliente`) REFERENCES `cliente` (`CPF`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
