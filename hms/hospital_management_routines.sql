-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital_management
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `patientappointmentduration`
--

DROP TABLE IF EXISTS `patientappointmentduration`;
/*!50001 DROP VIEW IF EXISTS `patientappointmentduration`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientappointmentduration` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `total_appointments`,
 1 AS `completed_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `scheduledappointments`
--

DROP TABLE IF EXISTS `scheduledappointments`;
/*!50001 DROP VIEW IF EXISTS `scheduledappointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `scheduledappointments` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `appointment_date`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patientappointmentdetails`
--

DROP TABLE IF EXISTS `patientappointmentdetails`;
/*!50001 DROP VIEW IF EXISTS `patientappointmentdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientappointmentdetails` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `appointment_date`,
 1 AS `reason`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patientdiagnoses`
--

DROP TABLE IF EXISTS `patientdiagnoses`;
/*!50001 DROP VIEW IF EXISTS `patientdiagnoses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patientdiagnoses` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `diagnosis`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `completedappointments`
--

DROP TABLE IF EXISTS `completedappointments`;
/*!50001 DROP VIEW IF EXISTS `completedappointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `completedappointments` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `appointment_date`,
 1 AS `reason`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `doctorappointments`
--

DROP TABLE IF EXISTS `doctorappointments`;
/*!50001 DROP VIEW IF EXISTS `doctorappointments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctorappointments` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `appointment_date`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `patientappointmentduration`
--

/*!50001 DROP VIEW IF EXISTS `patientappointmentduration`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientappointmentduration` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,count(`a`.`appointment_id`) AS `total_appointments`,sum((case when (`a`.`status` = 'Completed') then 1 else 0 end)) AS `completed_count` from (`patients` `p` left join `appointments` `a` on((`p`.`patient_id` = `a`.`patient_id`))) group by `p`.`patient_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `scheduledappointments`
--

/*!50001 DROP VIEW IF EXISTS `scheduledappointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `scheduledappointments` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`a`.`appointment_date` AS `appointment_date`,`a`.`status` AS `status` from (`patients` `p` join `appointments` `a` on((`p`.`patient_id` = `a`.`patient_id`))) where (`a`.`status` = 'Scheduled') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patientappointmentdetails`
--

/*!50001 DROP VIEW IF EXISTS `patientappointmentdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientappointmentdetails` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`a`.`appointment_date` AS `appointment_date`,`a`.`reason` AS `reason` from (`patients` `p` join `appointments` `a` on((`p`.`patient_id` = `a`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patientdiagnoses`
--

/*!50001 DROP VIEW IF EXISTS `patientdiagnoses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patientdiagnoses` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`mr`.`diagnosis` AS `diagnosis` from (`patients` `p` join `medical_records` `mr` on((`p`.`patient_id` = `mr`.`patient_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `completedappointments`
--

/*!50001 DROP VIEW IF EXISTS `completedappointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `completedappointments` AS select `p`.`first_name` AS `first_name`,`p`.`last_name` AS `last_name`,`a`.`appointment_date` AS `appointment_date`,`a`.`reason` AS `reason` from (`patients` `p` join `appointments` `a` on((`p`.`patient_id` = `a`.`patient_id`))) where (`a`.`status` = 'Completed') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctorappointments`
--

/*!50001 DROP VIEW IF EXISTS `doctorappointments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctorappointments` AS select `d`.`first_name` AS `first_name`,`d`.`last_name` AS `last_name`,`a`.`appointment_date` AS `appointment_date`,`a`.`status` AS `status` from (`doctors` `d` join `appointments` `a` on((`d`.`doctor_id` = `a`.`doctor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-10 17:46:35
