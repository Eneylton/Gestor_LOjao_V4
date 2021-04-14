-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Abr-2021 às 22:38
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db_gestor2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `total_obra` decimal(10,2) DEFAULT NULL,
  `total_produto` decimal(10,2) DEFAULT NULL,
  `total_servico` decimal(10,2) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `foto` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `foto`) VALUES
(8, 'Batedores', './imgs/88.jpg'),
(9, 'Amortecedores', './imgs/capa1.jpg'),
(10, 'Filtro de Oléo', './imgs/10359.png'),
(11, 'Abraçadeira', './imgs/001-1.jpg'),
(13, 'Articulação', './imgs/001-3.jpg'),
(15, 'Atuador', './imgs/001-5.jpg'),
(16, 'Balancim', './imgs/001-6.jpg'),
(17, 'Bandeja suspençao', './imgs/sag-1.png'),
(18, 'Barra de Direção', './imgs/sag-2.png'),
(19, 'Bico injetor', './imgs/001-7.jpg'),
(20, 'Bieleta', './imgs/001-8.jpg'),
(21, 'Bobina de ignição', './imgs/sag-3.png'),
(22, 'Bomba d\' água ', './imgs/sag-4.png'),
(23, 'Bomba de combústivel', './imgs/001-9.jpg'),
(24, 'Bomba de óleo', './imgs/001-10.jpg'),
(25, 'Bucha da marcha', './imgs/001-11.jpg'),
(26, 'Bucha da bandeja', './imgs/001-12.jpg'),
(27, 'Bucha Estabilizadora', './imgs/sag-5.png'),
(28, 'Bucha de suspenção', './imgs/sag-6.png'),
(29, 'Cabo de acelerador', './imgs/sag-7.png'),
(30, 'CABO DE EMBREAGEM ', './imgs/teste.jpg'),
(32, 'CABO DE MARCHA', './imgs/paper.jpg'),
(33, 'ene', './imgs/01-12.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `placa` varchar(100) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `marcas_id` int(11) NOT NULL,
  `veiculo` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `email`, `placa`, `usuarios_id`, `marcas_id`, `veiculo`) VALUES
