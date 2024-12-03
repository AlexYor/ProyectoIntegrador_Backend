SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `financego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_commentary`
--

DROP TABLE IF EXISTS `t_commentary`;
CREATE TABLE IF NOT EXISTS `t_commentary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `d_commentary` datetime(6) NOT NULL,
  `d_commentary_update` datetime(6) NOT NULL,
  `t_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_course` bigint NOT NULL,
  `id_usuario` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrcu917xj16kc289l1ut5hf6ig` (`id_course`),
  KEY `FK4p00lr5ckhtk9r4jcqkevmr1v` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_course`
--

DROP TABLE IF EXISTS `t_course`;
CREATE TABLE IF NOT EXISTS `t_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_code` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `t_content` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `t_description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_course`
--

INSERT INTO `t_course` (`id`, `t_code`, `t_content`, `t_description`) VALUES
(1, 'C000214', 'Curos de finanzas en la bolsa', 'Invertir en bolsa'),
(2, 'C000215', 'Curos de finanzas en criptomonedas', 'Invertir en criptomonedas'),
(3, 'C000216', 'Curos de para gestionar tus ingresos XD', 'Gestionar tus ingresos xd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_course_rate`
--

DROP TABLE IF EXISTS `t_course_rate`;
CREATE TABLE IF NOT EXISTS `t_course_rate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_attempt` int NOT NULL,
  `d_realization` datetime(6) NOT NULL,
  `n_point` double NOT NULL,
  `id_evaluation` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfn20sv660ltfr99vr5yhb1q7m` (`id_evaluation`),
  KEY `FKj5qobc86k7pnfiuq15j6s1bp2` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_course_user_relation`
--

DROP TABLE IF EXISTS `t_course_user_relation`;
CREATE TABLE IF NOT EXISTS `t_course_user_relation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `d_inscription` date NOT NULL,
  `h_inscription` time(6) NOT NULL,
  `id_course` bigint NOT NULL,
  `id_user` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKmf4wtppqw8q2clccor480p3mj` (`id_course`),
  KEY `FKn6ctdmk0ya3ahv0s7nhok6x5c` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_evaluation`
--

DROP TABLE IF EXISTS `t_evaluation`;
CREATE TABLE IF NOT EXISTS `t_evaluation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `t_content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `t_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `n_duration` int NOT NULL,
  `id_module` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqnwxinhl3m3s2nfm7ckal7wg5` (`id_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_module`
--

DROP TABLE IF EXISTS `t_module`;
CREATE TABLE IF NOT EXISTS `t_module` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_code` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `t_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_course` bigint NOT NULL,
  `id_theme` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd2b5a4sltntadnhpwrmb9ug3u` (`id_course`),
  KEY `FKr9i4iovyp71nklavcnr2uu758` (`id_theme`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_module`
--

INSERT INTO `t_module` (`id`, `t_code`, `t_description`, `id_course`, `id_theme`) VALUES
(13, 'F85001', 'Inversiones de alto y bajo riesgo', 1, NULL),
(14, 'F85002', 'Gestión de criptos rata', 2, NULL),
(15, 'F85003', 'Trading', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_progress`
--

DROP TABLE IF EXISTS `t_progress`;
CREATE TABLE IF NOT EXISTS `t_progress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `d_end` datetime(6) NOT NULL,
  `d_start` datetime(6) NOT NULL,
  `n_percentage` int NOT NULL,
  `t_status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_course` bigint DEFAULT NULL,
  `id_user` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd8hvs8clchsdocej62v5ut1qr` (`id_course`),
  KEY `FKq2b8r7gj4gnogym4erqv7x445` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_role`
--

DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_description` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_role`
--

INSERT INTO `t_role` (`id`, `t_description`) VALUES
(1, 'ADMIN_ROLE'),
(2, 'USER_ROLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_theme`
--

DROP TABLE IF EXISTS `t_theme`;
CREATE TABLE IF NOT EXISTS `t_theme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `t_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_user`
--

DROP TABLE IF EXISTS `t_user`;
CREATE TABLE IF NOT EXISTS `t_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `t_code` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `d_created` date NOT NULL,
  `d_updated` date NOT NULL,
  `t_email` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `t_last_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `t_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `t_phone` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `h_created` time(6) NOT NULL,
  `h_updated` time(6) NOT NULL,
  `id_role` bigint DEFAULT NULL,
  `t_password` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXk443mqsauy7va7r5bnfq5k7oy` (`t_code`,`t_email`),
  KEY `FK3mgw2r5niou501um9otmhoey7` (`id_role`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_user`
--

INSERT INTO `t_user` (`id`, `t_code`, `d_created`, `d_updated`, `t_email`, `t_last_name`, `t_name`, `t_phone`, `h_created`, `h_updated`, `id_role`, `t_password`) VALUES
(3, '115459', '2024-11-14', '2024-11-14', 'brandom@gmail.com', 'XD', 'Brandom', '6666666', '00:06:01.458000', '00:06:01.458000', 2, '$2a$11$XXSTxlZ2l4m81M.oiZ4oS.Ha7qbZoSVA37jWkcc2yzQUSxiod4dU.');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_commentary`
--
ALTER TABLE `t_commentary`
  ADD CONSTRAINT `FK4p00lr5ckhtk9r4jcqkevmr1v` FOREIGN KEY (`id_usuario`) REFERENCES `t_user` (`id`),
  ADD CONSTRAINT `FKrcu917xj16kc289l1ut5hf6ig` FOREIGN KEY (`id_course`) REFERENCES `t_course` (`id`);

--
-- Filtros para la tabla `t_course_rate`
--
ALTER TABLE `t_course_rate`
  ADD CONSTRAINT `FKfn20sv660ltfr99vr5yhb1q7m` FOREIGN KEY (`id_evaluation`) REFERENCES `t_evaluation` (`id`),
  ADD CONSTRAINT `FKj5qobc86k7pnfiuq15j6s1bp2` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`);

--
-- Filtros para la tabla `t_course_user_relation`
--
ALTER TABLE `t_course_user_relation`
  ADD CONSTRAINT `FKmf4wtppqw8q2clccor480p3mj` FOREIGN KEY (`id_course`) REFERENCES `t_course` (`id`),
  ADD CONSTRAINT `FKn6ctdmk0ya3ahv0s7nhok6x5c` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`);

--
-- Filtros para la tabla `t_evaluation`
--
ALTER TABLE `t_evaluation`
  ADD CONSTRAINT `FKqnwxinhl3m3s2nfm7ckal7wg5` FOREIGN KEY (`id_module`) REFERENCES `t_module` (`id`);

--
-- Filtros para la tabla `t_module`
--
ALTER TABLE `t_module`
  ADD CONSTRAINT `FKd2b5a4sltntadnhpwrmb9ug3u` FOREIGN KEY (`id_course`) REFERENCES `t_course` (`id`),
  ADD CONSTRAINT `FKr9i4iovyp71nklavcnr2uu758` FOREIGN KEY (`id_theme`) REFERENCES `t_theme` (`id`);

--
-- Filtros para la tabla `t_progress`
--
ALTER TABLE `t_progress`
  ADD CONSTRAINT `FKd8hvs8clchsdocej62v5ut1qr` FOREIGN KEY (`id_course`) REFERENCES `t_course` (`id`),
  ADD CONSTRAINT `FKq2b8r7gj4gnogym4erqv7x445` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`);

--
-- Filtros para la tabla `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `FK3mgw2r5niou501um9otmhoey7` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
