-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/07/2024 às 20:14
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
-- Banco de dados: `atendimentos`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idAtendimento` int(11) NOT NULL,
  `idFormaAtendimento` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idpublico` int(11) NOT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `ativo` enum('S','N') NOT NULL,
  `respostaAtendimento` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `atendimento`
--

INSERT INTO `atendimento` (`idAtendimento`, `idFormaAtendimento`, `idUsuario`, `idpublico`, `dataCadastro`, `ativo`, `respostaAtendimento`) VALUES
(14, 3, 9, 6, '2024-07-15 07:20:34', 'S', 'Nome: felipe de almeida\r\nCPF: 055-334-320-05\r\nTelefone: (51) 934353885'),
(16, 2, 8, 2, '2024-07-15 18:05:39', 'S', 'Nome: joão fernando\r\nCPF: 054-677-860-04\r\nTelefone: (51) 918458912'),
(17, 4, 8, 1, '2024-07-15 18:09:59', 'S', 'Nome: Paulo Fernando\r\nCNPJ: 92.802.685/0001-08\r\nTelefone: (51) 931365452');

-- --------------------------------------------------------

--
-- Estrutura para tabela `formaatendimento`
--

CREATE TABLE `formaatendimento` (
  `idFormaAtendimento` int(11) NOT NULL,
  `nomeAtendimento` varchar(255) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `formaatendimento`
--

INSERT INTO `formaatendimento` (`idFormaAtendimento`, `nomeAtendimento`, `dataCadastro`) VALUES
(1, 'Presencial', '2024-07-13 20:14:45'),
(2, 'Whatsapp', '2024-07-13 20:14:54'),
(3, 'Ligação', '2024-07-13 20:15:07'),
(4, 'E-mail', '2024-07-13 20:15:18'),
(5, 'Redes Sociais', '2024-07-13 20:15:33'),
(6, 'TEAMS', '2024-07-13 20:15:43'),
(7, 'Outros', '2024-07-13 20:15:54');

-- --------------------------------------------------------

--
-- Estrutura para tabela `publico`
--

CREATE TABLE `publico` (
  `idpublico` int(11) NOT NULL,
  `nomepublico` varchar(255) DEFAULT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `publico`
--

INSERT INTO `publico` (`idpublico`, `nomepublico`, `dataCadastro`) VALUES
(1, 'Empregador', '2024-07-14 22:48:37'),
(2, 'Trabalhador', '2024-07-14 22:48:49'),
(3, 'Outras agências', '2024-07-14 22:50:05'),
(4, 'ADS', '2024-07-14 22:50:12'),
(5, 'Setores da FGTAS', '2024-07-14 22:50:36'),
(6, 'Interessados sobre o mercado de trabalho ', '2024-07-14 22:51:40'),
(7, 'Outra', '2024-07-14 22:51:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(255) NOT NULL,
  `emailUsuario` varchar(255) NOT NULL,
  `loginUsuario` varchar(255) NOT NULL,
  `senhaUsuario` varchar(255) NOT NULL,
  `dataCadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `telefoneCelular` varchar(45) NOT NULL,
  `ativo` enum('S','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nomeUsuario`, `emailUsuario`, `loginUsuario`, `senhaUsuario`, `dataCadastro`, `telefoneCelular`, `ativo`) VALUES
(8, 'marco', 'marco@gmail.com', 'marco', '827ccb0eea8a706c4c34a16891f84e7b', '2024-07-14 20:01:52', '(51)99235648', 'S'),
(9, 'Stefany', 'stefany@gmail.com', 'stefany', '827ccb0eea8a706c4c34a16891f84e7b', '2024-07-14 20:06:32', '(51)9883459', 'S');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idAtendimento`),
  ADD KEY `idFormaAtendimento` (`idFormaAtendimento`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idpublico` (`idpublico`);

--
-- Índices de tabela `formaatendimento`
--
ALTER TABLE `formaatendimento`
  ADD PRIMARY KEY (`idFormaAtendimento`);

--
-- Índices de tabela `publico`
--
ALTER TABLE `publico`
  ADD PRIMARY KEY (`idpublico`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idAtendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `formaatendimento`
--
ALTER TABLE `formaatendimento`
  MODIFY `idFormaAtendimento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `publico`
--
ALTER TABLE `publico`
  MODIFY `idpublico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `atendimento_ibfk_1` FOREIGN KEY (`idFormaAtendimento`) REFERENCES `formaatendimento` (`idFormaAtendimento`),
  ADD CONSTRAINT `atendimento_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`),
  ADD CONSTRAINT `atendimento_ibfk_3` FOREIGN KEY (`idpublico`) REFERENCES `publico` (`idpublico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