(1, 'Eneylton Barros ', '98 991581962', 'eneylton@hotmail.com', 'NHO-5566', 13, 1, 'Gol G5 1.6 2002'),
(2, 'Magarette Menezes', '98991581962', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Nissan Frontier 2005'),
(4, 'Lojao Carro', '98991581962', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Corolla 2006'),
(5, 'Livia Barros', '9891581965', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Fiat Gran Seinne 1.4'),
(6, 'Davi', '989852222', 'davi@hotmail.com', 'HPA-19655', 4, 1, 'Ford Fista ROCAM'),
(7, 'Lojao Carro', '98991581962', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Vectra 2.0 99'),
(9, 'Lojao Carro', '98991581962', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Novo Uno 2005'),
(10, 'Lojao Carro', '98991581962', 'eneylton@hotmail.com', 'NHO-8596', 4, 1, 'Corsa 1.0'),
(11, 'Carolinne ', '98 954422', 'eneylton@hotmail.com', 'HPA-19655', 4, 2, 'New Fiesta 2.0'),
(12, 'Eneylton Barros', '98991581962', 'eneylton@hotmail.com', 'NHO-6789', 7, 2, NULL),
(13, 'Jamilla Barra', '98991581962', 'eneylton@hotmail.com', 'NHO-6790', 7, 2, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `codigo` varchar(45) DEFAULT NULL,
  `barra` varchar(45) DEFAULT NULL,
  `nome` varchar(225) DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `valor_compra` decimal(10,2) DEFAULT NULL,
  `produtos_id` int(10) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estatisticas`
--

CREATE TABLE `estatisticas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `codigo` int(11) DEFAULT NULL,
  `barra` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `valor_compra` decimal(10,2) DEFAULT NULL,
  `subtotal` varchar(45) DEFAULT NULL,
  `produtos_id` int(10) NOT NULL,
  `usuarios_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `estatisticas`
--

INSERT INTO `estatisticas` (`id`, `data`, `codigo`, `barra`, `nome`, `qtd`, `status`, `valor_compra`, `subtotal`, `produtos_id`, `usuarios_id`) VALUES
(84, '2021-03-26 16:52:53', 778899, 2147483647, 'Bucha Estabilizadora - HIlux', '20', 1, '98.67', '1973.4', 1132, 13),
(85, '2021-03-26 17:14:44', 777116, 2147483647, 'ABRACADEIRA NYLON PRETA 202X3.70MM', '12', 1, '6.00', '72', 3, 13),
(86, '2021-03-26 17:14:44', 771352, 52146139, 'ALAVANCA FREIO M?O S-10 NOVA / 52146139 GM', '13', 1, '6.00', '78', 11, 13),
(87, '2021-03-26 17:17:28', 770744, 24582667, 'TAMPA DE RESERVATORIO DE AGUA DO UNO - 505010', '20', 1, '85.00', '1700', 991, 13),
(88, '2021-03-26 17:17:28', 770744, 2147483647, 'TAMPA RES AGUA PALIO / 5050103 MTA', '30', 1, '55.00', '1650', 998, 13),
(89, '2021-03-26 17:17:28', 770744, 2147483647, 'TAMPA RESERVATORIO AGUA PALIO / 5050103 MTA', '50', 1, '88.45', '4422.5', 1002, 13),
(90, '2021-03-27 12:58:48', 770365, 2147483647, 'ALB1601-569A / JUNTA HOMOCINETICA DO GOL G4', '10', 1, '6.00', '60', 12, 7),
(91, '2021-03-27 12:58:48', 770375, 2147483647, 'ALB2601-1809/ JUNTA HOMOCINETICA DO GOL 10', '15', 1, '12.96', '194.4', 15, 7),
(92, '2021-03-27 12:58:48', 771592, 2147483647, 'AMORTECEDOR CLIO DT / 8200126407 RENAULT', '20', 1, '13.98', '279.6', 17, 7),
(93, '2021-03-27 13:00:14', 769643, 2147483647, 'TAMPA RESERVATORIO AGUA FIESTA / TC-6551 CLIC', '15', 1, '25.69', '385.35', 1001, 7),
(94, '2021-03-27 13:07:20', 771262, 0, 'AMORTECEDOR DE MALA / CELTA / PALIO', '15', 1, '7.75', '116.25', 20, 7),
(95, '2021-03-27 13:07:20', 20, 2147483647, 'AMORTECEDOR COROLLA DIANT 15 L-D / 339824 KAY', '1', 1, '6.00', '6', 18, 7),
(96, '2021-03-27 13:46:31', 20, 2147483647, 'AMORTECEDOR COROLLA DIANT 15 L-D / 339824 KAY', '25', 1, '7.99', '199.75', 18, 7),
(97, '2021-03-27 13:46:31', 771265, 2147483647, 'AMORTECEDOR DT C4 LOUNGE LD / 335785', '30', 1, '8.63', '258.9', 23, 7),
(98, '2021-03-27 13:54:50', 771265, 2147483647, 'AMORTECEDOR DT C4 LOUNGE LD / 335786', '6', 1, '6.00', '36', 24, 7),
(99, '2021-03-27 13:54:50', 771280, 2147483647, 'AMORTECEDOR DT DO UNO / PREMIUM MP27559', '10', 1, '6.00', '60', 26, 7),
(100, '2021-03-27 13:54:50', 771480, 2147483647, 'AMORTECEDOR DT DUSTER / 543029585R', '20', 1, '6.00', '120', 22, 7),
(101, '2021-03-27 13:54:50', 80, 2147483647, 'AMORTECEDOR DT FIESTA ROCAM / GP30231', '1', 1, '6.00', '6', 29, 7),
(102, '2021-03-27 14:02:38', 80, 2147483647, 'AMORTECEDOR DT FIESTA ROCAM / GP30231', '10', 1, '6.00', '60', 29, 7),
(103, '2021-03-27 14:02:38', 0, 2147483647, 'AMORTECEDOR DT FORD KAR 2007 / GP35950M', '20', 1, '6.00', '120', 30, 7),
(104, '2021-03-27 14:02:39', 770817, 2147483647, 'AMORTECEDOR DT FOX 2003', '50', 1, '6.00', '300', 31, 7),
(105, '2021-03-27 14:02:39', 0, 2147483647, 'AMORTECEDOR DT HILUX 2005 PICKUP / GB48277', '53', 1, '6.00', '318', 33, 7),
(106, '2021-03-27 14:02:39', 0, 2147483647, 'AMORTECEDOR DT LD COLBAT / GP30520', '60', 1, '6.00', '360', 35, 7),
(107, '2021-03-27 14:02:39', 0, 2147483647, 'AMORTECEDOR DT LD MARCH', '80', 1, '6.00', '480', 37, 7),
(108, '2021-04-08 13:29:11', 0, 2147483647, 'AMORTECEDOR DT HONDA FIT / GP35943M', '180', 1, '6.00', '1080', 34, 4),
(109, '2021-04-08 13:29:19', 0, 2147483647, 'AMORTECEDOR DT LD COROLLA 2008 / GP32497M', '2', 1, '6.00', '12', 36, 4),
(110, '2021-04-08 13:47:57', 771134, 2147483647, 'AMORTECEDOR DT LD ONIX / 52093285 GM', '8', 1, '9.00', '72', 39, 4),
(111, '2021-04-08 13:59:24', 771134, 2147483647, 'AMORTECEDOR DT LD ONIX / 52093285 GM', '8', 1, '9.00', '72', 39, 4),
(112, '2021-04-08 13:59:24', 771020, 2147483647, 'AMORTECEDOR DT LE COLBALT / GP30521', '1', 1, '6.00', '6', 42, 4),
(113, '2021-04-08 14:11:29', 0, 2147483647, 'AMORTECEDOR DT HONDA FIT / GP35943M', '1', 1, '6.00', '6', 34, 4),
(114, '2021-04-08 14:12:47', 0, 2147483647, 'AMORTECEDOR DT HONDA FIT / GP35943M', '1', 1, '6.00', '6', 34, 4),
(115, '2021-04-08 14:14:39', 0, 2147483647, 'AMORTECEDOR DT HONDA FIT / GP35943M', '1', 1, '6.00', '6', 34, 4),
(116, '2021-04-08 14:19:39', 0, 2147483647, 'AMORTECEDOR DT HONDA FIT / GP35943M', '1', 1, '6.00', '6', 34, 4),
(117, '2021-04-08 14:36:32', 0, 2147483647, 'AMORTECEDOR DT LD COROLLA 2008 / GP32497M', '80', 1, '6.00', '480', 36, 4),
(118, '2021-04-08 14:42:44', 0, 52093285, 'AMORTECEDOR DT LD NEW FIESTA SEM BARRA / SP06', '10', 1, '6.00', '60', 38, 4),
(119, '2021-04-08 17:01:01', 771462, 2147483647, 'TAMPA RESERVATORIA AGUA FOX GOL / TC-3062 CLI', '20', 1, '5.00', '100', 1000, 4),
(120, '2021-04-08 20:05:47', 0, 2147483647, 'AMORTECEDOR DT LD PEUGEOUT 307', '20', 1, '6.00', '120', 41, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `forma_pagamento`
--

CREATE TABLE `forma_pagamento` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `forma_pagamento`
--

INSERT INTO `forma_pagamento` (`id`, `nome`) VALUES
(1, 'Dinheiro'),
(2, 'Cartão de Crédito'),
(3, 'Cartão de Débito');

-- --------------------------------------------------------

--
-- Estrutura da tabela `galerias`
--

CREATE TABLE `galerias` (
  `id` int(11) NOT NULL,
  `foto` varchar(225) DEFAULT NULL,
  `produtos_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `galerias`
--

INSERT INTO `galerias` (`id`, `foto`, `produtos_id`) VALUES
(12, './imgs/01-5.jpg', 1135),
(13, './imgs/02-4.jpg', 1135),
(14, './imgs/03-5.jpg', 1135),
(15, './imgs/fiat-logo-1.jpg', 1133),
(16, './imgs/gbv-1.jpg', 1133),
(17, './imgs/nbc.png', 1133),
(18, './imgs/nissan_brand_logo.jpg.ximg.l_12_m.smart.jpg', 1133),
(19, './imgs/nissan-frontier-xe-9.jpg', 1132),
(20, './imgs/nuova-opel-corsa-ecco-quella-benzina-e-diesel.jpg', 1132),
(21, './imgs/pastilha.jpg', 1132),
(22, './imgs/petronas-paraflu-vector-logo.png', 1132),
(23, './imgs/001.jpg', 1002),
(24, './imgs/01.png', 1002),
(25, './imgs/boa-esperanca.png', 1002),
(26, './imgs/sag.png', 1002);

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`) VALUES
(1, 'Gol'),
(2, 'Fiat');

-- --------------------------------------------------------

--
-- Estrutura da tabela `mecanicos`
--

CREATE TABLE `mecanicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `mecanicos`
--

INSERT INTO `mecanicos` (`id`, `nome`, `telefone`) VALUES
(1, 'Maycon', NULL),
(2, 'Agnaldo', NULL),
(3, 'Zorro', NULL),
(4, 'Robinho', NULL),
(5, 'Gordinho', NULL),
(6, 'Matheus Junior', NULL),
(7, 'Tchêtchê', NULL),
(8, 'Pintor', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `ordem_servicos`
--

CREATE TABLE `ordem_servicos` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `clientes_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `servicos_id` int(11) NOT NULL,
  `mao_obra` decimal(10,2) DEFAULT NULL,
  `obs` varchar(225) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `ordem_servicos`
--

INSERT INTO `ordem_servicos` (`id`, `data`, `clientes_id`, `mecanicos_id`, `servicos_id`, `mao_obra`, `obs`) VALUES
(93, '2021-04-14 19:54:55', 2, 2, 1, '152.36', 'Todos'),
(94, '2021-04-14 19:54:55', 2, 2, 2, '152.36', 'Todos'),
(95, '2021-04-14 20:26:17', 1, 1, 2, '300.00', 'Tdos'),
(96, '2021-04-14 20:26:17', 1, 1, 6, '300.00', 'Tdos'),
(97, '2021-04-14 20:26:55', 4, 2, 6, '200.00', 'OOKK'),
(98, '2021-04-14 20:26:55', 4, 2, 7, '200.00', 'OOKK'),
(102, '2021-04-14 20:36:49', 1, 1, 3, '300.00', 'OOK'),
(103, '2021-04-14 20:36:49', 1, 1, 7, '300.00', 'OOK');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `codigo` int(11) DEFAULT NULL,
  `barra` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `valor_compra` decimal(10,2) DEFAULT NULL,
  `subtotal` varchar(45) DEFAULT NULL,
  `produtos_id` int(10) NOT NULL,
  `usuarios_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(10) NOT NULL,
  `barra` varchar(50) NOT NULL,
  `codigo` int(10) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `qtd` int(10) NOT NULL,
  `valor_compra` decimal(10,2) NOT NULL,
  `valor_venda` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `foto` varchar(255) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `usuarios_id` int(11) NOT NULL,
  `categorias_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`) VALUES
(1, '7898150981460    ', 770886, 'ABRACADEIRA NYLON BRANCA 283X4.80MM', 0, '6.00', '84.69', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 7, 10),
(2, '7898150980234    ', 770885, 'ABRACADEIRA NYLON BRANCA 400X4.80MM', 0, '6.00', '150.87', 51, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(3, '7898150981415    ', 777116, 'ABRACADEIRA NYLON PRETA 202X3.70MM', 1, '6.00', '87.96', 14, 0, 'imgs/sem.jpg', '2021-03-18 22:45:38', 7, 8),
(4, '7898587461474    ', 771679, 'ADITIVO CONCENTRADO ORGANICO ROSA 1L / PARAFLU', 1, '6.00', '8.00', 80, 0, 'imgs/sem.jpg', '2021-03-18 22:45:38', 7, 8),
(5, '7891414003014    ', 771084, 'ADITIVO PETRONAS COOLANT', 0, '6.00', '8.00', 51, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(6, '7898173510135    ', 770264, 'ADITIVO RADIADOR AZUL 1L / CAR1000', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(7, '7898024051978    ', 770255, 'ADITIVO RADIADOR LL COOLANT 1L / NISSAN', 0, '6.00', '8.00', 82, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(8, '7898173510128    ', 770263, 'ADITIVO RADIADOR ROSA 1L / CAR1000', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(9, '7898307294405    ', 771420, 'ADITIVO TEC COOL AZUL / TECBRIL', 0, '6.00', '8.00', 71, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(10, '7898307292401    ', 771504, 'ADITIVO TEC COOL ROSA / TECBRIL', 0, '6.00', '8.00', 83, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(11, '52146139    ', 771352, 'ALAVANCA FREIO M?O S-10 NOVA / 52146139 GM', 0, '6.00', '8.00', 15, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(12, '7892861978658    ', 770365, 'ALB1601-569A / JUNTA HOMOCINETICA DO GOL G4', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(15, '7891579308535    ', 770375, 'ALB2601-1809/ JUNTA HOMOCINETICA DO GOL 10', 0, '12.96', '8.00', 16, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(16, '82001264071    ', 770568, 'AMORTECEDOR AGILE DT / GP30316 COFAP', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(17, '4909500966846    ', 771592, 'AMORTECEDOR CLIO DT / 8200126407 RENAULT', 0, '13.98', '8.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(18, '4909500966860    ', 20, 'AMORTECEDOR COROLLA DIANT 15 L-D / 339824 KAYABA', 0, '7.99', '8.00', 27, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(19, '7891579873835    ', 21, 'AMORTECEDOR COROLLA DIANT 15 L-E / 339825 KAYABA', 0, '6.00', '8.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(20, '', 771262, 'AMORTECEDOR DE MALA / CELTA / PALIO', 0, '7.75', '8.00', 17, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(21, '543026348R', 771785, 'AMORTECEDOR STRADA DT / GP30352PS COFAP', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(22, '4909500941867    ', 771480, 'AMORTECEDOR DT DUSTER / 543029585R', 0, '6.00', '8.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(23, '4909500941881    ', 771265, 'AMORTECEDOR DT C4 LOUNGE LD / 335785', 0, '8.63', '8.00', 31, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(24, '7891579116864    ', 771265, 'AMORTECEDOR DT C4 LOUNGE LD / 335786', 0, '6.00', '8.00', 7, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(25, '7891579329967    ', 771262, 'AMORTECEDOR DT CELTA/CORSA / MP30088 COFAP', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(26, '7891579205872    ', 771280, 'AMORTECEDOR DT DO UNO / PREMIUM MP27559', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(27, '7899027350372    ', 771301, 'AMORTECEDOR DT ECOESPORTE 4X2 2003 / GP30313', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(28, '7891579203137    ', 770142, 'AMORTECEDOR DT ETIOS 2012 / SP003', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(29, '7891579303868    ', 80, 'AMORTECEDOR DT FIESTA ROCAM / GP30231', 0, '6.00', '8.00', 12, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(30, '7891579121967    ', 0, 'AMORTECEDOR DT FORD KAR 2007 / GP35950M', 0, '6.00', '8.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(31, '7899027348492    ', 770817, 'AMORTECEDOR DT FOX 2003', 0, '6.00', '8.00', 51, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(32, '7891579368645    ', 770905, 'AMORTECEDOR DT GOL G5 COM BARRA EST / SP320', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(33, '7891579342089    ', 0, 'AMORTECEDOR DT HILUX 2005 PICKUP / GB48277', 0, '6.00', '8.00', 54, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(34, '7891579353603    ', 0, 'AMORTECEDOR DT HONDA FIT / GP35943M', 0, '6.00', '15.98', 185, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(35, '7891579235923    ', 0, 'AMORTECEDOR DT LD COLBAT / GP30520', 0, '6.00', '8.00', 61, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(36, '7891579354655    ', 0, 'AMORTECEDOR DT LD COROLLA 2008 / GP32497M', 0, '6.00', '8.00', 83, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(37, '7899027350242    ', 0, 'AMORTECEDOR DT LD MARCH', 0, '6.00', '8.00', 81, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(38, '52093285    ', 0, 'AMORTECEDOR DT LD NEW FIESTA SEM BARRA / SP066', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(39, '7891579297457    ', 771134, 'AMORTECEDOR DT LD ONIX / 52093285 GM', 0, '9.00', '8.00', 17, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(40, '', 0, 'AMORTECEDOR DT LD PEUGEOT 207 / GP32688', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(41, '7891579353610    ', 0, 'AMORTECEDOR DT LD PEUGEOUT 307', 0, '6.00', '8.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(42, '7891579235930    ', 771020, 'AMORTECEDOR DT LE COLBALT / GP30521', 0, '6.00', '8.00', 2, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(43, '7891579331526    ', 0, 'AMORTECEDOR DT LE COROLLA 2008 / GP32498M', 0, '6.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(44, '', 0, 'AMORTECEDOR DT LE FIAT UNO 2010 | (SEM BARRA ESTABILIZADORA)', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(45, '7899027350259    ', 0, 'Batedor Gol TS', 1, '6.00', '8.00', 2, 0, 'imgs/sem.jpg', '2021-03-18 22:45:38', 7, 8),
(46, '52093284    ', 0, 'AMORTECEDOR DT LE NEW FIESTA SEM BARRA / SP067', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(47, '7891579297655    ', 771135, 'AMORTECEDOR DT LE ONIX / 52093284 GM', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(48, '7891579205216    ', 0, 'AMORTECEDOR DT LE PEUGEOT 207 / GP32687', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(49, '7891579354662    ', 0, 'AMORTECEDOR DT LE PEUGEOUT 307 / GP32961', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(50, '7891579017307    ', 0, 'AMORTECEDOR DT MARCH LE', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(51, '7891579304971    ', 0, 'AMORTECEDOR DT MERCEDES', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(52, '7891579304919    ', 0, 'AMORTECEDOR DT NEW CIVIC LD / GP35984M', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(53, '7899027349437    ', 0, 'AMORTECEDOR DT NEW CIVIC LE / GP35983M', 0, '6.00', '8.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(54, '7899027349444    ', 0, 'AMORTECEDOR DT NEW FIESTA LD COM BARR ESTAB / SP357', 0, '6.00', '8.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(55, '7891579206015    ', 0, 'AMORTECEDOR DT NEW FIESTA LE COM BARR ESTAB / SP358', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(56, '7891579293718    ', 0, 'AMORTECEDOR DT S-10 4X4 2006 / GL12902', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(57, '7891579118288    ', 0, 'AMORTECEDOR DT SAVEIRO G5 2008 /GP32801', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(58, '7891579354648    ', 0, 'AMORTECEDOR DT STRADA 2001 / GP30120', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(59, '7891579216014    ', 771685, 'AMORTECEDOR ETIOS DT / GP30527 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(60, '7891579346209    ', 771304, 'AMORTECEDOR FIESTA 2003 TS / GB27471 COFAP', 0, '6.00', '8.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(61, '', 771249, 'AMORTECEDOR GRAND SIENA TS / GB48125 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(62, '', 771552, 'AMORTECEDOR HB20 DT L-D / GP30534 COFAP', 0, '6.00', '88.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(63, '7891579867742    ', 771553, 'AMORTECEDOR HB20 DT L-E / GP30535 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(64, '7891579311344    ', 771342, 'AMORTECEDOR NISSAN KICKS / GP30584 COFAP', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(65, '543024025R', 771284, 'AMORTECEDOR PALIO 1.0 07 DT / GP32800PS COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(66, '7891579238757    ', 771222, 'AMORTECEDOR SANDERO 07-13 DT / 543024025R RENAULT', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(67, '7891579347794    ', 771306, 'AMORTECEDOR SANDERO LOGAN TS / GB48039 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(68, '7891579120755    ', 770807, 'AMORTECEDOR SUSPENSA TS GOL | G5 / GB48167 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(69, '7891579099976    ', 769884, 'AMORTECEDOR TS CELTA / B47061 COFAP', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(70, '7899027348959    ', 0, 'AMORTECEDOR TS CLIO 99 / GB47828', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(71, '7891579246172    ', 0, 'AMORTECEDOR TS DO CROSSFOX 2006', 0, '6.00', '88.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(72, '7899027350266    ', 0, 'AMORTECEDOR TS DO UNO WAY / MP27539', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(73, '7899027344418    ', 770048, 'AMORTECEDOR TS ETIOS / SP004', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(74, '7891579121974    ', 0, 'AMORTECEDOR TS FORNTIER 4X4 /27328', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(75, '7891579125118    ', 0, 'AMORTECEDOR TS FOX / POLO 2002', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(76, '7891579354976    ', 0, 'AMORTECEDOR TS GOLF 2007', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(77, '7891579368638    ', 770898, 'AMORTECEDOR TS HB20 / GB48246', 0, '6.00', '8.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(78, '562101820R', 0, 'AMORTECEDOR TS HILUX PICK-UP 2005 / GB27663', 0, '6.00', '88.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(79, '7891579331489    ', 0, 'AMORTECEDOR TS KWID / 562101820R', 0, '66.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(80, '7899027350679    ', 0, 'AMORTECEDOR TS MONTANA LS 2011 / GBL1252', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(81, '7891579347763    ', 0, 'AMORTECEDOR TS NEW CIVIC 2008 / SP251', 0, '6.00', '8.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(82, '7891579346186    ', 0, 'AMORTECEDOR TS NOVO C3 / GB27567', 0, '6.00', '88.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(83, '7891579099822    ', 0, 'AMORTECEDOR TS ONIX / GB27608', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(84, '7891579346193    ', 771279, 'AMORTECEDOR TS PALIO HATCH 97 / GBL1119', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(85, '7891579296467    ', 771247, 'AMORTECEDOR TS PALIO NOVO / GB48092', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(86, '7891579308351    ', 0, 'AMORTECEDOR TS PUNTO / LINEAR 2008 / GB47963', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(87, '7891579331540    ', 0, 'AMORTECEDOR TS STRADA ADVEENTURE / GL13136', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(88, '7891579331540    ', 771283, 'AMORTECEDOR UNO WAY 2010 L-D DT / GP32827 COFAP', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(89, '', 771282, 'AMORTECEDOR UNO WAY 2010 L-E DT / GP32826 COFAP', 0, '6.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(90, '404179    ', 771246, 'AMORTEDOR PEUGEOT 206 TS / GBL1206 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(91, '7898429261293    ', 771046, 'ANTI CHAMA GOL GOL / 404179 REVIAM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(92, '7897499912616    ', 771364, 'APOIO MOLA UNO ANTIGO TS G / MB484 MOBENSANE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(93, '7899013300688    ', 770660, 'ARICULACAO N-644 FIAT / NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(94, '7899013309841    ', 770688, 'ARTICULACAO C3 / 680212 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(95, '7899013331712    ', 770691, 'ARTICULACAO C4 PALLAS / 680305 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(96, '7899013331743    ', 770073, 'ARTICULACAO CELTA / 680067 VIEMAR', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(97, '7890903078717    ', 770683, 'ARTICULACAO CELTA / 680070 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(98, '7899013332191    ', 769950, 'ARTICULACAO CELTA FM / N-93005 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(99, '7899013340349    ', 770219, 'ARTICULACAO CLIO / 680115 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(100, '7890903027562    ', 770643, 'ARTICULACAO COLUNA DIRECAO FIESTA / 200003 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(101, '7899013316993    ', 771467, 'ARTICULACAO COROLA / N99100 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(102, '7899013373651    ', 95, 'ARTICULACAO COROLLA / 680402 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(103, '7899013324394    ', 770685, 'ARTICULACAO CORSA / 680178 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(104, '7897483471044    ', 771144, 'ARTICULA?AO DO KWID / 680655', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(105, '7890903078595    ', 770620, 'ARTICULACAO DUSTER / JARB0096 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(106, '7899013321379    ', 770228, 'ARTICULACAO ECOSPORT / N92005 NAKATA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(107, '7899013373972    ', 771605, 'ARTICULACAO ETIOS / 680550 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(108, '7899013373958    ', 770648, 'ARTICULACAO FIESTA 02-12 / 680185 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(109, '7897499915419    ', 771172, 'ARTICULACAO FIESTA ROCAM / 680184 VIEMAR', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(110, '7899013300695    ', 770658, 'ARTICULACAO FIORINO / N-6015 NAKATA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(111, '7899013310137    ', 770614, 'ARTICULACAO FIT DT LD / 680211 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(112, '7899013314807    ', 770612, 'ARTICULACAO FIT DT LE / 680313 VIEMAR', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(113, '7899013319994    ', 779842, 'ARTICULACAO FOCUS 14 / 680360 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(114, '7899013313053    ', 770222, 'ARTICULACAO FORD ECOSPORTE 2012 / 680529 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(115, '7899013376058    ', 771375, 'ARTICULACAO FRONTIER / 680329 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(116, '7899013302064    ', 769672, 'ARTICULACAO GOL / 680192 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(117, '7890903078588    ', 769675, 'ARTICULACAO GOL / 680265 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(118, '7890903031330    ', 770067, 'ARTICULACAO GOL / N-91001 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(119, '7899013332016    ', 770901, 'ARTICULACAO GOL 2015 DT / N97006 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(120, '7890903029061    ', 770653, 'ARTICULACAO GOLF G4 / 680097 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(121, '7899013320914    ', 770018, 'ARTICULACAO GRAND SIENA / N-96028 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(122, '7899013309223    ', 770631, 'ARTICULACAO HB20 / 680539 VIEMAR', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(123, '7899013314920    ', 779669, 'ARTICULACAO HILUX / 680285 VIEMAR', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(124, '7899013318010    ', 770611, 'ARTICULACAO HONDA CITY / 680374 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(125, '7899013321034    ', 770646, 'ARTICULACAO KA NEW FIESTA / 680409 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(126, '7899013321034    ', 771604, 'ARTICULACAO MARCH / 680546 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(127, '7899013373170    ', 771604, 'ARTICULACAO MARCH / 680546 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(128, '7899013314845    ', 68, 'ARTICULACAO MERIVA / 680177 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(129, '7899013317491    ', 770686, 'ARTICULACAO MONTANA / 680365 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(130, '7899013309575    ', 770684, 'ARTICULACAO MONTANA / 680487 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(131, '7899013323991    ', 770613, 'ARTICULACAO NEW CIVIC / 680288 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(132, '', 770682, 'ARTICULACAO ONIX / 680647 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(133, '7897499917734    ', 770039, 'ARTICULACAO ONIX PRISMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(134, '7890903049526    ', 769965, 'ARTICULACAO PALIO / N-6018 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(135, '7899013332207    ', 769766, 'ARTICULACAO PALIO / N-96036 NAKATA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(136, '7899013321027    ', 770690, 'ARTICULACAO PEUGEOT 206 / 680116 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(137, '', 771124, 'ARTICULA?AO PEUGEOUT 208 C-3 / 680543 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(138, '7899013318959    ', 0, 'ARTICULA?AO PEUGEOUT 208 C-3 / 680543 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(139, '7899013310342    ', 770039, 'ARTICULACAO PRISMA / 680494 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(140, '7899013318522    ', 770618, 'ARTICULACAO SANDERO / 680315 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(141, '7899013337035    ', 770657, 'ARTICULACAO STRADA / 680502 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(142, '7899013331415    ', 770635, 'ARTICULACAO TIIDA / 680333 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(143, '7899013315019    ', 770659, 'ARTICULACAO UNO MILLE / 680037 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(144, '7899013331804    ', 770661, 'ARTICULACAO UNO WAY / 680382 VIEMAR', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(145, '7899013314920    ', 770687, 'ARTICULACAO VECTRA / 680076 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(146, '4014870530075    ', 770611, 'ARTICUL?AO DO HONDA FIT - 680374', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(147, '4005108982308    ', 770947, 'ATUADOR CX MARCHA 5100065110 COURIER / LUK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(148, '7316573479116    ', 770932, 'ATUADOR PEDAL GRAND SIENA EVO E-T / 5110329100 LUK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(149, '7316576689550    ', 770933, 'ATUADOR PEDAL VKHC4729 FORD / SKF', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(150, '', 0, 'BAH-0036/VK210 ROLAMENTO DO FIESTA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(151, '', 771556, 'BALANCIM S10 2012 / 12625214 GM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(152, '7891579877697    ', 771205, 'BANDEIJA DO VERSA L ESQUERDO NBJ6003EP', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(153, '7891579877703    ', 771456, 'BANDEJA C3 NOVO 208 PEUGEOUT LD / BJC55000M COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(154, '', 0, 'BANDEJA C3 NOVO PEUGEOT 208 LE / BJC55001M COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(155, '', 771665, 'BANDEJA C4 307 L-E SEM PIVO / BDJ0841 PERFECT', 0, '5.00', '5.00', 2, NULL, '', '2021-03-18 22:45:38', 0, 8),
(156, '', 771671, 'BANDEJA CELTA AGILE L-D / BJC04118M COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(157, '7890903051024    ', 771670, 'BANDEJA CELTA AGILE L-E / BJC04119M COFAP', 0, '0.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(158, '7890903051024    ', 771430, 'BANDEJA DE SUSPENSAO VW GOL / NBJ1003 NAKATA', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(159, '7890903051154    ', 771430, 'BANDEJA DE SUSPENSAO VW GOL / NBJ1003 NAKATA', 0, '5.00', '5.00', 2, NULL, '', '2021-03-18 22:45:38', 0, 8),
(160, '', 771669, 'BANDEJA GOL G5 L-D / NBJ1011D NAKATA', 0, '5.00', '5.12', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(161, '7890903051147    ', 771666, 'BANDEJA GOL G5 L-E / BJC01045M COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(162, '7899152538928    ', 771668, 'BANDEJA GOL G5 L-E / NBJ1011E NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(163, '7890903088280    ', 771667, 'BANDEJA HILUX 05 L-E COMPLET / BDJ2053 PERFECT', 0, '0.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(164, '7890903088297    ', 771141, 'BANDEJA KWID C-PIVO DT L-D / NBJ6014DP NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(165, '555013187r1', 771142, 'BANDEJA KWID C-PIVO DT L-E / NBJ6014EP NAKATA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(166, '545013512r1', 771481, 'BANDEJA KWID L-D DT / 555013187R RENAULT', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(167, '7890903051871    ', 771482, 'BANDEJA KWID L-E DT / 545013512R RENAULT', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(168, '7890903051864    ', 771210, 'BANDEJA PEUGEOT 206 LD C-PIVO DT/ NBJ5002DP NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(169, '545004269r1', 771209, 'BANDEJA PEUGEOT206 L-E C-PIVO DT/ NBJ5002EP NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(170, '545011362r1', 770538, 'BANDEJA SANDERO L-D / 545004269R RENAULT', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(171, '7890903080802    ', 770539, 'BANDEJA SANDERO L-E / 545011362R RENAULT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(172, '7890903080819    ', 771204, 'BANDEJA VERSA MARCH L-D / NBJ6003DP NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(173, '', 771205, 'BANDEJA VERSA MARCH L-E / NBJ6003EP NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(174, '7891579680303    ', 770811, 'BASE AMORTECEDOR DT C ROL - FIAT UNO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(175, '7891579299376    ', 771321, 'BATEDOR C3 AIRCROSS DT / KSC55001S COFAP', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(176, '7898300983436    ', 770031, 'BATEDOR C3 TS / KSC17202S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(177, '7891579230201    ', 771318, 'BATEDOR CORSA 94 TS / 30377 KIT&CIA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(178, '7891579229090    ', 771320, 'BATEDOR DA BLAZER DT / KSC04108S COFAP', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(179, '7891579229090    ', 771319, 'BATEDOR DO ASTRA TS / KSC04205S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(180, '7890903047607    ', 771411, 'BATEDOR DOBLO TS / KSC03208S COFAP', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(181, '7891579230171    ', 771248, 'BATEDOR DT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(182, '7891579230355    ', 771367, 'BATEDOR DT CLASSIC - KSC04105S', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(183, '', 771317, 'BATEDOR DT FOR ECOSPORT / KSC08106S', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(184, '7891579229151    ', 770912, 'BATEDOR DT SANDEIRO / NK0838', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(185, '7891579854940    ', 771048, 'BATEDOR DT UNO MILLE / KSC03101S COFAP', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(186, '7891579296511    ', 771494, 'BATEDOR ETIOS DT / KSC22205S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(187, '7891579366917    ', 769679, 'BATEDOR FIESTA TS / KSC08206S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(188, '7891579427649    ', 770987, 'BATEDOR HB20 TS / KSC32203S COFAP', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(189, '7891579229229    ', 769997, 'BATEDOR NEW FIESTA DT / KSC08121S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(190, '7891579230447    ', 771336, 'BATEDOR PALIO DT / KSC03108S COFAP', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(191, '', 771531, 'BATEDOR PEUGEOT 206 DT / KSC17102S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(192, '7891579229274    ', 770047, 'BATEDOR PEUGEOUT 206 DT / MB6070S MOBESANI', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(193, '7891579321305    ', 25, 'BATEDOR STRADA TS / KSC03203S COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(194, '7891579229267    ', 771047, 'BATEDOR TRASEIRO DO PUNTO / ONIX - KSC03214S', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(195, '789429266403    ', 771035, 'BATEDOR TS PALIO / KSC03202S', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(196, '4047025602747    ', 770810, 'BATEDOR UNO VIVACE DT / MB4059 MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(197, '78998504001029    ', 0, 'BB54 / PASTILHA DE FREIO DO GOL ANTIGO', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(198, '', 771441, 'BIELETA AMAROK D-E 2011 / MB3025 MOBESANI', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(199, '7890903078533    ', 771343, 'BIELETA BIELETA MONTA VECTRA / N-3014 NAKATA', 0, '5.00', '5.00', 2, NULL, '', '2021-03-18 22:45:38', 0, 8),
(200, '', 771459, 'BIELETA COROLLA DT N99005', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(201, '7890903032283    ', 770101, 'BIELETA DO NEW CERATO / N99198', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(202, '', 771392, 'BIELETA DO NEW FIESTA N92030', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(203, '7890903046365    ', 771343, 'BIELETA DO VECTRA / N - 3014', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(204, '04486.10', 770893, 'BIELETA DT ONIX / COBALT / N93036 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(205, '7890903032306    ', 770895, 'BIELETA DT Z00109300 SANDERO / GETOFLEX', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(206, '7890903067834    ', 770034, 'BIELETA DUSTER DT / N99141 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(207, '7897499924275    ', 770103, 'BIELETA ETIOS DT / N99279 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(208, '', 157, 'BIELETA GOL / N1068 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(209, '7890903032399    ', 769696, 'BIELETA GRAND SIENA DT / N6081 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(210, '7890903032436    ', 771256, 'BIELETA HB20 DT / N99150 NAKATA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(211, '7890903060088    ', 771038, 'BIELETA HILUX DT L-D / N99155 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(212, '7890903060095    ', 0, 'BIELETA HONDA HR - V LADO DIR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(213, '7897499921403    ', 0, 'BIELETA HONDA HR - V LADO ESQUEDO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(214, '7890903049700    ', 0, 'BIELETA N3014', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(215, '7890903032344    ', 770101, 'BIELETA NEW CERATO DT / N99198 NAKATA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(216, '', 771234, 'BIELETA NISSAN TIDA / N99145', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(217, '', 769788, 'BIELETA PEUGEOT 206 C3 DT / N99001 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(218, '7897499952377    ', 0, 'BIELETA S-10 BTC04203', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(219, '7897707510429    ', 771235, 'BIELETA UNO NOVO DT / N6081 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(220, '7897843834816    ', 769776, 'BKR6E-D', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(221, '7897843812364    ', 30, 'BOBINA AGILE 1.4 / CE20131 DELPHI', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(222, '7898541343648    ', 770593, 'BOBINA CELTA /CE10001 DELPHI', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(223, '7897707570058    ', 769742, 'BOBINA CERATO SONATA / GC4278 GAUSS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(224, '7898541341231    ', 770089, 'BOBINA DA DUSTER U5001', 0, '0.00', '5.00', 111, NULL, '', '2021-03-18 22:45:38', 0, 8),
(225, '7899751900287    ', 770971, 'BOBINA DE IGNI??O - GC4273 - GAUSS HB20 1.6', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(226, '7899751900010    ', 771132, 'BOBINA DE IGNI??O / E3BG12A366BB - GC4066', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(227, '3165143593998    ', 770085, 'BOBINA DE IGNI??O GC4252', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(228, '7899751923408    ', 769765, 'BOBINA FIESTA / 0221503485 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(229, '7897707570003    ', 770590, 'BOBINA FIESTA 2017 / GC4123 GAUSS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(230, '4047024479142    ', 770589, 'BOBINA FIESTA ROCAM 1.0 / U2001 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(231, '7891579205971    ', 770591, 'BOBINA FIESTA ZETEC ROCAM / 0221503490 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(232, '7898541349442    ', 770586, 'BOBINA GOL 1.0 / BI0017MM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(233, '7898541341880    ', 769723, 'BOBINA GOL G6 / GC4098 GAUSS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(234, '7897707570195    ', 771416, 'BOBINA HB20 1.0 / GC4274 GAUSS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(235, '7897707570188    ', 770812, 'BOBINA HB20 1.0 / U5316 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(236, '7891579886101    ', 770587, 'BOBINA HB20 1.6 / U5067 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(237, '7897707570249    ', 770088, 'BOBINA PALIO EVO 1.4 / BI0058MMA MAGNETI MARELLI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(238, '3165143655399    ', 770984, 'BOBINA PRISMA 1.4 / U2031 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(239, '3165143655399    ', 770588, 'BOBINA TIIDA / 0221604014 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(240, '4047024733978    ', 770588, 'BOBINA TIIDA / 0221604014 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(241, '7898935146640    ', 770592, 'BOBINA UNO MILLE / F000ZS0217 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(242, '7890903023175    ', 771453, 'BOIA COMBUSTIVEL SANDERO 07 / T-010159 TSA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(243, '7892677009058    ', 771117, 'BOMBA AGUA DE GOL FOX / NKBA07630 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(244, '4047025073585    ', 771680, 'BOMBA AGUA GRANDSIENA 1.6 CHAVE / 90000537 SCHADEK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(245, '7890903023229    ', 769662, 'BOMBA COMBUSTIVEL FLEX / F000TE159A BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(246, '7890903023229    ', 770087, 'BOMBA D AGUA FIAT / NKBA01766 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(247, '7890903023106    ', 770087, 'BOMBA D AGUA UNO 1.0 8V FIRE 02/12.0', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(248, '7892677008082    ', 770543, 'BOMBA DE AGUA CORSA CORSA / NKBA03147 NAKATA', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(249, '7899152536849    ', 771201, 'BOMBA OLEO PALIO/PUNTO/IDEA 1.6', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(250, '7892968019896    ', 0, 'BRA3029 / BRA?O OSCILANTE DT COMPLETO UNO LD E LE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(251, '', 770203, 'BUCHA BAND TR BR15101101843 CROSSFOX / MONROE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(252, '7898261419784    ', 771152, 'BUCHA BANDEJA S10 DT P / BR10001102610 MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(253, '7898429260791    ', 771178, 'BUCHA BARRA DIRECAO GOL / MB381 MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(254, '7894325107581    ', 769958, 'BUCHA BARRA ESTAB DT / GOLF 98 / MONROE', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(255, '', 771110, 'BUCHA BARRA ESTAB DT GOL GER 5 17MM', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(256, '789968019650    ', 770778, 'BUCHA BR OSCI MB416 / MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(257, '7892968015522    ', 770750, 'BUCHA C/ESTABILIZADOR PALIO L-D', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(258, '7892968024906    ', 770542, 'BUCHA CAD G BR15101101247 GOL / MONROE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(259, '7892968015546    ', 770773, 'BUCHA CAD INF BR10001102609 NOVA S10 / MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(260, '7892968019674    ', 74, 'BUCHA CAD P BR15101101249 GOL / MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(261, '7892968015546    ', 770769, 'BUCHA CAD S/B.ESTAB LD BR11302101699 FIRE / MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(262, '7898429267240    ', 74, 'BUCHA CADEIRA GOL P / BR15101101249 MONROE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(263, '7898429267240    ', 770780, 'BUCHA CADEIRA NEW FIESTA / MB2268 MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(264, '', 770780, 'BUCHA CADEIRA NEW FIESTA / MB2268 MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(265, '', 769665, 'BUCHA CADEIRA PALIO DT P / FZ00126504N GETOFLEX', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(266, '7899850401531    ', 771474, 'BUCHA CADEIRA PALIO P / BR15301101038 MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(267, '', 0, 'BUCHA DA BARRA DE SUSPENSAO / CRUZER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(268, '7891252789767    ', 771417, 'BUCHA DA BARRA ESTABILIZADORA HILUX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(269, '7892968019643    ', 0, 'BUCHA DA CADEIRA / FIESTA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(270, '7892968019650    ', 0, 'BUCHA DA CADEIRA PALIO / BR11302101696 / L- E', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(271, '', 0, 'BUCHA DA CADEIRA PALIO / BR11302101697 / L- D', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(272, '7892968023541    ', 0, 'BUCHA DE CADEIRA COBALT G', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(273, '', 0, 'BUCHA DE CADEIRA FIETSA ROCAM BR10001102357', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(274, '', 770751, 'BUCHA DE CADEIRA G COM ESTABILIZADOR - L ESQUERD / PALIO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(275, '7892968017496    ', 0, 'BUCHA DE CADEIRA ONIX GD', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(276, '7894325100106    ', 771395, 'BUCHA ESTAB PEUGOUT 206 / BR15051105418 / MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(277, '7898429260685    ', 0, 'BUCHA ESTABILIZADORA COROLLA / 285', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(278, '78998504000392    ', 0, 'bucha estabilizadora do fiesta rocam / mb2224', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(279, '', 0, 'BUCHA ESTABILIZADORA ECOSPORT 1.6 2013 MB2304', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(280, '04486.15', 0, 'bucha estabilizadora externo 40086', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(281, '7898429268544    ', 771109, 'BUCHA ESTABILIZADORA GOL / FZ00305578N GETOFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(282, '', 0, 'BUCHA ESTABILIZADORA HB20 / MB8002', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(283, '7892968038293    ', 771427, 'BUCHA ESTABILIZADORA HILUX DT /BR15051105427', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(284, '', 771394, 'BUCHA ESTABLIZADOR SANDERO / BR10004105522 MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(285, '93247035    ', 0, 'BUCHA PONTA ESTABILIZADORA / PALIO /FZ00126267N', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(286, '03877.94', 770122, 'CABO DE EMBREAGEM / CELTA / CORSA', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(287, '7897843812029    ', 0, 'CABO DE EMBREAGEM / FIORINO 1.3 / UNO FIRE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(288, '7897707501892    ', 769700, 'CABO DE VELA - XS10001', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(289, '4047026263206    ', 770065, 'CABO DE VELA PALIO FIRE / SC-T09', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(290, '7897707503933    ', 771363, 'CABO DE VELA SANDERO 1.6 / F0099C135 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(291, '7897707503315    ', 89, 'CABO VELA BRAVO E-TORQ / SC-T66 NGK', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(292, '7897707501649    ', 769923, 'CABO VELA FIESTA ROCAM 1.0 1.6 / SC-F30 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(293, '7897707504237    ', 769930, 'CABO VELA GOL G4 / ST-V25 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(294, '7897843839101    ', 770595, 'CABO VELA NEW FIESTA / SC-F35 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(295, '7897707503902    ', 770063, 'CABO VELA ONIX1.0 1.4 / XS10638 DELPHI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(296, '7897707503414    ', 770415, 'CABO VELA PALIO EVO 1.4 / SC-T64 NGK', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(297, '7897707503001    ', 158, 'CABO VELA SANDERO 1.0 / SC-R16 NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(298, '', 770596, 'CABO VELA SANDERO 1.6 / SC-R13 NGK', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(299, '4047026263312    ', 770065, 'CABOS DE VELAS PALIO FIRE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(300, '7898436088456    ', 770986, 'CABOS VELA TUCSON / F00099C134 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(301, '7898436088456    ', 0, 'CACHIMBO AGUA CORSA / 7907 VP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(302, '7891579305534    ', 770118, 'CACHIMBO AGUA CORSA / 7907 VP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(303, '7890903051871    ', 771335, 'CADEIRA GOL G4 / BJC01024M COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(304, '7890903051864    ', 771210, 'CADEIRA PEUGEOUT DIREITO / NBJ5002DP', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(305, '7899892500063    ', 771209, 'CADEIRA PEUGEOUT ESQUERDO / NBJ5002EP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(306, '7898277982838    ', 771174, 'CALOTA GRID PALIO WEEKEND/STRADA 14/16 ARO 14\"\r', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(307, '7908162301160    ', 770910, 'CALOTA ROD ONIX/PRISMA 14/ ARO 15 PARAF P-195', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(308, '7898298062670    ', 771688, 'CANO DE AGUA CELTA / M123 MG', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(309, '7898298065473    ', 771631, 'CANO DE AGUA CORSA 94 / 01528 EIRELI', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(310, '7898474512029    ', 771332, 'CANO DE AGUA CORSA MERIVA 1.0 / 01631 EIRELE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(311, '7304700003754    ', 0, 'CANO DE AGUA DE FERRO FIAT', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(312, '7908162301214    ', 771630, 'CANO DE AGUA DO ONIX / MG375', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(313, '', 771634, 'CANO DE AGUA FIAT 1.8 / MG', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(314, '7898331577901    ', 771139, 'CANO DE AGUDA DE FERRO DO UNO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(315, '', 770546, 'CAVALO DE AGUA FIESTA ROCAM / 601.3035-100 IGUA?U', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(316, '7898261416561    ', 770756, 'CENTRAL FX MOLA 78900 UNO / SABO', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(317, '', 770755, 'CENTRAL FX MOLA MB474 UNO / MOBESANI', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(318, '', 771338, 'CHEVROLET CLASSIC RADIADOR NT-20080.523', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(319, '', 771356, 'CIL AUX EMB', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(320, '7894476059494    ', 770931, 'CIL ESC GRAND SIENA/PALIO EVO1.4 / 5120070100 LUK', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(321, '7893049343107    ', 770501, 'CIL RODA FIESTA TR / 005958 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(322, '7893049353755    ', 770507, 'CIL RODA TR C-3431 DUSTER 2012 4X2 / CONTRAIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(323, '', 0, 'CIL RODA TR C-3537 SANDERO 1.6 08-14 / CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(324, '7892294820012    ', 770510, 'CIL RODA TR C-3543 AMAROK 2011 / CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(325, '7894476062708    ', 771356, 'CILIDRO AUX EMBREAGEM GOL / VKCH4748 SKF', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(326, '7894476062708    ', 770498, 'CILIDRO RODA CELTA /PRISMA / 006447 ATE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(327, '', 770498, 'CILIDRO RODA CELTA PRISMA / 006447 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(328, '7897483457840    ', 770501, 'CILINDRO DE RODA DO PALIO E FIESTA / 5958', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(329, '7893049217460    ', 770521, 'CILINDRO MESTRE CELTA 06 / RCCD01670 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(330, '7893049209601    ', 770520, 'CILINDRO MESTRE CLASSIC 10 S-ABS / C-2174 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(331, '7894476061718    ', 770524, 'CILINDRO MESTRE CLIO C-ABS / C-2096 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(332, '', 770515, 'CILINDRO MESTRE CORSA SEDAN 98-07 / 005991 ATE', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(333, '7316573479420    ', 0, 'CILINDRO MESTRE DO GOL / G5 2006- 2008', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(334, '7893049215688    ', 771355, 'CILINDRO MESTRE EMBREAGEM GOL / 6284000032 SACHS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(335, '7894476064153    ', 770517, 'CILINDRO MESTRE FIESTA 2003 / C-2156 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(336, '7893049207584    ', 769719, 'CILINDRO MESTRE GRAND SIENA C/ABS / 007402 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(337, '7897483441733    ', 771489, 'CILINDRO MESTRE PALIO 98 / C-2075 CONTROIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(338, '7894476057216    ', 770522, 'CILINDRO MESTRE PALIO WEEKEND / RCCD01530 TRW', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(339, '7894476060018    ', 770519, 'CILINDRO MESTRE PARATI 94 / 006041 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(340, '7893049217897    ', 770525, 'CILINDRO MESTRE SANDERO 01-12 C-ABS / 006966 ATE', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(341, '7893049203326    ', 771037, 'CILINDRO MESTRE SANDERO S-ABS 07 / C-2178 CONTROIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(342, '7893049353595    ', 770523, 'CILINDRO MESTRE UNO MILLE / C-2033 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(343, '7897483441221    ', 771512, 'CILINDRO RODA C3 C-ABS / C-3535 CONTROIL', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(344, '7894476061725    ', 771580, 'CILINDRO RODA CELTA PRISMA 07 / RCCR02890 TRW', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(345, '7897483441269    ', 770500, 'CILINDRO RODA CELTA TS / 005516 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(346, '7893049349055    ', 771576, 'CILINDRO RODA CLIO / RCCR02910 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(347, '7894476062722    ', 770585, 'CILINDRO RODA CLIO 09 TS / CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(348, '7891989922680    ', 771382, 'CILINDRO RODA CLIO TS / 006446 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(349, '7891989922680    ', 771577, 'CILINDRO RODA DUSTER 4X2 12 / CCR-92268 FORTEC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(350, '7891989922703    ', 771577, 'CILINDRO RODA DUSTER 4X2 12 L-E / CCR-92268 FORTEC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(351, '4053203402252    ', 771579, 'CILINDRO RODA DUSTER 4X4 12 L-D / CCR-92270 FORTEC', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(352, '7893049353168    ', 770505, 'CILINDRO RODA GOL G5 1.0 1.6 TS / RCCR03510 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(353, '7891989922673    ', 770512, 'CILINDRO RODA HILUX 06 /C-3531 CONTROIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(354, '7893049351119    ', 770503, 'CILINDRO RODA ONIX 12 / CCR-92267 FORTEC', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(355, '7897483449722    ', 770509, 'CILINDRO RODA PEUGEOT 206 TS L-E / C-3511 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(356, '7893049351201    ', 770496, 'CILINDRO RODA PEUGEOT 207 TS L-D / RCCR02960 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(357, '7898591120732    ', 770508, 'CILINDRO RODA PEUGEOUT 206 T L-D / C-3512 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(358, '7893049353755    ', 770506, 'CILINDRO RODA S10 TS / 1085 KATHO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(359, '7894476033517    ', 779718, 'CILINDRO RODA SANDERO 08 1.6 / C-3537 CONTROIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(360, '7893049352192    ', 770502, 'CILINDRO RODA STRADA IDEIA TS / 005780 ATE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(361, '7892724415016    ', 770504, 'CILINDRO RODA VECTRA TS / C-3521 CONTROIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(362, '', 770528, 'COIFA CORSA RODA / 2-13-499G SPICER', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(363, '7899554017953    ', 770527, 'COIFA DO CAMBIO CELTA / 213509G', 0, '0.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(364, '', 0, 'COIFA DO CAMBIO DO SANDERO', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(365, '7892724415115    ', 771308, 'COIFA DO CAMBIO FIESTA ZETEC / PEUGEOUT 207', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(366, '', 770976, 'COIFA DO CAMBIO PALIO / 2-13-659G SPICER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(367, '629758    ', 0, 'CONEXAO FLUXO D?AGUA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(368, '7898410236644    ', 771431, 'CORREA HIDRULICO PALIO FIRE / 3PK905 DAYCO', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(369, '7891551148159    ', 771232, 'CORREIA ALTERNADOR GOL ELASTICA / 6PK1200EE DAYCO', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(370, '7898410233223    ', 0, 'CORREIA ARCOM SANDERO 1.0 / 3PK0740 CONTINENTAL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(371, '7898410233568    ', 770292, 'CORREIA DENT 104SP170H PEUGEOT / DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8);
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`) VALUES
(372, '7898410234381    ', 770225, 'CORREIA DENT 124P8S220H PALIO FIRE / DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(373, '', 41, 'CORREIA DENT 129P8220H EVO PALIO / DAYCO', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(374, '7898410233285    ', 0, 'CORREIA DENT 129P8220H EVO PALIO / DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(375, '7898447710391    ', 770202, 'CORREIA DENTADA CORSA ONIX / 111SP170H DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(376, '7898410233124    ', 769713, 'CORREIA DENTADA CORSA ONIX 111 / CT874 CONTINENTAL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(377, '7898410233148    ', 0, 'CORREIA DENTADA PEUGEOT 206 RENAULT CLIO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(378, '', 770701, 'CORREIA DENTADA SANDERO 1.6 / 096SP170H DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(379, '7899662106648    ', 771138, 'CORREIA DO ALTERNADOR / PALIO /SIENA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(380, '7894758176802    ', 769973, 'CORREIA EL HIDRO 3PK796EE GOL / DAYCO', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(381, '119205655r1', 771157, 'CORREIA GIR/DH/ACD PEUGEOT 206 4PK1540 DAYCON', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(382, '7898605589944    ', 769987, 'CORREIA HIDRAULICO SANDERO 1.0 /119205655R', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(383, '7891579230195    ', 770894, 'CORREIA ONIX ELASTICA ALT / 5KP1051 CONTINENTAL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(384, '7898261418091    ', 771525, 'COXIM AGILE VECTRA DT / KSC04107S COFAP', 0, '5.00', '2.50', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(385, '7892968010756    ', 769767, 'COXIM CLIO DT / MB9192A MOBESANE', 0, '5.00', '5.84', 2, NULL, '', '2021-03-18 22:45:38', 0, 8),
(386, '', 770730, 'COXIM CORSA CLASSIC / BR13202100789 / MONROE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(387, '', 771133, 'COXIM DO MOTOR ONIX DT / 95405221 GM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(388, '7898261411177    ', 771348, 'COXIM DO SILENCIOSO - MOBENSANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(389, '789296806109    ', 771349, 'COXIM DO SILENCIOSO PARTE TS / MB-1110', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(390, '', 769983, 'COXIM DT BR13102201280 GOL G3 / MONROE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(391, '7899850401043    ', 770723, 'COXIM DT CLIO / br13002201552', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(392, '', 771044, 'COXIM DT ETIOS / MB772A MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(393, '', 0, 'COXIM DT ETIOS / MB772A MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(394, '', 771069, 'COXIM DT STRADA 97 L-E / GTX461 GETOFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(395, '7892968017786    ', 771066, 'COXIM DT STRADA 97 L-E / GTX461 GWTOFLEX', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(396, '', 769682, 'COXIM GOL NOVO DT BR13102201517 / MONROE', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(397, '7891579363169    ', 770794, 'COXIM GOL TS / BR13104401516 AXIOS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(398, '7891579363169    ', 770795, 'COXIM GRAND SIENA TR / CXC03135 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(399, '', 770795, 'COXIM GRAND SIENA TR / CXC03135 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(400, '', 770733, 'COXIM HB20 DT / MB9131 MOBESANI', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(401, '7899850403696    ', 770725, 'COXIM HIDRAULICO -PEUGEOUT 206 / BR13052105419', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(402, '7899850407809    ', 771287, 'COXIM MOTOR GOL L-D / GTX3003A GETOFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(403, '', 770727, 'COXIM SANDERO DT / GTX9292A GETOFLEX', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(404, '7898318874313    ', 769659, 'COXIM VECTRA DT / GTX1174 GETOFLEX', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(405, '7898233434692    ', 770990, 'CUBO CORSA DT S-ROL / HFCD23 HIPPER FREIOS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(406, '7890903033983    ', 770978, 'CUBO FOX RODA TR C/ROL C/ABS / AL-974 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(407, '7890903033716    ', 771681, 'CUBO L200 TRITON DT / NKF8097 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(408, '7898233431028    ', 7709095, 'CUBO RODA ARGO TS C-ROL C-ABS / NKF8070 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(409, '7898233431127    ', 771449, 'CUBO RODA FIORINO TS / AL-650 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(410, '7898233439529    ', 770981, 'CUBO RODA GOL DT / AL-800 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(411, '7899270851398    ', 770988, 'CUBO RODA GOL G5/G6 TR C-ABS / AL-551 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(412, '7898233435545    ', 770989, 'CUBO RODA HB20 TR C-ABS / IR18561 IRB', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(413, '7898233437754    ', 770980, 'CUBO RODA NEW CIVIC 07 TR C-ABS / AL-895 IMA', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(414, '7898318874122    ', 770979, 'CUBO RODA PALIO 1.6 DT / AL-773 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(415, '31030401    ', 770991, 'CUBO RODA PALIO DT S-ROL / HFCD38 HIPPER FREIOS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(416, '7892861979518    ', 771244, 'CUBO RODA PUNTO 1.4 MOBI C-ROLAM / 31030401 VOBER', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(417, '7891200343300    ', 770996, 'CUBO RODA STRADA TR S-ABS / ALB70-235 ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(418, '', 771619, 'DESENGRIPANTE SUPER LUB / LOCTITE', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(419, '7898318870179    ', 771186, 'DISCO DE FREIO CELTA CORSA / HF23 HIPPERFREIOS', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(420, '', 771186, 'DISCO DE FREIO CELTA CORSA / HF23 HIPPERFREIOS', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(421, '7898500310247    ', 771693, 'DISCO DE FREIO ETIOS / RCDI09620 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(422, '7898500318342    ', 770925, 'DISCO DE FREIO GOL 1.0 / HF87A HIPERFREIOS', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(423, '', 0, 'DISCO DE FREIO NEW FIESTA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(424, '7898318870711    ', 0, 'DISCO DE FREIO NOVO C3 / RCDI02800', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(425, '4013872856930    ', 769995, 'DISCO DE FREIO SANDERO 1.6 / HF549 HIPPERFREIO', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(426, '7892294901407    ', 771168, 'EMBREAGEM CELTA CLASSIC / 3000001211 SACHS', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(427, '4013872872329    ', 132, 'EMBREAGEM FIESTA ROCAM / 3000951294 SACHS', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(428, '', 0, 'EMBREAGEM HB20 / 3000001240 SACH', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(429, '4013872856923    ', 769759, 'EMBREAGEM MONTANA / 3000001240 SACHS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(430, '01842.5', 769726, 'EMBREAGEM MONTANA 1.4 C-ATUADOR / 3000001210 SACHS', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(431, '01842.5', 0, 'ESPOLETA DO FIAT', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(432, '', 771126, 'ESPOLETA DO FIAT 30.00M - 01842.5', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(433, '7798186479248    ', 770758, 'ESTABILIZADOR UNO KIT PRETO', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(434, '7798001698779    ', 0, 'FAP-5218 / FILTRO DE AR MOTO KWID', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(435, '', 771034, 'FILTRO AR MOTOR / AKX1993', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(436, '7891342011761    ', 769845, 'FILTRO AR MOTOR / ARL4147', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(437, '7899736151826    ', 81, 'FILTRO AR MOTOR / ARL4152', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(438, '7798186471808    ', 770270, 'FILTRO AR MOTOR / ARL4161', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(439, '', 771032, 'FILTRO AR MOTOR / FAP-3288', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(440, '7798159120351    ', 770282, 'FILTRO AR MOTOR AMAROK / FAP-4046 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(441, '7891342004787    ', 770202, 'FILTRO AR MOTOR AMAROK / FAP-4046 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(442, '7798159121884    ', 770312, 'FILTRO AR MOTOR ASTRA 99 / ARL8840 TECFIL', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(443, '7891342011976    ', 770335, 'FILTRO AR MOTOR BRAVO 1.8 E-TORQ / FAP-9121 WEGA.', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(444, '7891342005340    ', 770310, 'FILTRO AR MOTOR BRAVO E-TORQ / ARL4154 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(445, '7891342005340    ', 769801, 'FILTRO AR MOTOR CELTA PRISMA / ARL8834 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(446, '7798151941954    ', 769801, 'FILTRO AR MOTOR CELTA PRISMA / ARL8834 TECFIL.', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(447, '7891342011785    ', 770205, 'FILTRO AR MOTOR CITROEN C3 1.4 / FAP3615 WEGA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(448, '7891342014618    ', 770324, 'FILTRO AR MOTOR CIVIC 1.8 / ARL1034 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(449, '7798001699929    ', 770306, 'FILTRO AR MOTOR CLIO 1.0 16V / ARL5141 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(450, '7798001692708    ', 770247, 'FILTRO AR MOTOR CLIO 1.0 16V / FAP-4871 WEGA.', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(451, '7798001693507    ', 770221, 'FILTRO AR MOTOR CLIO 1.6 / FAP-9273 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(452, '7798001690230    ', 770246, 'FILTRO AR MOTOR CLIO HI / FAP-4872/1 WEGA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(453, '7798001690605    ', 770269, 'FILTRO AR MOTOR COROLLA 08 / JFA-0428 WEGA', 0, '0.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(454, '7798001698182    ', 770017, 'FILTRO AR MOTOR COROLLA NEW 02 / JFA0283 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(455, '7891342002172    ', 770824, 'FILTRO AR MOTOR COROLLA NOVO 1.6 / JFA-0285 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(456, '7891342005791    ', 770267, 'FILTRO AR MOTOR CORSA CLASSIC / ARL8832 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(457, '7798001696331    ', 770275, 'FILTRO AR MOTOR CRUZE 1.8 / ARL8828 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(458, '7891342506182    ', 770338, 'FILTRO AR MOTOR CRV 08 / JFA-0433 WEGA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(459, '7891342017824    ', 770279, 'FILTRO AR MOTOR DOBL? / ARS1029 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(460, '7891342013086    ', 770320, 'FILTRO AR MOTOR ECOESPORT 17 / ART9618 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(461, '7891342017114    ', 770300, 'FILTRO AR MOTOR ETIOS 1.3 FLEX / ARL2204', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(462, '7891342005524    ', 771425, 'FILTRO AR MOTOR ETIOS 2016 / ARL2207 TECFIL', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(463, '7891342008334    ', 770289, 'FILTRO AR MOTOR FIESTA ROCAM / ARL9608 TECFIL', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(464, '7891342015349    ', 770908, 'FILTRO AR MOTOR FIT 1.4 / ARL1033 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(465, '7891342013338    ', 770323, 'FILTRO AR MOTOR FIT 2014 / ARL1038 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(466, '7891342015417    ', 770308, 'FILTRO AR MOTOR FLUENCE 2.0 / ARL5143 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(467, '7891342013765    ', 770285, 'FILTRO AR MOTOR FORD KA / ART9615 TECFIL', 0, '0.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(468, '7798001695884    ', 770302, 'FILTRO AR MOTOR FRONTIER 2.5 / ARL9600 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(469, '7891342010993    ', 770332, 'FILTRO AR MOTOR FRONTIER 2.5 TURB /JFA-0118 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(470, '7891342006217    ', 770278, 'FILTRO AR MOTOR GOL 08 FOX / ART6098 TECFIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(471, '7891342004770    ', 769795, 'FILTRO AR MOTOR GOL 1.0 / ARL6096 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(472, '7798001695563    ', 771031, 'FILTRO AR MOTOR GOLF 99 / ARL6093 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(473, '7798001692616    ', 770273, 'FILTRO AR MOTOR GRAND VITARA 08 / JFA-0893 WEGA', 0, '0.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(474, '7798159126452    ', 770272, 'FILTRO AR MOTOR GRANVITARA / JFA-0897 WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(475, '7891342015653    ', 770023, 'FILTRO AR MOTOR HB20 1.0 / JFA-0K16 WEGA.', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(476, '', 770321, 'FILTRO AR MOTOR HB20 1.6 13 / ARL2340 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(477, '7798001692623    ', 771692, 'FILTRO AR MOTOR HILLUX / ARS7065 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(478, '7798186474748    ', 769676, 'FILTRO AR MOTOR HILUX / JFA0292/2 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(479, '7798001697598    ', 770271, 'FILTRO AR MOTOR HILUX 2.8 TDI 16V / JFA-0282 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(480, '7798186473864    ', 770290, 'FILTRO AR MOTOR HONDA FIT / JFA-428/3 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(481, '7891342510844    ', 770339, 'FILTRO AR MOTOR HONDA HRV 15 / JFA-0440 WEGA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(482, '7798001697352    ', 770299, 'FILTRO AR MOTOR HR / AR8113 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(483, '7891342505444    ', 770277, 'FILTRO AR MOTOR I30 2.0 / JFA-K21 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(484, '7891342013741    ', 770326, 'FILTRO AR MOTOR L200 OUTDOOR / ARS7109 TECFIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(485, '7891342013758    ', 0, 'FILTRO AR MOTOR LIVINA FLEX / ARL1654 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(486, '7891342011006    ', 770305, 'FILTRO AR MOTOR MARCH VERSA 1.6 / ARL1655 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(487, '7891342005791    ', 771030, 'FILTRO AR MOTOR MEGANE 06 / ART5054 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(488, '7891342012447    ', 770314, 'FILTRO AR MOTOR MERIVA / ARL8825 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(489, '7798186477053    ', 770313, 'FILTRO AR MOTOR MERIVA / ART8826 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(490, '7798159128357    ', 771151, 'FILTRO AR MOTOR MOBI / FAP2829 WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(491, '7798159124090    ', 770276, 'FILTRO AR MOTOR NEW CIVIC 08 / JFA-0438 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(492, '7798159129477    ', 769666, 'FILTRO AR MOTOR NEW FIESTA / FAP-9286 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(493, '7798159129460    ', 771673, 'FILTRO AR MOTOR NEW FIESTA / FAP-9295 WEGA', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(494, '7798001690575    ', 771029, 'FILTRO AR MOTOR ONIX / FAP-3286 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(495, '7891342002226    ', 770336, 'FILTRO AR MOTOR PAJEROTR4 LANCER JFA-587 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(496, '7798001697529    ', 770309, 'FILTRO AR MOTOR PALIO FIRE / ARL4150 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(497, '7798001696768    ', 770329, 'FILTRO AR MOTOR PEUGEOT 207 1.4 / FAP-6000 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(498, '7798001690872    ', 770328, 'FILTRO AR MOTOR PEUGEOT 207 1.6 / FAP4054/2 WEGA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(499, '7798001690865    ', 769903, 'FILTRO AR MOTOR PUNTO 1.4 07 / FAP-9015 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(500, '7798159127848    ', 770334, 'FILTRO AR MOTOR PUNTO FLEX / FAP-9014 WEGA', 0, '5.00', '6.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(501, '7798159127848    ', 770327, 'FILTRO AR MOTOR RANGER 11 / WR-191 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(502, '7891342015875    ', 770327, 'FILTRO AR MOTOR RANGER 11 / WR191 WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(503, '', 0, 'FILTRO AR MOTOR RENEGADE 1.8 FLEX / ARL4157 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(504, '7891342512466    ', 771676, 'FILTRO AR MOTOR S10 05 / ARS2869 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(505, '7798001696942    ', 769715, 'FILTRO AR MOTOR S10 2012 / ARS2870 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(506, '7798186475103    ', 770266, 'FILTRO AR MOTOR SANDERO / WR-245 WEGA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(507, '7891342012256    ', 771143, 'FILTRO AR MOTOR SANDERO NOVO / FAP9299 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(508, '7798151942234    ', 770322, 'FILTRO AR MOTOR SANTA FE / ARL2332 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(509, '7798001697543    ', 770274, 'FILTRO AR MOTOR SENTRA 2.0 / FAP-7013 WEGA', 0, '0.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(510, '7798001698199    ', 770333, 'FILTRO AR MOTOR SOUL 09/ JFA-K22 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(511, '7798001690582    ', 770283, 'FILTRO AR MOTOR TRITON L-200 / JFA-500 WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(512, '7891342002042    ', 769714, 'FILTRO AR MOTOR TUCSON 2.7 V6 / JFA-0H12 WEGA.', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(513, '7891342011761    ', 769845, 'FILTRO AR MOTOR UNO MILLE 92 / ARL4147 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(514, '7891342017121    ', 81, 'FILTRO AR MOTOR UNO WAY / ARL4152 TECFIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(515, '7891342012249    ', 770318, 'FILTRO AR MOTOR UP / ARL6076 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(516, '7891342005609    ', 769697, 'FILTRO CAB / ACP205', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(517, '7798001691213    ', 770082, 'FILTRO CAB / ACP003', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(518, '7891342005623    ', 770297, 'FILTRO CAB AMAROK / AKX1140 WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(519, '7891342010757    ', 770013, 'FILTRO CAB ASTRA / ACP001 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(520, '7891342010924    ', 770294, 'FILTRO CAB CIVIC / ACP708 TECFIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(521, '7891342005920    ', 770248, 'FILTRO CAB CLIO / ACP550 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(522, '7798186471648    ', 770245, 'FILTRO CAB ECOSPORT / ACP202 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(523, '7891342005586    ', 769941, 'FILTRO CAB ETIOS / AKX2161 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(524, '7891342005548    ', 770029, 'FILTRO CAB FIESTA ROCAM / ACP200 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(525, '7891342005951    ', 770265, 'FILTRO CAB GOLF / ACP300 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(526, '7891342005913    ', 770012, 'FILTRO CAB MONTANA / ACP005 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(527, '7891342007955    ', 770083, 'FILTRO CAB PALIO / ACP103 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(528, '7891342013826    ', 770291, 'FILTRO CAB PEUGEOT 206 / ACP800 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(529, '7891342013024    ', 770022, 'FILTRO CAB PEUGEOT 308 / ACP809 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(530, '7892415915306    ', 770244, 'FILTRO CAB S10 / ACP843 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(531, '7798159123062    ', 0, 'FILTRO CAB SANDERO / AKX-1397 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(532, '7891342012874    ', 770000, 'FILTRO CAB SANDERO / AKX1397 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(533, '7892415915306    ', 770011, 'FILTRO CAB UNO SIENA / ACP906 TECFIL', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(534, '7891342011426    ', 771105, 'FILTRO CABINE COROLLA S10 08/ HILUX 2.5/ - LA655', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(535, '7892415942012    ', 770249, 'FILTRO CABINE I30 / ACP979 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(536, '7891342012485    ', 771585, 'FILTRO CABINE NEW FIESTA / LA785 MAHLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(537, '7891342014441    ', 771242, 'FILTRO CABINE SANDERO KWID / ACP554 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(538, '7798159129750    ', 771551, 'FILTRO CABINE UP 1.0 14 / ACP367 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(539, '7798001694511    ', 770535, 'FILTRO COMB DIESEL FCD-0785 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(540, '7891342008204    ', 770036, 'FILTRO COMB DIESEL JFC-197 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(541, '7891342008112    ', 770386, 'FILTRO COMB UNO / GASOLINA GI40/7 / TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(542, '7798159127077    ', 26, 'FILTRO COMBUST TODOS EM GERAL / GI04/7 TECFIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(543, '7798159129064    ', 770357, 'FILTRO COMBUSTIVEEL GASOLINA JFC-239 / WEGA', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(544, '7798001694528    ', 769658, 'FILTRO COMBUSTIVEL DIESEL JFC-199/1 / WEGA', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(545, '7798186473000    ', 770364, 'FILTRO COMBUSTIVEL DIESEL JFC-215 / WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(546, '7891342015943    ', 770349, 'FILTRO COMBUSTIVEL DIESEL JFC-H27 / WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(547, '7891342010634    ', 770344, 'FILTRO COMBUSTIVEL DIESEL PC953 / TECFIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(548, '7798001690988    ', 770343, 'FILTRO COMBUSTIVEL DIESEL PSC498/4 / TECFIL', 0, '5.00', '5.00', 111, NULL, '', '2021-03-18 22:45:38', 0, 8),
(549, '7798186474755    ', 770348, 'FILTRO COMBUSTIVEL DIESEL REFIL JFC-207/2 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(550, '7891342008129    ', 770351, 'FILTRO COMBUSTIVEL DIESEL REFIL JFC-207/3 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(551, '7799076004199    ', 770385, 'FILTRO COMBUSTIVEL DO FOX - GI12/7', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(552, '7891342015431    ', 771448, 'FILTRO COMBUSTIVEL FIESTA ROCAM / FCI1695A WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(553, '', 770400, 'FILTRO COMBUSTIVEL REFIL AMAROK / FCI1274 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(554, '7891342008136    ', 770400, 'FILTRO COMBUSTIVEL REFIL FCI-1274 / WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(555, '', 770610, 'FILTRO COMBUSTIVEL S10 GASOLINA / GI06/7 TECFIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(556, '7891342012294    ', 770305, 'FILTRO DE AR MOTO / ARL1655', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(557, '7891342016377    ', 84, 'FILTRO DE CAB / ACP126', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(558, '7891342007962    ', 770325, 'FILTRO DE CAB / ARL5144', 0, '55.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(559, '7891342010931    ', 770296, 'FILTRO DE CAB / ACP303', 1, '1.50', '5.00', 1, 0, './imgs/sag-8.png', '2021-03-18 22:45:38', 7, 13),
(560, '7798001695402    ', 770243, 'FILTRO DE CAB / ACP887', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(561, '7891342015721    ', 770278, 'FILTRO DE CAB / ART6098', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(562, '7798159122911    ', 770295, 'FILTRO DE CABINE DO SANDERO / ACP559', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(563, '7798186472041    ', 771192, 'FILTRO DE COMBUSTIVEL FERRO - JFC-383', 0, '0.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(564, '', 771025, 'FILTRO DE COMBUSTIVEL HR / JFC-901/1 WEGA', 0, '5.00', '55.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(565, '7891342013130    ', 770341, 'FILTRO DE DIESIEL - REFIL DA NOVA HILUX', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(566, '7891342011983    ', 0, 'FILTRO DE OLEO / PSL557', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(567, '7798186476940    ', 770397, 'FILTRO DE ?LEO - PEL119', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(568, '7798001699295    ', 770395, 'FILTRO DE OLEO - WO121', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(569, '7891342008105    ', 770413, 'FILTRO DE OLEO - WO200', 0, '5.00', '5.78', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(570, '7891342005296    ', 770387, 'FILTRO DE OLEO / GI60/7', 0, '5.00', '5.83', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(571, '7891342016414    ', 770006, 'FILTRO DE OLEO / PSL55', 0, '5.00', '5.27', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(572, '7798001699974    ', 770390, 'FILTRO DE OLEO / PSL56', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(573, '', 770412, 'FILTRO DE OLEO / WO205', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(574, '7891342010863    ', 769690, 'FILTRO DE ?LEO / WOE803', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(575, '7798186478234    ', 769900, 'FILTRO DE OLEO DA HR / PSL 332', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(576, '7891342008297    ', 770333, 'FILTRO DE OLEO DO KWID - WO-412', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(577, '7798159121556    ', 770396, 'FILTRO DE OLEO PEUGEOT / PEL108', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(578, '7898001699226    ', 112, 'FILTRO DE OLEO REFIL CRUZER / WOE313', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(579, '7891342015691    ', 771072, 'FILTRO DE OLEO WO130', 0, '0.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(580, '7798159128241    ', 771127, 'FILTRO DIESEL HILUX SECUN / FCI778 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(581, '7798159120399    ', 769722, 'FILTRO DIESEL S10 12 REFIL / FCD-0777 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(582, '7798001697659    ', 771330, 'FILTRO OLEO AMAROK REFIL / WOE-680 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(583, '7798001699196    ', 770353, 'FILTRO OLEO CAPTIVA REFIL / WOE-312 WEGA', 0, '0.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(584, '7798001694665    ', 770754, 'FILTRO OLEO CLIO 1.0 REFIL / WOE-500 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(585, '7798159121525    ', 769698, 'FILTRO OLEO COROLLA / JFO-0210/1 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(586, '7891342003087    ', 769699, 'FILTRO OLEO COROLLA REFIL / WOE-803 WEGA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(587, '7891342000185    ', 770409, 'FILTRO OLEO D20 / PSC496 TECFIL', 0, '0.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(588, '7891342004947    ', 770406, 'FILTRO OLEO D20 / PSL900 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(589, '7891342006576    ', 771586, 'FILTRO OLEO DUSTER 1.6 / PSL77 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(590, '7798159121686    ', 770398, 'FILTRO OLEO ECOSPORT / PSL147 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(591, '7891342000680    ', 771191, 'FILTRO OLEO ECOSPORT 1.6 1 / WO-152', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(592, '7891342007849    ', 770086, 'FILTRO OLEO FIESTA / PSL146 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(593, '7891342015585    ', 770408, 'FILTRO OLEO FRONTIER / PSC498/3 TECFIL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(594, '7891342000178    ', 771360, 'FILTRO OLEO FRONTIER REFIL DIESEL / PEL678 TECFIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(595, '7798001692968    ', 770401, 'FILTRO OLEO GOL / PSL565 TECFIL', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(596, '7891342000222    ', 771071, 'FILTRO OLEO GOL / WO340 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(597, '7798001694863    ', 769974, 'FILTRO OLEO GOLF / PSL562 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(598, '7798001694689    ', 770393, 'FILTRO OLEO HB20 1.6 / JFO-0598 WEGA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(599, '7891342000123    ', 770363, 'FILTRO OLEO HILUX / JFO-0213 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(600, '7891342010863    ', 770004, 'FILTRO OLEO JEEP / PSL47 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(601, '7798186471938    ', 770407, 'FILTRO OLEO KIA / PSL332 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(602, '7891342000383    ', 770352, 'FILTRO OLEO MASTER REFIL / WOE-506 WEGA', 0, '5.00', '6.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(603, '7891342005456    ', 770346, 'FILTRO OLEO MB710 REFIL / PL364 TECFIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(604, '7891342000192    ', 770403, 'FILTRO OLEO MB712 REFIL / PEL2003 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(605, '7798001694825    ', 770008, 'FILTRO OLEO ONIX / PSL619 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(606, '7891342000512    ', 770350, 'FILTRO OLEO PAJERO / JFO-0506 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(607, '7891342008174    ', 770391, 'FILTRO OLEO PAJERO / PSL135 TECFIL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(608, '7798001692982    ', 770402, 'FILTRO OLEO PEUGEOT206 REFIL / PEL110 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(609, '7798001692982    ', 771326, 'FILTRO OLEO PEUGEOUT 206 C3 REFIL / WOE-710 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(610, '7891342011723    ', 771326, 'FILTRO OLEO PEUGEOUT 206 REFIL / WOE-710 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(611, '7891342014649    ', 770345, 'FILTRO OLEO RANGER / PSL541 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(612, '7798001693019    ', 769940, 'FILTRO OLEO RANGER REFIL / PEL309 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(613, '7798159128685    ', 770360, 'FILTRO OLEO RANGER REFIL / WOE-130 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(614, '7798186474335    ', 770361, 'FILTRO OLEO RANGER REFIL / WOE131 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(615, '7891342005395    ', 770362, 'FILTRO OLEO RENEGADE REFIL / WOE-626 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(616, '7798159128272    ', 770342, 'FILTRO OLEO S10 / PSL340 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(617, '7891342013345    ', 770355, 'FILTRO OLEO S10 REFIL / WOE-314 WEGA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(618, '7798151944641    ', 770341, 'FILTRO OLEO SORENTO / PEL722 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(619, '', 770404, 'FILTRO OLEO SORENTO / WOE-903 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(620, '7891342000628    ', 771026, 'FILTRO OLEO SORENTO / WOE905 WEGA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(621, '7891342005722    ', 770410, 'FILTRO OLEO SPORTAGE / PSL321 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(622, '7891342000437    ', 770340, 'FILTRO OLEO TUCSON / PSL152 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(623, '7891342011679    ', 770392, 'FILTRO OLEO UNO 2.0 / PSL45 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(624, '7898300981678    ', 770389, 'FILTRO OLEO VITARA / PSL615 TECFIL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(625, '7897417621804    ', 10153, 'FITA DO FEIXA DE MOLA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(626, '7894325106966    ', 771128, 'FIXO DO CAMBIO GRAND SIENA / 876SS BFX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(627, '7892968018127    ', 771127, 'FIXO DO MOTOR NOVO PALIO / 1091 SAMPEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(628, 'GTX9085', 0, 'FIXO INFERIO / PEUGEOUT 206', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(629, '7899850403917    ', 0, 'FIXO INFERIOR DA CAIXA DE MACHA DO SANDEIRO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(630, '', 771435, 'FIXO MOTOR SANDERO INF / GTX9085 GETOFLEX', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(631, '7899751926447    ', 0, 'FREIO CARNEIRO DO SANDERO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(632, '440621679118    ', 0, 'GS2963', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(633, '7898500318168    ', 0, 'GTX462', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(634, '', 0, 'HF18H DISCO DE FREIO DO NEW FIESTA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(635, '', 770108, 'INTERRUPTOR DE OLEO GM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(636, '7893548049579    ', 0, 'JOGO DE VELA HB20 1.6 / NGK', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(637, '', 0, 'JUNTA DA TAMPA DA VALVULA / SIENA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(638, '', 75628, 'JUNTA DA TAMPA DE VALVULA DO PEUGEOUT / SANDEIRO', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(639, '', 771224, 'JUNTA DO CABE?OTE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(640, '', 770976, 'JUNTA H BRAVA / 2-13-659G SPICER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(641, '7898233437587    ', 769917, 'JUNTA H CELTA / ALB1355-499 ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(642, '7892861979136    ', 770378, 'JUNTA H SPACE FOX C/ABS / AL-1155 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(643, '', 770372, 'JUNTA H VERSA / ALB325-129A ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(644, '7890903011264    ', 770367, 'JUNTA HOMICINETICA PALIO FIRE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(645, '', 771196, 'JUNTA HOMOCINETICA CELTA 1.0 / NJH55-499 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(646, '7892861978474    ', 771327, 'JUNTA HOMOCINETICA 2231-2029 ALBARUS NOVO UNO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(647, '7890903011264    ', 771463, 'JUNTA HOMOCINETICA AGILE 1.4 /ALB1345-909A ALB', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(648, '', 0, 'JUNTA HOMOCINETICA CORSA CLASSIC NJH55-499', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(649, '7892861979174    ', 771196, 'JUNTA HOMOCINETICA DO CELTA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(650, '7890903053134    ', 771432, 'JUNTA HOMOCINETICA DOBLO1.8 / ALB4000-8772 ALB', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(651, '7892861978757    ', 771197, 'JUNTA HOMOCINETICA FIAT BRAVO / 4000-8772 SPICER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(652, '7892861979136    ', 770058, 'JUNTA HOMOCINETICA FIESTA RO / ALB1735-909 ALBA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(653, '7892724027097    ', 770372, 'JUNTA HOMOCINETICA GOL 1.6 / ALB325-129A ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(654, '7890903035505    ', 770379, 'JUNTA HOMOCINETICA GOLF / 1761-289 SPICER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(655, '7890903035543    ', 770371, 'JUNTA HOMOCINETICA GRAND SIENA / NJH21-1409 NA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(656, '7890903035543    ', 771440, 'JUNTA HOMOCINETICA NOV UNO 1.0 / NJH31-2029 NAK', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(657, '880147061412    ', 0, 'JUNTA HOMOCINETICA NOVO UNO 1.0 NJH31-2029', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(658, '7899605405357    ', 771036, 'JUNTA HOMOCINETICA ONIX / NJH04-6481 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(659, '7890903061399    ', 770373, 'JUNTA HOMOCINETICA ONIX 1.4 / H30540 KICTECH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(660, '7890903061399    ', 771443, 'JUNTA HOMOCINETICA ONIX 1.4 1.8 AUT / NJH03-0580', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(661, '7892861978597    ', 771443, 'JUNTA HOMOCINETICA ONIX 1.4 1.8 AUT / NJH03-0580', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(662, '7890903031569    ', 770367, 'JUNTA HOMOCIN?TICA PALIO / ALB1491-599 ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(663, '', 770377, 'JUNTA HOMOCINETICA POLO / NJH71-839 NAKATA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(664, '7892861978795    ', 770366, 'JUNTA HOMOCINETICA STRADA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(665, '', 770366, 'JUNTA HOMOCINETICA STRADA / ALB1805-669 ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(666, '7898435872704    ', 770370, 'JUNTA HOMOCINTICA - NJH91-599', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(667, '', 771017, 'JUNTA TAMPA GRANDSIENA / 141787BN BASTOS', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(668, '7898435869025    ', 769972, 'JUNTA TAMPA VALV BOR', 0, '55.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(669, '7891252756134    ', 771166, 'JUNTA TAMPA VALV PALIO 1.0/1.4 /EVO - 141785BN', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(670, '7898233437587    ', 770207, 'JUNTA TAMPA VALVULA PALIO FIRE / 75613 SAB?\r', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(671, '7890903048413    ', 770378, 'JUNTO HOMOCINETICA POLO 1.6 SEM ABS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(672, '7899662102305    ', 770912, 'KIT AMORTECEDOR PARCIAL RENAULT LOGAN -', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 0),
(673, '7892724415283    ', 102, 'KIT CORREIA DENT KTB333 PEUGEOT / DAYCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(674, '', 0, 'Kit de Reparo da Junta Homocin?tica Spicer 213599GN', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(675, '4005108192806    ', 769684, 'KIT EMB DIS PLA COL 180MM 26 EST', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(676, '', 771406, 'KIT EMBR PALIO/SIENA 1.0/1.4 8V 1.3 16V - 61930150', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(677, '', 0, 'KIT EMBRAGEM HOGGAR 228011', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(678, '7892294629103    ', 771305, 'KIT EMBREAGEM SANDEIRO 1.6 / 3000 001 091', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(679, '', 769701, 'KIT EMBREAGEM SAVEIRO 1.6 G5 / 3000000782 SACHS', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(680, '7898300981753    ', 770759, 'KIT ESTAB DT INTERNO 10309 UNO / KIT&CIA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(681, '7898300981760    ', 0, 'KIT ESTABILAZADOR DT / UNO MILLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(682, '', 0, 'KIT ESTABILIZADOR - KIT & CIA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(683, '7892724415016    ', 771309, 'KIT REP JUNTA HOMOC L RD', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(684, '7890903047843    ', 770528, 'KIT REP JUNTA HOMOC L RD C NF: 213499G NKJ499 7855', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(685, '7891579229014    ', 0, 'KIT REPARO AMORTECEDORES / NK0404', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(686, '7892415625809    ', 769818, 'KIT SUSPENSAO GOL DT / KSC01101S COFAP', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(687, '7891579315366    ', 771204, 'KL582', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(688, '', 771254, 'LAMPADA H11', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(689, '7893026493030    ', 770430, 'LONA DE FREIO DA DUSTER 4X4 / NKF3055', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(690, '7890903061566    ', 771603, 'LONA DE FREIO DOBLO 1.8 / FI/138-CP FRASLE', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(691, '', 771439, 'LONA DE FREIO DUSTER 4X2 / NKF3054CA NAKATA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(692, '7893026847406    ', 0, 'LONA DE FREIO FD/152 - CPA / FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(693, '7893026761986    ', 0, 'LONA DE FREIO PALIO / FI/97-CPA', 0, '0.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(694, '7890903033822    ', 771158, 'LONA FREIO IDEIA PALIO TS / FI/91-CPA FRASLE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(695, '01007069.h', 770977, 'MANCAL HILUX DT C/ROL / NKF8081 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(696, '', 769654, 'MANGOTE CORSA T / 13226 CAUPLAS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(697, '7908162300880    ', 770834, 'MANGOTE FLTRO AR MOTOR C9018 CELTA / CONTROIL', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(698, '', 770828, 'MANGOTE RESP OLEO MG091 UNO VIVACE 2011', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(699, '7891579091192    ', 114, 'MANGUEIRA PALIO / 8518', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(700, '', 771293, 'MOLA HELICOIDAL - PAR / MC.ECHE77 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(701, '7898522907913    ', 770798, 'MOTOR DE PARTIDA', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(702, '7892679063676    ', 771407, 'MT VENT RADIAD CORSA CLASSIC 10/S/DEFLET - MQ0791', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(703, '7890903078441    ', 771378, 'N-367 / PASTILHA DO ONIX DT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(704, '7896636546837    ', 0, 'N92004 / BIELETA DO FIESTA ROCAM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(705, '7895291056224    ', 771194, 'OLEO 10W40 SEMI-SINTETICO / OMNICRAFT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(706, '7896587325208    ', 771591, 'OLEO 15W40 DIESEL / ACDELCO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(707, '7896636544932    ', 770253, 'OLEO 15W40 DIESEL 1L / MOTRIO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(708, '7895291056149    ', 771193, 'OLEO 20W50 1L SEMI-SINTETICO / MOTORCRAFT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(709, '7896587327165    ', 771610, 'OLEO 20W50 MINERAL / ACDELCO', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(710, '7898173501355    ', 770384, 'OLEO 20W50 SEMI-SINTETICO 1L / MOTRIO', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(711, '7898066770998    ', 771082, 'OLEO ATF RADNAQ 500ML', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(712, '4047025341110    ', 771083, 'OLEO DA CAIXA DE MARCHA - 80W90', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(713, '7897483400051    ', 770257, 'OLEO DE FREIO 500ML / DOT 3', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(714, '7897483426549    ', 771145, 'OLEO DE FREIO DOT 4 / 500ML', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(715, '7891414360339    ', 771146, 'OLEO DE FREIO DOT 4 /200ML', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(716, '7897170502204    ', 771195, 'OLEO DIESEL URANIA / 15W40', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(717, '7891414396154    ', 771419, 'OLEO HIDRAULICO FTA 500ML / INGRAX', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(718, '7898245572054    ', 771089, 'OLEO SEMI-SINT?TICO 20W50 1L /PETRONAS SYNTIUM 300', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(719, '7898314112303    ', 771354, 'OLEO SINTETICO ELAION / 5W30', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(720, '7893026872767    ', 94, 'ORBI-AIR HIGIENIZADOR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(721, '7891100303220    ', 770446, 'P-1433 - PASTILHA DE FREIO DT S-10', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(722, '7891100303220    ', 0, 'PALHETA AGILE MONTANA / SD3', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(723, '4047024160699    ', 771613, 'PALHETA AGILE MONTANA / SD3 DYNA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(724, '4047023029140    ', 770212, 'PALHETA B315 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(725, '4047025127073    ', 75, 'PALHETA B340 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(726, '4047025110303    ', 770134, 'PALHETA CELTA AGILE / AF18 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(727, '7891100015055    ', 771614, 'PALHETA CELTA TS / 15E BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(728, '4047025217309    ', 771615, 'PALHETA CELTA TS / 15E DYNA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(729, '4047025127059    ', 771617, 'PALHETA CIVIC 2007 DT / AP26M BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(730, '4047023028853    ', 770135, 'PALHETA COBALT MOBI DT / AF16 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(731, '4047025127141    ', 769904, 'PALHETA CORSA / B056 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(732, '7891100014058    ', 771491, 'PALHETA ETIOS DT / AF26 BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(733, '7891100307228    ', 771613, 'PALHETA GOL G4 TS / 14E DYNA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(734, '4047025110266    ', 769648, 'PALHETA GOL G6 / SD7 DYNA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(735, '7891100304227    ', 769746, 'PALHETA KA FOX TS / 10E BOSCH', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(736, '4047025139601    ', 771465, 'PALHETA KA NEW FIESTA / SD4 DYNA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(737, '7891100306221    ', 771618, 'PALHETA L-200 2008 DT / AF323 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(738, '4047026248043    ', 769792, 'PALHETA ONIX UP / SD6 DYNA', 0, '0.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(739, '7899613612150    ', 770214, 'PALHETA S10 12 / SD5 BOSCH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(740, '7891100015055    ', 771068, 'PALHETA SANDERO DT / PVF2220 VETOR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(741, '7899613609679    ', 0, 'palheta ts 15E', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(742, '7891100309222    ', 771049, 'PALHETA UP / PVF2416U VETOR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(743, '7899613609112    ', 771154, 'PALHETA UP 14 DT / SD9 DYNA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(744, '3276425784154    ', 770213, 'PALHETA UP TS / PVF10U VETOR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(745, '7890903025056    ', 771616, 'PALHETA VECTRA GT DT / 578415 VALEO', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8);
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`) VALUES
(746, '7892679064161    ', 770919, 'PASTILHA DE FEIO DA HILLUX/SW4 - NKF1239P', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(747, '7892679069401    ', 770494, 'PASTILHA DE FREIO / DT N-1464 QQ COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(748, '7895467186830    ', 769837, 'PASTILHA DE FREIO N-457', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(749, '7897483489742    ', 770465, 'PASTILHA DE FREIO PW984', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(750, '7897483492520    ', 769948, 'PASTILHA DE FREIO RCPT12630', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(751, '7897483405285    ', 90, 'PASTILHA DE FREIO RCPT13680', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(752, '7897453401751    ', 770916, 'PASTILHA DE FREIO RCPT13810', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(753, '7890903025124    ', 0, 'PASTILHA DE FREIO / RCPT13750', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(754, '7893026872767    ', 770068, 'PASTILHA DE FREIO / NKF1246P', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(755, '7893026549027    ', 770446, 'PASTILHA DE FREIO / P1433', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(756, '7897483442433    ', 770473, 'PASTILHA DE FREIO / P58', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(757, '', 770467, 'PASTILHA DE FREIO / RCPT02840', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(758, '7897483492384    ', 770418, 'PASTILHA DE FREIO / RCPT04780 - PEUGEOT 206', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(759, '7897483405469    ', 769717, 'PASTILHA DE FREIO / RCPT13550', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(760, '7897483406282    ', 770485, 'PASTILHA DE FREIO / RCPT13830', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(761, '7897483406329    ', 770025, 'PASTILHA DE FREIO / RCPT13870', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(762, '4047024786981    ', 770026, 'PASTILHA DE FREIO / RCPT13910', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(763, '7893026215984    ', 770447, 'PASTILHA DE FREIO BB-42', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(764, '7892679071992    ', 771545, 'PASTILHA DE FREIO CELTA / PD/46 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(765, '7892679063485    ', 770437, 'PASTILHA DE FREIO CIVIC TR / N-1372/73/74 COBREC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(766, '7897483406305    ', 770064, 'PASTILHA DE FREIO corolla ts / N-1368', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(767, '7890903024905    ', 771289, 'PASTILHA DE FREIO DA DUSTER 2.0 - RCPT13890', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(768, '7897483448190    ', 770458, 'PASTILHA DE FREIO DA TUCSON / NKF1224P', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(769, '7893026916867    ', 770449, 'PASTILHA DE FREIO DO CORSAO - RCPT02930', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(770, '7897483492155    ', 770436, 'PASTILHA DE FREIO DT ACCORD 2.0 94 / PD/457 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(771, '', 771366, 'PASTILHA DE FREIO DT AMAROK 2.0 / RCPT13390 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(772, '7893026830903    ', 770447, 'PASTILHA DE FREIO DT BB-42 CELTA/CLASSIC / BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(773, '7897483461809    ', 770472, 'PASTILHA DE FREIO DT BORA C/SENSOR /P58-B LONAFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(774, '7897483489254    ', 770417, 'PASTILHA DE FREIO DT C3 1.4 / RCPT09480 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(775, '7892679069388    ', 770435, 'PASTILHA DE FREIO DT CITY 1.5 EX / RCPT12140 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(776, '7895467185840    ', 770432, 'PASTILHA DE FREIO DT CIVIC 1.8 12 / N-1457 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(777, '7892861519288    ', 770433, 'PASTILHA DE FREIO DT CIVIC 2017 / PW266 WILLTEC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(778, '7892861519257    ', 770480, 'PASTILHA DE FREIO DT COROLLA /NKF1184P NAKATA', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(779, '7890903025100    ', 770475, 'PASTILHA DE FREIO DT COROLLA 1.8 / NKF1186P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(780, '7892679063478    ', 0, 'PASTILHA DE FREIO DT COROLLA 1.8 / NKF1244P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(781, '05296.81', 770481, 'PASTILHA DE FREIO DT COROLLA 2008 / N-1366 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(782, '7892679060392    ', 770476, 'PASTILHA DE FREIO DT COROLLA1.8 XLI /RCPT01500 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(783, '7897483424057    ', 771164, 'PASTILHA DE FREIO DT CORSA/CELTA / N-324 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(784, '7897483403021    ', 771165, 'PASTILHA DE FREIO DT CORSA/CELTA /RCPT01320 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(785, '7893026682274    ', 770079, 'PASTILHA DE FREIO DT CRUZE LT 1.8 /RCPT13770 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(786, '7897483489780    ', 770427, 'PASTILHA DE FREIO DT ECLIPSE 2.0 / P-383 LONAFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(787, '7890903032658    ', 770451, 'PASTILHA DE FREIO DT ECOESPORT 1.6 / RCPT12670 TRW', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(788, '7890903079462    ', 770450, 'PASTILHA DE FREIO DT FIESTA 09-15 /NKF1266P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(789, '7890903080000    ', 770452, 'PASTILHA DE FREIO DT FIESTA 1.0 / NKF1051P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(790, '7890903025162    ', 770468, 'PASTILHA DE FREIO DT FOX 1.0/1.6 / NKF1150P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(791, '7890903025223    ', 770673, 'PASTILHA DE FREIO DT FRONTIER / NKF1250P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(792, '7895467079453    ', 770469, 'PASTILHA DE FREIO DT GOL G5 / NKF1256P NAKATA', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(793, '7897483448695    ', 770478, 'PASTILHA DE FREIO DT HILUX 2008 / PW758 WILLTECH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(794, '7893026957723    ', 770416, 'PASTILHA DE FREIO DT HOGGAR 1.6 / RCPT04700 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(795, '7897483488899    ', 0, 'PASTILHA DE FREIO DT HONDA CITY / PD/1492 FRASLE', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(796, '7897483489285    ', 770491, 'PASTILHA DE FREIO DT HR 2.5 / RCPT11770 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(797, '7892679063867    ', 770492, 'PASTILHA DE FREIO DT I30 2.0 16V / RCPT12170 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(798, '7891579337023    ', 136, 'PASTILHA DE FREIO DT IX35 2.0 16V / N-1256 COBREQ', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(799, '7893026383348    ', 770425, 'PASTILHA DE FREIO DT L200 2.5 02 / PFC390005 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(800, '7897483406268    ', 0, 'PASTILHA DE FREIO DT L200 HPE/SPORT /PD/500 FRESLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(801, '7892861518953    ', 770090, 'PASTILHA DE FREIO DT MARCH 1.0 16V /RCPT13850 TRW', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(802, '7897483448442    ', 770444, 'PASTILHA DE FREIO DT MERIVA 1.8 / NKF1151P NAKATA', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(803, '7897483448039    ', 770443, 'PASTILHA DE FREIO DT MERIVA1.8 8V / RCPT04400P TRW', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(804, '7897483400068    ', 770434, 'PASTILHA DE FREIO DT NEW CIVIC 1.8 / RCPT02790 TRW', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(805, '7895467186113    ', 770453, 'PASTILHA DE FREIO DT NEW FOCUS / RCPT13710 TRW', 1, '89.00', '5.00', 251, 0, './imgs/0001.jpg', '2021-03-18 22:45:38', 7, 8),
(806, '7890903079493    ', 770442, 'PASTILHA DE FREIO DT NEW SPIN 17 / PW972 WILLTEC', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(807, '7892861520376    ', 770454, 'PASTILHA DE FREIO DT NKF1057P FIESTA / NAKATA', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(808, '7892679062990    ', 770422, 'PASTILHA DE FREIO DT NKF1202P C3 1.4 / NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(809, '7895467090908    ', 770424, 'PASTILHA DE FREIO DT PEUGEOT 307 / N-1166 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(810, '7892861520307    ', 770423, 'PASTILHA DE FREIO DT PEUGEOT 307/ PW918 WILLTEC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(811, '7890903025131    ', 771095, 'PASTILHA DE FREIO DT PEUGEOUT 307 / KF1195P NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(812, '', 770439, 'PASTILHA DE FREIO DT PUNTO T-SET / NKF1247P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(813, '7897483442303    ', 770455, 'PASTILHA DE FREIO DT RAGER PD/1434 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(814, '7890903025216    ', 770438, 'PASTILHA DE FREIO DT RCPT02650 BRAVO 2.0 98 / TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(815, '7891579336798    ', 770470, 'PASTILHA DE FREIO DT SAVEIO 1.8 / NKF1255P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(816, '7897483458212    ', 770461, 'PASTILHA DE FREIO DT SENTRA 2008 / PFC290002 COFAP', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(817, '7897483448763    ', 770460, 'PASTILHA DE FREIO DT STILO 1.8 / RCPT07680 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(818, '7893026838848    ', 770486, 'PASTILHA DE FREIO DT VITARA 1.8 / RCPT04770 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(819, '7897483400785    ', 770003, 'PASTILHA DE FREIO ETIOS 1.3 DT / PD/1438 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(820, '7893026830910    ', 104, 'PASTILHA DE FREIO FIESTA 1.5 DT / RCPT13730 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(821, '7897483491905    ', 770457, 'PASTILHA DE FREIO FIESTA P-79 SOHC 06 / LONAFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(822, '7892679064048    ', 0, 'PASTILHA DE FREIO FOCUS 2008 / RCPT13200 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(823, '7892679072609    ', 771104, 'PASTILHA DE FREIO GOL 1.0 G7 / N-286 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(824, '7895467081777    ', 771230, 'PASTILHA DE FREIO JEEP RENEGADE / N-1774 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(825, '7892861518946    ', 770459, 'PASTILHA DE FREIO KIA CERATO / PW677 WILLTEC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(826, '7895467164913    ', 770468, 'PASTILHA DE FREIO NKF1150P', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(827, '7892679161167    ', 0, 'PASTILHA DE FREIO NOVO COROLLA 1.5', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(828, '7893026125832    ', 771674, 'PASTILHA DE FREIO ONIX NOVO / N-2092 COBREQ', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(829, '7893026888591    ', 769716, 'PASTILHA DE FREIO PALIO ANTIGO / PD/60 FEASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(830, '7897483492933    ', 771341, 'PASTILHA DE FREIO PALIO DT / P-60 LONAFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(831, '', 769717, 'PASTILHA DE FREIO RCPT12550', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(832, '7893026923889    ', 771691, 'PASTILHA DE FREIO S10 12 / PD/1433 FRASLE', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(833, '7897483489629    ', 770489, 'PASTILHA DE FREIO SANTA FE 2.4 TR / PD/1366 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(834, '7893026381719    ', 770490, 'PASTILHA DE FREIO SANTA FE 2.7 DT / RCPT12510 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(835, '7897483458250    ', 770474, 'PASTILHA DE FREIO TR AUDI A3 / P-362 LONAFLEX', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(836, '7897483403830    ', 770429, 'PASTILHA DE FREIO TR BRAVO 1.8 / RCPT07700 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(837, '02957.51', 770445, 'PASTILHA DE FREIO TR CRUZE LT 1.8 / RCPT13790 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(838, '7890903045689    ', 771090, 'PASTILHA DE FREIO TR FIT 1.4 / PD/398 FASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(839, '7893026763829    ', 770488, 'PASTILHA DE FREIO TR IX35 C/ABS / NKF1343P NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(840, '7897483448619    ', 770477, 'PASTILHA DE FREIO TR P-512 COROLLA 1.8 / LONAFLEX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(841, '7890903043685    ', 770428, 'PASTILHA DE FREIO TR RCPT04620 STILO 1.8 16V / TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(842, '7897483489452    ', 771093, 'PASTILHA DE FREIO TS BORA / NKF1283 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(843, '7891579334787    ', 770825, 'PASTILHA DE FREIO TS I30 2.0 / RCPT12340 TRW', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(844, '7893026263572    ', 771092, 'PASTILHA DE FREIO TS LINEA / PFC030046 COFAP', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(845, '7893026549119    ', 771336, 'PASTILHA DE FREIO XSARA TS / PD/465 FRASLE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(846, '7893026430967    ', 771377, 'PASTILHA DIANT GOLF 1.8/2.0 95/ GOL GV - P-367', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(847, '7893026764024    ', 771403, 'PASTILHA DIANT HILUX SW4 05/ SRV 09/ - PD/528', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(848, '7892679069371    ', 797230, 'PASTILHA DIANT NEW FIT/CITY 09/ - P-685', 0, '55.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(849, '7892679063706    ', 771103, 'PASTILHA DIANT UNO 10/MOBI/ARGO 1.0 17/ - N-1770', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(850, '7893026589429    ', 770493, 'PASTILHA FREIO CERATO 2.0 DT / N-1247 COBREQ', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(851, '7893026872767    ', 771365, 'PASTILHA FREIO PAJERO FULL TS / PD/695 FRASLE', 0, '555.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(852, '7892679064512    ', 771325, 'PASTILHA FREIO S-10 DT / N-390 COBREQ', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(853, '7895467186496    ', 771405, 'PASTILHA HB20 1.6 DT / N-1272 COBREQ', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(854, '4047025603140    ', 770462, 'PASTILHAS DE FREIO / PW973', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(855, '7895467002109    ', 770448, 'PASTINHA FREIO DT BB-107 S10 1995 / BOSH', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(856, '7890903027395    ', 771125, 'PATILHA DE FREIO VW GOL / BORA / PW58B WILLTEC', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(857, '7899013313282    ', 0, 'PIVO AGILE / N93019 NAKATA', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(858, '7899152537235    ', 770120, 'PIVO C3 02 INFERIOR / 503159 VIEMAR', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(859, '7899152537075    ', 771622, 'PIVO C4 PALLAS INFERIOR / PVI0121 PERFECT', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(860, '7899013300657    ', 770952, 'PIVO CIVIC INF LD / PVI2002 PERFECT', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(861, '7897499925340    ', 771006, 'PIVO CLIO / 503070 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(862, '7899152523795    ', 771525, 'PIVO CLIO SYMBOL / N9189 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(863, '7892504041237    ', 770956, 'PIVO COROLLA 09 INFERIOR / PVI9171 PERFECT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(864, '7899152534401    ', 770958, 'PIVO COROLLA INF / PS1017 TRW', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(865, '7897499921304    ', 770957, 'PIVO COROLLA INF / PVI1045 PERFECT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(866, '7899013315637    ', 770970, 'PIVO CORSA / N3045 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(867, '7899013313312    ', 771457, 'PIVO CORSA CLASSIC G / 503351 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(868, '7890903054162    ', 770965, 'PIVO DO PUNTO E LINEA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(869, '7899013321478    ', 769684, 'PIVO DUSTER / N99202 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(870, '7899152533121    ', 771687, 'PIVO ETIOS D-E / 503274 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(871, '7890903006291    ', 770960, 'PIVO FIESTA 03 / PVI1021 PERFECT', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(872, '', 770961, 'PIVO FIESTA ROCAM / N2136 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(873, '7899013315330    ', 770966, 'PIVO FIORINO / N6009 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(874, '7897483407647    ', 770948, 'PIVO FIT / 503338 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(875, '7899013323830    ', 770949, 'PIVO FIT INFERIOR / PS.4443 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(876, '7899152513154    ', 771004, 'PIVO FLUENCE / 503388 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(877, '7899013324011    ', 771546, 'PIVO FLUENCE 11 / PVI0606 PERFECT', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(878, '7899013324028    ', 770076, 'PIVO FOCUS 2014 L-D / 503406 VIEMAR', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(879, '7899013324028    ', 771476, 'PIVO FOCUS 2014 L-E / 503405 VIEMAR', 0, '55.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(880, '7897499925371    ', 771476, 'PIVO FOCUS 2014 L-E / 503405 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(881, '7897499925364    ', 771000, 'PIVO FOX LD / N1065 NAKATA', 0, '555.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(882, '7890903044323    ', 770999, 'PIVO FOX LE / N1064 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(883, '7899013315217    ', 771162, 'PIVO FRONTIER 08 SUPERIOR E-D / N99175 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(884, '7897499917574    ', 771621, 'PIVO FRONTIER INFERIOR / 503335 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(885, '7897499917574    ', 771003, 'PIVO GOL / N1020 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(886, '7897499951080    ', 771003, 'PIVO GOL / N1020 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(887, '7897499951097    ', 770921, 'PIVO GOL G6 INF LD / N1074 NAKATA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(888, '7897499923704    ', 770920, 'PIVO GOL G6 INF LD / N1075 NAKATA', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(889, '7897499923704    ', 771002, 'PIVO GOLF LD / N1059 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(890, '7897499923711    ', 771002, 'PIVO GOLF LD / N1059 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(891, '7899013320945    ', 771001, 'PIVO GOLF LE / N1058 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(892, '7890903031392    ', 771361, 'PIVO HB20 /503264 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(893, '7899013309131    ', 770954, 'PIVO HILUX INFERIOR / N99129 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(894, '7890903031385    ', 771620, 'PIVO HILUX PICK-UP INFERIOR / 503169 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(895, '7897499943306    ', 770953, 'PIVO HILUX SUPERIOR / N99128 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(896, '', 770964, 'PIVO INFERIOR IDEA / N6075 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(897, '3322937337637    ', 771608, 'PIVO L200 INF L-E / PVI9161 PERFECT', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(898, '7890903060620    ', 770967, 'PIVO MONTANA 05 / JBJ705 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(899, '7890903061696    ', 770950, 'PIVO NEW CIVIC / N99247 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(900, '7890903049588    ', 770959, 'PIVO NEW FIESTA / N99272 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(901, '7899013320891    ', 769660, 'PIVO NOVA MONTANA INFERIOR / N93042 NAKATA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 0),
(902, '7899013320891    ', 770583, 'PIVO ONIX / 503255 VIEMAR', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(903, '7897499923728    ', 770583, 'PIVO ONIX / 503255 VIEMAR', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(904, '7899013301913    ', 770584, 'PIVO PALIO / N6058 NAKATA', 0, '55.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(905, '7899013321775    ', 771471, 'PIVO PALIO FIRE D-E / 503009 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(906, '', 771137, 'PIVO S-10 NOVA SUPERIOR / 503271 VIEMAR', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(907, '7897499919158    ', 771137, 'PIVO S-10 NOVA SUPERIOR / 503271 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(908, '7897483407760    ', 770969, 'PIVO S10 / N3023 NAKATA', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(909, '7899013310731    ', 771005, 'PIVO SANDERO / PS4446 TRW', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(910, '7890903030302    ', 770117, 'PIVO SONATA INFERIOR / 503090 VIEMAR', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(911, '7890903030296    ', 770963, 'PIVO STRADA ADVENTURE L-D / N96027 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(912, '', 770962, 'PIVO STRADA ADVENTURE L-E / N96026 NAKATA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(913, '7899013313183    ', 771021, 'PIVO TUCSON INF / 503196 VIEMAR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(914, '7899013301685    ', 771021, 'PIVO TUCSON INF / 503196 VIEMAR', 0, '55.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(915, '', 771513, 'PIVO UNO ANTIGO INFERIOR / 503110 VIEMAR', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(916, '7316572848296    ', 771511, 'PIVO UNO ANTIGO INFERIOR / VKDS4775 SKF', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(917, '7898384070466    ', 771511, 'PIVO UNO ANTIGO INFERIOR / VKDS4775 SKF', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(918, '7898384070985    ', 770716, 'POLIA ALT 1114 GOL1.0 / NYTRON', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(919, '7898384070480    ', 770720, 'POLIA ALT 1143 PALIO FIRE / NYTRON', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(920, '7898384072156    ', 770715, 'POLIA ALT 1152 GOL1.0 C/DIR.HD / NYTRON', 0, '5.00', '5.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 8),
(921, '7898384071920    ', 770719, 'POLIA ALT 1250 PEUGEOT2006 16V 1.4 / NYTRON', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(922, '45764    ', 0, 'POLIA DO ALTERNADOR NYTRON CHEVROLET MERIVA, MONTANA E CORSA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(923, '7898233431134    ', 770993, 'PONTA EIXO CELTA TS / 45764 REVIAM', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(924, '7892861979013    ', 770992, 'PONTA EIXO GOL TS S-ABS / AL-801 IMA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(925, '', 771447, 'PONTA HOMOCINETICA DOBLO 1.8/ ALB2461-1449 ALBARUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(926, '7899554025378    ', 0, 'PORCA DE RODA ONIX', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(927, '7896728409378    ', 771451, 'PRATO AMORTECEDOR DT GOL / 108.0016 KITSBOR', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(928, '896728410114    ', 769747, 'PROTETOR CARTER PALIO FIRE / GP15001 IGASA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(929, '7896728420090    ', 0, 'PROTETOR DE CARTE / ETIOS / 2012 A 2016', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(930, '7899545009110    ', 0, 'PROTETOR DE CARTE / ETIOS / 2017', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(931, '', 0, 'PROTETOR DE CARTE / HB20/ 2012 A 2019', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(932, '7890079125406    ', 0, 'PROTETOR DE CARTER COLBALT / PRISMA - IGASA', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(933, '7899430207447    ', 0, 'RADIADOR AL EXPANDIDO 2T ENC', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(934, '7898584371127    ', 771548, 'RADIADOR CELTA 1.0 06 / PC105015 PROCOOLER', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(935, '7890079122092    ', 771521, 'RADIADOR HB20 1.0 / NT-20070.116 NOTUS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(936, '7316574646432    ', 769661, 'RADIADOR UNO FIRE MILLE / 12209 VISCONDE', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(937, '', 771424, 'RALAMENTO CORSA TS / VKBA4544A / SKF', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(938, '', 769655, 'REPARO ROL EIXO TR S/B.ESTAB PEUGEOT206 / REVIAM', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(939, '7898326903722    ', 0, 'RERSERVATORIO DAGUA FIESTA', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(940, '7898326903722    ', 769946, 'RESERV AGUA RAD', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(941, '7898326909441    ', 769946, 'RESERVATORIO AGUA GOL G5 / G-1028 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(942, '7898326904347    ', 58, 'RESERVATORIO AGUA IDEIA 1.8 / G-1306 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(943, '7898326904347    ', 111, 'RESERVATORIO AGUA NOVO UNO / G-1322 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(944, '7898326904361    ', 111, 'RESERVATORIO AGUA NOVO UNO / G-1322 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(945, '7898326904361    ', 770917, 'RESERVATORIO AGUA ONIX / G-1254 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(946, '7898326909021    ', 770917, 'RESERVATORIO AGUA ONIX / G-1354 GONEL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(947, '7898326904316    ', 0, 'RESERVATORIO DAGUA / PALIO IDEIA / G-1307', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(948, '7898326904323    ', 771638, 'RESERVATORIO DE AGUA CELTA PRISMA07 / G-1252 GONEL', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(949, '7898326903982    ', 769757, 'RESERVATORIO DE AGUA CELTA PRISMA09 / G-1253 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(950, '', 771639, 'RESERVATORIO DE AGUA CORSA CLASSI09 / G-1251 GONEL', 0, '55.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(951, '7898326909021    ', 0, 'RESERVATORIO DE AGUA DO FIESTA', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(952, '7898326909397    ', 771636, 'RESERVATORIO DE AGUA IDEIA / G-1307 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(953, '7898326903012    ', 770210, 'RESERVATORIO DE AGUA KA 97 / G-1107 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(954, '7898326909090    ', 771637, 'RESERVATORIO DE AGUA MONTANA 03 / G-1235 GONEL', 0, '5.00', '6.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(955, '7898134046215    ', 771635, 'RESERVATORIO DE AGUA UNO MILLE / G-1301 GONEL', 0, '5.00', '55.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(956, '7898326904743    ', 771571, 'RESERVATORIO DE EXPANS?O / CITROEEN C3 AIRCROSS', 0, '5.00', '5.00', 11, NULL, '', '2021-03-18 22:45:38', 0, 8),
(957, '', 771464, 'RESERVATORIO GRAND SIENA 1.6 / G-1324 GONEL', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(958, '7897483491042    ', 0, 'RETENTOR DA VOLANTE DA NOVA FIORINO / 05772', 0, '0.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(959, '', 770882, 'ROLAMENTO C3 CLIO TS / LVB445539 LUCAS', 0, '5.00', '5.00', 1, NULL, '', '2021-03-18 22:45:38', 0, 8),
(960, '7898684752802    ', 770791, 'ROLAMENTO CAMBIO SANDERO / 7120389100 INA', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(961, '7316577693969    ', 771682, 'ROLAMENTO CARDAN HILLUX / 6047 BCR', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(962, '7316577258083    ', 770890, 'ROLAMENTO CLIO TS C3 / VKBC20212 SKF', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(963, '7897483491110    ', 769708, 'ROLAMENTO DT BAH0206/VC560 GOL/FIESTA / SKF', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(964, '209430    ', 770847, 'ROLAMENTO DT LVB445620 S/ABS CLIO / LUCAS', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(965, '7316579123143    ', 770994, 'ROLAMENTO EIXO PALIO 97 TS / 0302209430 REVIAM', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(966, '7316574646418    ', 771434, 'ROLAMENTO FIESTA ROCAM TS / VKBC6001 SKF', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(967, '', 160, 'ROLAMENTO GOL TR / VKBA4529A SKF', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(968, '', 770938, 'ROLAMENTO PEUGEOT', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(969, '7898384071296    ', 771339, 'ROLAMENTO STRADA 1.8 DT / LVB0094 LUCAS', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(970, '7899270848244    ', 771169, 'ROLAMENTO TENSOR CLIO 1.0 16V', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(971, '7316576689840    ', 770851, 'ROLAMENTO TR IR18599 MARCH 2011 / IRB', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(972, '', 770839, 'ROLAMENTO UNO PALIO 12 C-ABS DT / VKBC3577 SKF', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(973, '', 0, 'SANDA LAMBIDA', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(974, '', 769976, 'SAPATA DT D C BUCHA S PIVO', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(975, '7899751926430    ', 769975, 'SAPATA DT E C BUCHA S PIVO', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(976, '', 770557, 'SENSOR ABS GRAND SIENA RD TS / GS 2959 GAUSS', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(977, '7898436087749    ', 779828, 'SENSOR DE ABS - GOL LD ESQUERDO', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(978, '', 0, 'SENSOR DE TEMPERATURA FIAT IDEA PALIO UNO SIENA FIORINO', 0, '55.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(979, '', 771086, 'SENSOR NIVEL COMB FLEX', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(980, '4041248706251    ', 771368, 'SILENC TRAS CORSA SEDAN/WAGON 1.0/1.6 97 - GM2602', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(981, '4041248845653    ', 771239, 'SILICONE ELRING', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(982, '7891200341368    ', 771239, 'SILICONE PRETO 70ML / 700.620 ELRING', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(983, '', 42, 'SILICONE UTRA - LOCTITE', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(984, '', 771421, 'TAMBOR DE FREIO AMAROK / HF 90A HIPERFREIOS', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(985, '7897483494043    ', 0, 'TAMBOR DE FREIO CORSA / AGILE / HF24', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(986, '7898318870261    ', 770839, 'TAMBOR DE FREIO HILLUX / RPTA02190 TRW', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(987, '', 769724, 'TAMBOR DE FREIO PALIO 96 / HF36 HIPPER FREIOS', 0, '0.00', '6.00', 11, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(988, '7898500313149    ', 0, 'TAMBOR DE FREIO TS HB20', 0, '55.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(989, '7898568763375    ', 769874, 'TAMBOR FREIO UNO 1.4 C/ABS / HF37A HIPPER FREIOS', 0, '0.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(990, '', 769998, 'TAMPA BOMBA COMB PALIO FIRE / 2401 DS', 0, '55.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(991, '24582667    ', 770744, 'TAMPA DE RESERVATORIO DE AGUA DO UNO - 5050103', 0, '85.00', '5.00', 21, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(992, '7893272000624    ', 769692, 'TAMPA DE VALVULA DO CORSA / 24582667 GM', 0, '5.00', '5.00', 1, NULL, 'imgs/sem.jpg', '2021-03-18 22:45:38', 0, 8),
(993, '893272000624    ', 87, 'TAMPA OLEO GOL / TC3050 CLICK', 1, '44.00', '5.00', 1, 0, './imgs/cvy.png', '2021-03-18 22:45:38', 7, 8),
(994, '7898994231912    ', 89, 'TAMPA OLEO MOTOR GOL / TC-3050 CLICK', 1, '55.00', '5.00', 1, 0, './imgs/capa1-1.jpg', '2021-03-18 22:45:38', 7, 8),
(995, '789456123', 771225, 'TAMPA OLEO MOTOR PALIO FIRE / 5050134 MTA', 1, '11.00', '12.00', 1, 0, './imgs/88-2.jpg', '2021-03-18 22:45:38', 7, 8),
(996, '7898134047786    ', 771225, 'TAMPA OLEO MOTOR PALIO FIRE / 5050134 MTA', 1, '78.12', '5.00', 1, 0, './imgs/849a69aaf1ecaeeadd64760b50e06416.jpg', '2021-03-18 22:45:38', 7, 8),
(997, '781542789653', 771206, 'TAMPA OLEO MOTOR UNO 1.4 10 / 23-734 FLORIO', 1, '78.45', '5.00', 1, 0, './imgs/88-1.jpg', '2021-03-18 22:45:38', 7, 8),
(998, '7894512896', 770744, 'TAMPA RES AGUA PALIO / 5050103 MTA', 1, '55.00', '5.00', 31, 0, './imgs/10359-1.png', '2021-03-18 22:45:38', 7, 8),
(999, '893272001140    ', 123, 'TAMPA RES AGUA VECTRA / 5050140 MTA', 1, '55.00', '5.00', 1, 0, './imgs/05.png', '2021-03-18 22:45:38', 7, 8),
(1000, '7893272004141    ', 771462, 'TAMPA RESERVATORIA AGUA FOX GOL / TC-3062 CLICK', 1, '5.00', '5.00', 21, 0, './imgs/dfmm.jpg', '2021-03-18 22:45:38', 7, 8),
(1001, '7909090000019    ', 769643, 'TAMPA RESERVATORIO AGUA FIESTA / TC-6551 CLICK', 1, '25.69', '6.00', 16, 0, './imgs/fiat-logo-2.jpg', '2021-03-18 22:45:38', 7, 8),
(1002, '7893272001157    ', 770744, 'TAMPA RESERVATORIO AGUA PALIO / 5050103 MTA', 1, '88.45', '5.00', 51, 0, './imgs/04-1.jpg', '2021-03-18 22:45:38', 7, 8),
(1003, '7893272006541    ', 770743, 'TAMPA RESERVATORIO AGUA PALIO / TC-4051 CLICK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1004, '7909090000149    ', 770747, 'TAMPA RESERVATORIO AGUA PARA-BRISA / TC5301 CLICK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1005, '', 770742, 'TAMPA RESERVATORIO AGUA VECTRA / 5050140 MTA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1006, '893272001140    ', 770742, 'TAMPA RESERVAT?RIO VECTRA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1007, '', 0, 'TAMPA TC-362', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1008, '', 108, 'TAMPA VALV TERMOSTATO - CAVALO D`AGUA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1009, '7898384072750    ', 0, 'TENSOR CORREIA ALT 7814 CORSA / NYTRON', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1010, '7894758183756    ', 770223, 'TENSOR CORREIA DENT 7726 PEUGEOT206 1.4 / NYTRON', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1011, '7898605582464    ', 770713, 'TENSOR CORREIA DENT T43225 SANDERO1.6 / GATES', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1012, '7898594642521    ', 770091, 'TENSOR CORREIA DENT V55315 CELTA / CONTINENTAL', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1013, '7897056503349    ', 156, 'TENSOR CORREIA DENT V56018 FIAT / CONTINENTAL', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1014, '7898384070251    ', 771331, 'TENSOR CORREIA DENTADA CORSA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1015, '7898384071173    ', 171, 'TENSOR DA CORREIA DENTADA CORSA / 7796 NYTRON', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1016, '7898384071050    ', 0, 'TENSOR DE CORREIA DENTADA DO GOL / 7736', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1017, '311529    ', 770071, 'TENSOR DO ALTERNADOR PALIO, SIENA, STRADA / NY7822', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1018, '7899013314562    ', 770907, 'TERMINAL CABO CX MAR 311529 CORSA/CELTA / REVIAM', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1019, '7899152533008    ', 770626, 'TERMINAL COROLLA 2015 / 335347 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1020, '7897499941678    ', 770640, 'TERMINAL DE DIRE??O / TDI1034', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1021, '', 769906, 'TERMINAL DE DIRE??O / N3072', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1022, '7897499917789    ', 770639, 'TERMINAL DE DIRE??O / TDI1035', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1023, '', 770664, 'TERMINAL DE DIRE??O DA FIAT - N-6017', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1024, '7899013300541    ', 770675, 'TERMINAL DE DIRE??O DO ONIX', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1025, '7897499917772    ', 770641, 'TERMINAL DE DIRE??O FIESTA ROCAM', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1026, '7890903027685    ', 769963, 'TERMINAL DE DIRE??O N-6016', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1027, '7890903027692    ', 0, 'TERMINAL DE DIRE??O NAKATA N96017', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1028, '', 0, 'TERMINAL DE DIRE??O NAKATA N96018', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1029, '', 770666, 'TERMINAL DIR 335012 FIAT / VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1030, '7890903054087    ', 769673, 'TERMINAL DIR D 335002 VOLKSWAGEN / VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1031, '7890903027586    ', 770623, 'TERMINAL DIR D N-99200 RENAULT / NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1032, '7897483407968    ', 770217, 'TERMINAL DIR D N99085 RENAULT / NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1033, '7899013318546    ', 770695, 'TERMINAL DIR D TS4474 CITROEN / TRW', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1034, '7897483407999    ', 770663, 'TERMINAL DIR E 335434 FIAT / VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1035, '7892504023332    ', 770696, 'TERMINAL DIR E TS4475 CITROEN / TRW', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1036, '7892504012756    ', 771147, 'TERMINAL DIR GOL/PARATI/SAVEIRO GIII 95/ - TS.3900', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1037, '', 771148, 'TERMINAL DIR GOL/VOYALE/PARATI/SAVEIRO - TS.3756:0', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1038, '7899013318836    ', 771008, 'TERMINAL DIRE D DH NN 06570.58', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1039, '7899013300282    ', 771602, 'TERMINAL DIRECAO ACCORD L-E / 335435 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1040, '7899013324110    ', 770694, 'TERMINAL DIRECAO CITROEN C4 / 335076 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1041, '7899013301173    ', 771599, 'TERMINAL DIRECAO CIVIC G9 L-D / 335500 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1042, '7899013300336    ', 771600, 'TERMINAL DIRECAO CIVIC G9 L-E / 335499 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1043, '7899013300343    ', 770216, 'TERMINAL DIRECAO CLIO L-D / 335091 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1044, '7899152534418    ', 770215, 'TERMINAL DIRECAO CLIO L-E / 335090 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1045, '7899152534425    ', 770624, 'TERMINAL DIRECAO COROLLA 08 L-D / TDI1076 PERFECT', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1046, '7899013300176    ', 770625, 'TERMINAL DIRECAO COROLLA 08 L-E / TDI1077 PERFECT', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1047, '7899013300435    ', 771522, 'TERMINAL DIRECAO CORSA CELTA / 335074 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1048, '7890903046518    ', 770676, 'TERMINAL DIRECAO CORSAO MERIVA / 335064 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1049, '7890903054070    ', 770669, 'TERMINAL DIRECAO DOBLO / N-96034 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1050, '7899013321294    ', 770622, 'TERMINAL DIRECAO DUSTER L-E / N-99201 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1051, '7899013321799    ', 771606, 'TERMINAL DIRECAO ETIOS L-D / 335509 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1052, '7899152534494    ', 771607, 'TERMINAL DIRECAO ETIOS L-D / 335510', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1053, '7890903004051    ', 770638, 'TERMINAL DIRECAO ETIOS L-E / 335510', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1054, '7899152533008    ', 771500, 'TERMINAL DIRECAO FIESTA 02-11 / N92016 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1055, '7899013300534    ', 770640, 'TERMINAL DIRECAO FIESTA 99 L-E / TDI1034 PERFECT', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1056, '7899013313015    ', 770642, 'TERMINAL DIRECAO FIESTA ROCAM / 335019 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1057, '7899013313008    ', 770616, 'TERMINAL DIRECAO FIT 03 L-D / 335233 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1058, '7899013321126    ', 770615, 'TERMINAL DIRECAO FIT 03 L-E / 335232 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1059, '7899013321133    ', 770644, 'TERMINAL DIRECAO FOCUS 09 L-D / 335486 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1060, '7899013324738    ', 770645, 'TERMINAL DIRECAO FOCUS 09 L-E / 335487 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1061, '7899013324745    ', 770041, 'TERMINAL DIRECAO FOCUS 14 L-D / 335670 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1062, '7899013314982    ', 770040, 'TERMINAL DIRECAO FOCUS 14 L-E / 335669 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1063, '7899013314975    ', 770630, 'TERMINAL DIRECAO FRONTIER 08 L-E / 335311 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1064, '7897499915204    ', 770629, 'TERMINAL DIRECAO FRONTIER L-D /335312 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1065, '7890903026756    ', 770650, 'TERMINAL DIRECAO GOL G4 L-E / N-1027 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1066, '7890903026749    ', 771483, 'TERMINAL DIRECAO GOL L-D / N97001 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1067, '7890903050775    ', 771484, 'TERMINAL DIRECAO GOL L-E / N97000 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1068, '7890903050768    ', 770633, 'TERMINAL DIRECAO HB20 L-D / N99162 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1069, '7899013310113    ', 770632, 'TERMINAL DIRECAO HB20 L-E / N99161 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1070, '7899013325452    ', 770902, 'TERMINAL DIRECAO HILUX / 335198 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1071, '7899013325445    ', 771055, 'TERMINAL DIRE??O L-D HONDA CITY 20 / 335679 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1072, '7890903027715    ', 771056, 'TERMINAL DIRE??O L-D HONDA CITY 20 / 335680 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1073, '7899013318553    ', 770617, 'TERMINAL DIRECAO L-D N-99096 NEW CIVIC / NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1074, '7899013323144    ', 770662, 'TERMINAL DIRECAO L-D NOVO UNO VIVACE 335433 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1075, '7899013323151    ', 770628, 'TERMINAL DIRECAO MARCH L-D / 335506 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1076, '7890903032085    ', 770627, 'TERMINAL DIRECAO MARCH L-E / 335505 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1077, '7899013321577    ', 770636, 'TERMINAL DIRECAO NEW FIESTA L-D / N-92024 NAKA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1078, '7890903032092    ', 771593, 'TERMINAL DIRECAO NEW FIESTA L-E / 335417 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1079, '7899013319444    ', 770637, 'TERMINAL DIRECAO NEW FIESTA L-E / N-92023 NAKA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1080, '7890903046495    ', 770675, 'TERMINAL DIRECAO ONIX / 335420 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1081, '7890903052687    ', 770059, 'TERMINAL DIRECAO ONIX / N-93024 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1082, '7899013300299    ', 770667, 'TERMINAL DIRECAO PALIO J-TEKT L-D /N96038 1NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1083, '', 770697, 'TERMINAL DIRECAO PEUGEOUT 206 L-D / 335111 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1084, '7890903027685    ', 0, 'TERMINAL DIRECAO PEUGEOUT 206 L-E / 335112 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1085, '780903027692    ', 770664, 'TERMINAL DIRECAO PUNTO LINEAR / N-96017 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1086, '7890903049915    ', 770665, 'TERMINAL DIRECAO PUNTO LINEAR L-D N-9018 / NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1087, '7890903027579    ', 770677, 'TERMINAL DIRECAO S10 / N-93046 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1088, '7890903092799    ', 770218, 'TERMINAL DIRECAO SANDERO L-E / N-99084 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1089, '7890903092805    ', 770679, 'TERMINAL DIRECAO SPIN L-D / N-93078 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1090, '7899152537198    ', 770680, 'TERMINAL DIRECAO SPIN L-E / N-93079 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1091, '7899013309346    ', 770634, 'TERMINAL DIRECAO TUCSON L-E / TDI1097 PERFECT', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1092, '7897499915402    ', 769934, 'TERMINAL DIRECAO UNO ANTIGO / 335018 VIEMAR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1093, '7892504012725    ', 770670, 'TERMINAL DIRECAO UNO ANTIGO / N-6014 NAKATA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1094, '7899013322130    ', 770668, 'TERMINAL DIRECAO UNO ANTIGO / TS3749 TRW', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1095, '7891579308498    ', 771149, 'TERMINAL PEUGEOT 208 C3 L-E / VIEMAR 335462', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1096, '7891579308504    ', 66, 'TIRANTE LD STC04126M CORSA / COFAP', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1097, '7899013322161    ', 67, 'TIRANTE LE STC04127M CORSA / COFAP', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1098, '', 770692, 'TREMINAL DE DIRE??O PEUGEOUT 206 / 335463', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1099, '7893989078893    ', 109, 'TUBO D? AGUA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1100, '', 771150, 'VALVULA TEMOSTATICA NOVO UNO /VT422.88', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1101, '7891579237422    ', 771350, 'VALVULA TEMOSTATICA PEGEOUT 207 / VT-486', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1102, '7892679063706    ', 769689, 'VALVULA TERMO PALIO FIRE / MMVT349.87C MAGNETI', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1103, '7890903045689    ', 770493, 'VALVULA TERMO PALIO FIRE / MMVT349.87C MAGNETI', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1104, '7892639001663    ', 770488, 'VALVULA TERMO PALIO FIRE / MMVT349.87C MAGNETI', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0);
INSERT INTO `produtos` (`id`, `barra`, `codigo`, `nome`, `qtd`, `valor_compra`, `valor_venda`, `estoque`, `status`, `foto`, `data`, `usuarios_id`, `categorias_id`) VALUES
(1105, '', 70, 'VALVULA TERMOSTATICA CELTA / 314792 WAHLER', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1106, '7893049950138    ', 771423, 'VALVULA TERMOSTATICA CELTA CORSA / 93275736 GM', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1107, '7898938363938    ', 770119, 'VEDACAO COLETOR ADM PALIO PRISMA / C-9501 CON', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1108, '45908    ', 771418, 'VEDACAO DA BOBINA DE IGN / 2098 DSC / c&*(*$$&&!)#(!', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1109, '7892679060668    ', 0, 'VEDA??O DA BOBINA DO UNO', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1110, '93363296    ', 770419, 'VEDA??O DE BOBINA / CORSA', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1111, '93230926    ', 0, 'VELA CORSA 1.0 JG / 93363296 GM', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1112, '', 771340, 'VELA CORSA 1.4 / 93230926 GM', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1113, '7897707509713    ', 770607, 'VELA CORSA 1.4 ONIX COBALT', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1114, '7897707510092    ', 770600, 'VELA DUSTER JOGO / BKR6ESZ-10 NGK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1115, '  ', 769721, 'VELA FIESTA ROCAM JG / LTR7A-10 NGK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1116, '7897707510559    ', 769776, 'VELA GAS RESISTE / BKR6E-D', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1117, '87295922774    ', 770604, 'VELA GOL 1.0 JG / BKR7ESB-D NGK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1118, '7897707511358    ', 770606, 'VELA NOVO FORDKA 3 CILINDRO / LNAR7A-9G', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1119, '', 0, 'VELA SANDERO 1.0 JG / LZKAR7A-D NGK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1120, '7898584371554    ', 770602, 'VELA SANDERO1.0 JG / 224019202R RENAULT GROUP', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1121, '', 771245, 'VENTILADOR COBALT ONIX / EL-20011.0 NOTUS', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1122, '7899607511919    ', 771311, 'VENTILADOR DO MOTOR', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1123, '7899607513722    ', 771623, 'VENTILADOR MOTOR COROLLA 1.8 14 / BAU-100126 BAUEN', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1124, '7316576870996    ', 771470, 'VENTILADOR MOTOR UP 1.0 / BAU-100857 BAUEN', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1125, '7898314110118    ', 0, 'VKBC6682 ROLAMENTO DT DUSTER', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1126, '', 93, 'WHITE LUB', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1127, '7897707510153    ', 0, 'WOE680 / FILTRO DE OLEO REFIL AMAROK', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1128, '', 0, 'ZKR8B-10', 0, '0.00', '0.00', NULL, NULL, '', '2021-03-18 22:45:38', 0, 0),
(1132, '781542789653', 778899, 'Bucha Estabilizadora - HIlux', 1, '98.67', '45.63', 21, 0, './imgs/03-2.jpg', NULL, 7, 8),
(1133, '781542789653', 776688, 'Amortecedor', 1, '45.42', '45.00', 21, 0, './imgs/02-1.jpg', NULL, 7, 8),
(1135, '781542789653', 771122, 'Amortecedor ', 1, '74.12', '46.00', 11, 0, './imgs/rfe.jpg', '2021-03-21 17:29:55', 7, 8),
(1139, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1140, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1141, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1142, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1143, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1144, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0),
(1145, '', 0, '', 0, '0.00', '0.00', NULL, NULL, 'imgs/sem.jpg', '2021-03-31 01:42:12', 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servicos`
--

INSERT INTO `servicos` (`id`, `nome`, `valor`) VALUES
(1, 'Alinh.. veiculo', '50.00'),
(2, 'Alinh.. pickup', '40.00'),
(3, 'Balan L.V pickup', '60.00'),
(4, 'Balan C.F Car P', '40.00'),
(6, 'Balan liga leve Car p ', '50.00'),
(7, 'Limpeza de Bico ', '150.00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`) VALUES
(4, 'admin', 'admin@eneylton.com', '$2y$10$mZ.QuTVOWHefiG58kSk2K.BW3VDnDFu/l1fhYaBmRhQ5eJTJImThm'),
(7, 'Eneylton Barros', 'eneylton@hotmail.com', '$2y$10$JZR7X2ZpplGhF4dtchAhJedF/Y0/4ynAOd8VBlR4ehJfLOKHX4mLG'),
(13, 'enexs', 'ene@gmail.com.br', '$2y$10$QOY9tsU49c0vK86BUx34peirngMXyhbktyuv1F3/b2i5He7a.IdIC');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `data` timestamp NULL DEFAULT current_timestamp(),
  `nome` varchar(255) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `barra` int(11) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `valor_venda` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `usuarios_id` int(11) NOT NULL,
  `clientes_id` int(11) NOT NULL,
  `mecanicos_id` int(11) NOT NULL,
  `produtos_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `data`, `nome`, `codigo`, `barra`, `qtd`, `valor_venda`, `subtotal`, `usuarios_id`, `clientes_id`, `mecanicos_id`, `produtos_id`) VALUES
(3, '2021-04-14 20:37:15', 'ABRACADEIRA NYLON BRANCA 283X4.80MM', 770886, 2147483647, 6, '84.69', '508.14', 7, 1, 1, 1),
(4, '2021-04-14 20:37:21', 'ABRACADEIRA NYLON BRANCA 400X4.80MM', 770885, 2147483647, 7, '150.87', '1056.09', 7, 1, 1, 2);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_caixa_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_caixa_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_caixa_mecanicos1_idx` (`mecanicos_id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_clientes_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_clientes_marcas1_idx` (`marcas_id`);

--
-- Índices para tabela `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_compras_produtos1_idx` (`produtos_id`),
  ADD KEY `fk_compras_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `estatisticas`
--
ALTER TABLE `estatisticas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_estatisticas_produtos1_idx` (`produtos_id`),
  ADD KEY `fk_estatisticas_usuarios1_idx` (`usuarios_id`);

--
-- Índices para tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `galerias`
--
ALTER TABLE `galerias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_galerias_produtos1_idx` (`produtos_id`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordem_servicos_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_ordem_servicos_mecanicos1_idx` (`mecanicos_id`),
  ADD KEY `fk_ordem_servicos_servicos1_idx` (`servicos_id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pedidos_produtos1_idx` (`produtos_id`),
  ADD KEY `fk_pedidos_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_pedidos_cliente1_idx` (`cliente_id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produtos_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_produtos_categorias1_idx` (`categorias_id`);

--
-- Índices para tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_orcamento_final_usuarios1_idx` (`usuarios_id`),
  ADD KEY `fk_orcamento_final_clientes1_idx` (`clientes_id`),
  ADD KEY `fk_orcamento_final_mecanicos1_idx` (`mecanicos_id`),
  ADD KEY `fk_vendas_produtos1_idx` (`produtos_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `estatisticas`
--
ALTER TABLE `estatisticas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT de tabela `forma_pagamento`
--
ALTER TABLE `forma_pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `galerias`
--
ALTER TABLE `galerias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `mecanicos`
--
ALTER TABLE `mecanicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1146;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `fk_caixa_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caixa_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_caixa_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_marcas1` FOREIGN KEY (`marcas_id`) REFERENCES `marcas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_clientes_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `fk_compras_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_compras_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `estatisticas`
--
ALTER TABLE `estatisticas`
  ADD CONSTRAINT `fk_estatisticas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_estatisticas_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `galerias`
--
ALTER TABLE `galerias`
  ADD CONSTRAINT `fk_galerias_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `ordem_servicos`
--
ALTER TABLE `ordem_servicos`
  ADD CONSTRAINT `fk_ordem_servicos_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordem_servicos_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ordem_servicos_servicos1` FOREIGN KEY (`servicos_id`) REFERENCES `servicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_produtos_categorias1` FOREIGN KEY (`categorias_id`) REFERENCES `categorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produtos_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk_orcamento_final_clientes1` FOREIGN KEY (`clientes_id`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orcamento_final_mecanicos1` FOREIGN KEY (`mecanicos_id`) REFERENCES `mecanicos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orcamento_final_usuarios1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_vendas_produtos1` FOREIGN KEY (`produtos_id`) REFERENCES `produtos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
