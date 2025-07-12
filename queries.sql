SELECT * from Departments;

SELECT * from Doctors;

SELECT * from Patientss;

SELECT * from Appointments;

SELECT * from Medical_Records;







-- Queries

-- 1 Write a SQL query to retrieve all details of departments in the hospital.
SELECT * FROM Departments;

-- 2 Write a SQL query to display the first and last names of all patients.
SELECT first_name, last_name FROM Patients;

-- 3 Write a SQL query to list doctors who specialize as cardiologists.
SELECT first_name, last_name, specialization 
FROM Doctors 
WHERE specialization = 'Cardiologist';

-- 4 Write a SQL query to find all upcoming appointments scheduled after the current date.
SELECT appointment_id, appointment_date, status 
FROM Appointments 
WHERE appointment_date > NOW();

-- 5 Write a SQL query to count the number of patients by gender.
SELECT gender, COUNT(*) AS patient_count 
FROM Patients 
GROUP BY gender;

-- 6 Write a SQL query to list all doctors ordered by their hire date in descending order.
SELECT first_name, last_name, hire_date 
FROM Doctors 
ORDER BY hire_date DESC;

-- 7 Write a SQL query to retrieve all appointments with a status of 'Completed'.
SELECT * FROM Appointments 
WHERE status = 'Completed';

-- 8 Write a SQL query to display medical records for outpatient visits.
SELECT record_id, diagnosis, visit_type 
FROM Medical_Records 
WHERE visit_type = 'Outpatient';

-- 9 Write a SQL query to list the first three departments in the database.
SELECT department_name 
FROM Departments 
LIMIT 3;

-- 10 Write a SQL query to show the first name, last name, and department name for each doctor.
SELECT d.first_name, d.last_name, dep.department_name 
FROM Doctors d 
JOIN Departments dep ON d.department_id = dep.department_id;




-- 11. Write a SQL query to display the first and last names, and appointment dates for all patients with appointments.
SELECT p.first_name, p.last_name, a.appointment_date
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id;

-- 12. Write a SQL query to count the number of appointments per doctor, including doctors with no appointments.
SELECT d.first_name, d.last_name, COUNT(a.appointment_id) AS appointment_count
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;


-- 13. Write a SQL query to show the number of medical records for each patient.
SELECT p.first_name, p.last_name, COUNT(mr.record_id) AS record_count
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id
GROUP BY p.patient_id;

-- 14. Write a SQL query to list appointments scheduled between July 10, 2025, and July 12, 2025
SELECT *
FROM Appointments
WHERE appointment_date BETWEEN '2025-07-10' AND '2025-07-12';

-- 15. Write a SQL query to find patients whose last names start with the letter 'S'.
SELECT first_name, last_name
FROM Patients
WHERE last_name LIKE 'S%';

-- 16. Write a SQL query to count appointments grouped by their status.
SELECT status, COUNT(*) AS count
FROM Appointments
GROUP BY status;

-- 17. Write a SQL query to list doctors with more than one appointment.
SELECT d.first_name, d.last_name, COUNT(a.appointment_id) AS appt_count
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
HAVING appt_count > 1;

-- 18. Write a SQL query to display patient names, doctor names, and appointment dates for all appointments.
SELECT p.first_name AS patient, d.first_name AS doctor, a.appointment_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

-- 19. Write a SQL query to retrieve patient names and their decrypted phone numbers.
SELECT first_name, last_name, AES_DECRYPT(phone, 'secret_key') AS phone
FROM Patients;

-- 20. Write a SQL query to update the status of appointment ID 1 to 'Completed'.
UPDATE Appointments
SET status = 'Completed'
WHERE appointment_id = 1;

SELECT * FROM Appointments WHERE appointment_id = 1;


-- 21. Write a SQL query to delete all canceled appointments.
DELETE FROM Appointments
WHERE status = 'Canceled';

SELECT * FROM Appointments WHERE status = 'Canceled';


-- 22. Write a SQL query to list all unique visit types from medical records.
SELECT DISTINCT visit_type
FROM Medical_Records;

-- 23. Write a SQL query to count the total number of medical records per patient.
SELECT patient_id, COUNT(record_id) AS total_records
FROM Medical_Records
GROUP BY patient_id;

-- 24. Write a SQL query to find patients diagnosed with hypertension.
SELECT p.first_name, p.last_name, mr.diagnosis
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id
WHERE mr.diagnosis LIKE '%Hypertension%';


-- 25. Write a SQL query to list all appointments that are either 'Scheduled' or 'Completed'.
SELECT *
FROM Appointments
WHERE status = 'Scheduled' OR status = 'Completed';

-- 26. Write a SQL query to display doctors who are either cardiologists or neurologists.
SELECT first_name, last_name
FROM Doctors
WHERE specialization IN ('Cardiologist', 'Neurologist');


-- 27. Write a SQL query to show scheduled or completed appointments for doctor ID 1.
SELECT *
FROM Appointments
WHERE doctor_id = 1 AND (status = 'Scheduled' OR status = 'Completed');

-- 28. Write a SQL query to find patients with no email address.
SELECT first_name, last_name
FROM Patients
WHERE email IS NULL;

-- 29. Write a SQL query to calculate the age of each patient based on their date of birth.
SELECT first_name, last_name, FLOOR(DATEDIFF(CURDATE(), dob) / 365) AS age
FROM Patients;

-- 30. Write a SQL query to concatenate the first and last names of doctors into a single column.
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM Doctors;



-- 31. Write a SQL query to list patients who have at least one appointment using a subquery.
SELECT first_name, last_name
FROM Patients
WHERE patient_id IN (SELECT patient_id FROM Appointments);


-- 32. Write a SQL query to find patients diagnosed with hypertension using a correlated subquery.
SELECT first_name, last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Medical_Records mr
    WHERE mr.patient_id = p.patient_id
    AND mr.diagnosis LIKE '%Hypertension%'
);


-- 33. Write a SQL query to rank doctors based on the number of appointments they have.
SELECT d.first_name, d.last_name,
       COUNT(a.appointment_id) AS appt_count,
       RANK() OVER (ORDER BY COUNT(a.appointment_id) DESC) AS rank
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;


-- 34. Write a SQL query to assign a visit number to each medical record within each visit type using a window function.
SELECT patient_id, visit_type, record_date,
       ROW_NUMBER() OVER (PARTITION BY visit_type ORDER BY record_date) AS visit_number
FROM Medical_Records;


-- 35. Write a SQL query to show the cumulative count of appointments ordered by date.
SELECT appointment_date,
       COUNT(*) OVER (ORDER BY appointment_date) AS running_total
FROM Appointments;


-- 36. Write a SQL query to list patients with their encrypted phone numbers using a JOIN.
SELECT p.first_name, p.last_name, p.phone
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id;


-- 37. Write a SQL query to list patients with their appointment count using a subquery.
SELECT first_name, last_name,
       (SELECT COUNT(*) FROM Appointments a WHERE a.patient_id = p.patient_id) AS appt_count
FROM Patients p;


-- 38. Write a SQL query to create a view showing scheduled appointments with patient names.
CREATE VIEW ScheduledAppointments AS
SELECT p.first_name, p.last_name, a.appointment_date, a.status
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'Scheduled';


-- 39. Write a SQL query to list patients with more than one appointment.
SELECT p.first_name, p.last_name, COUNT(a.appointment_id) AS appt_count
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id
HAVING appt_count > 1;


-- 40. Write a SQL query to find appointments with the same doctor and date
SELECT a1.appointment_id, a1.appointment_date, a2.appointment_id AS conflicting_appointment
FROM Appointments a1
JOIN Appointments a2 ON a1.doctor_id = a2.doctor_id
WHERE a1.appointment_date = a2.appointment_date
AND a1.appointment_id < a2.appointment_id;


-- 41. Write a SQL query to display patient names, doctor names, department names, and diagnoses
SELECT p.first_name AS patient, d.first_name AS doctor, dep.department_name, mr.diagnosis
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id
JOIN Doctors d ON mr.doctor_id = d.doctor_id
JOIN Departments dep ON d.department_id = dep.department_id;


-- 42. Write a SQL query to list appointments with a custom status description
SELECT a.appointment_id, a.appointment_date,
       CASE a.status
           WHEN 'Scheduled' THEN 'Upcoming'
           WHEN 'Completed' THEN 'Done'
           ELSE 'Not Active'
       END AS status_description,
       p.first_name AS patient
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id;


-- 43. Write a SQL query to count appointments per doctor by department.
SELECT d.first_name, d.last_name, dep.department_name,
       COUNT(a.appointment_id) AS appt_count
FROM Doctors d
JOIN Departments dep ON d.department_id = dep.department_id
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id, dep.department_name;


-- 44. Write a SQL query to show patient appointment counts
SELECT first_name, last_name,
       (SELECT COUNT(*) FROM Appointments a WHERE a.patient_id = p.patient_id) AS appt_count
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Appointments a WHERE a.patient_id = p.patient_id
);


-- 45. Write a SQL query to combine doctors and patients with roles. 
SELECT first_name, last_name, 'Doctor' AS role
FROM Doctors
UNION
SELECT first_name, last_name, 'Patient' AS role
FROM Patients;


-- 46. Write a SQL query to list all patients and doctors with or without appointments. 
SELECT p.first_name AS patient, d.first_name AS doctor
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
LEFT JOIN Doctors d ON a.doctor_id = d.doctor_id
UNION
SELECT p.first_name, d.first_name
FROM Patients p
RIGHT JOIN Appointments a ON p.patient_id = a.patient_id
RIGHT JOIN Doctors d ON a.doctor_id = d.doctor_id;


-- 47. Write a SQL query to calculate days between first and last medical visits.
SELECT p.first_name, p.last_name,
       (SELECT DATEDIFF(MAX(record_date), MIN(record_date))
        FROM Medical_Records mr WHERE mr.patient_id = p.patient_id) AS days_between
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Medical_Records mr WHERE mr.patient_id = p.patient_id
);


-- 48. Write a SQL query to count inpatient and outpatient visits. 
SELECT p.first_name, p.last_name,
       SUM(CASE WHEN mr.visit_type = 'Inpatient' THEN 1 ELSE 0 END) AS inpatient_visits,
       SUM(CASE WHEN mr.visit_type = 'Outpatient' THEN 1 ELSE 0 END) AS outpatient_visits
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id
GROUP BY p.patient_id;


-- 49. Write a SQL query to create a clone of the Departments table.
CREATE TABLE Departments_Clone AS
SELECT * FROM Departments;


-- 50. Write a SQL query to list patients with their age. 
SELECT p.first_name, p.last_name, FLOOR(DATEDIFF(CURDATE(), p.dob) / 365) AS age
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id;


-- 51. Write a SQL query to list doctors with no appointments. 
SELECT d.first_name, d.last_name
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE a.appointment_id IS NULL;


-- 52. Write a SQL query to summarize patient appointment and medical record counts. 
SELECT first_name, last_name,
       (SELECT COUNT(*) FROM Appointments a WHERE a.patient_id = p.patient_id) AS appt_count,
       (SELECT COUNT(*) FROM Medical_Records mr WHERE mr.patient_id = p.patient_id) AS record_count
FROM Patients p;


-- 53. Write a SQL query to retrieve the latest medical record for each patient. 
SELECT mr.patient_id, mr.diagnosis, mr.record_date
FROM Medical_Records mr
WHERE mr.record_date = (
    SELECT MAX(record_date)
    FROM Medical_Records mr2
    WHERE mr2.patient_id = mr.patient_id
);


-- 54. Write a SQL query to create a view for appointments by doctor.
CREATE VIEW DoctorAppointments AS
SELECT d.first_name, d.last_name, a.appointment_date, a.status
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id;

SELECT * FROM DoctorAppointments;


-- 55. Write a SQL query to analyze appointments by date. 
SELECT a.appointment_date, p.first_name AS patient, d.first_name AS doctor
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date >= '2025-07-10';


-- 56. Write a SQL query to clone the Appointments table and list its contents.
CREATE TABLE Appointments_Clone AS
SELECT * FROM Appointments;
SELECT * FROM Appointments_Clone;


-- 57. Write a SQL query to list doctors with multiple medical records. 
SELECT d.first_name, d.last_name, COUNT(mr.record_id) AS record_count
FROM Doctors d
JOIN Medical_Records mr ON d.doctor_id = mr.doctor_id
GROUP BY d.doctor_id
HAVING record_count > 1;


-- 58. Write a SQL query to list all possible patient-doctor pairs. 
SELECT p.first_name AS patient, d.first_name AS doctor
FROM Patients p
CROSS JOIN Doctors d
LIMIT 5;


-- 59. Write a SQL query to list appointments for the next day. 
SELECT appointment_id, appointment_date, status
FROM Appointments
WHERE appointment_date IN (
    SELECT appointment_date
    FROM Appointments
    WHERE DATE(appointment_date) = CURDATE() + INTERVAL 1 DAY
);


-- 60. Write a SQL query to find medical records with 'Hypertension'.
SELECT p.first_name, p.last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Medical_Records mr
    WHERE mr.patient_id = p.patient_id
    AND mr.diagnosis LIKE '%Hypertension%'
);


-- 61. Write a SQL query to list patients who have appointments with cardiologists.
SELECT p.first_name, p.last_name, d.specialization
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE d.specialization = 'Cardiologist';


-- 62. Write a SQL query to find doctors who have not treated any patients. 
SELECT first_name, last_name
FROM Doctors
WHERE doctor_id NOT IN (SELECT doctor_id FROM Medical_Records);


-- 63. Write a SQL query to count medical records by visit type. 
SELECT visit_type, COUNT(*) AS record_count
FROM Medical_Records
GROUP BY visit_type;


-- 64. Write a SQL query to create a view showing patients with their appointment dates and reasons.
CREATE VIEW PatientAppointmentDetails AS
SELECT p.first_name, p.last_name, a.appointment_date, a.reason
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id;

SELECT * FROM PatientAppointmentDetails;


-- 65. Write a SQL query to list doctors and their department locations. 
SELECT d.first_name, d.last_name, dep.location
FROM Doctors d
JOIN Departments dep ON d.department_id = dep.department_id;


-- 66. Write a SQL query to find patients with appointments in July 2025. 
SELECT first_name, last_name
FROM Patients
WHERE patient_id IN (
    SELECT patient_id
    FROM Appointments
    WHERE YEAR(appointment_date) = 2025 AND MONTH(appointment_date) = 7
);


-- 67. Write a SQL query to list appointments with patient and doctor emails. 
SELECT a.appointment_id, p.email AS patient_email, d.email AS doctor_email
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;


-- 68. Write a SQL query to find patients with no medical records. 
SELECT first_name, last_name
FROM Patients p
WHERE NOT EXISTS (
    SELECT 1 FROM Medical_Records mr
    WHERE mr.patient_id = p.patient_id
);


-- 69. Write a SQL query to count doctors by specialization. 
SELECT specialization, COUNT(*) AS doctor_count
FROM Doctors
GROUP BY specialization;


-- 70. Write a SQL query to create a clone of the Patients table.
CREATE TABLE Patients_Clone AS
SELECT * FROM Patients;

SELECT first_name, last_name FROM Patients_Clone;


-- 71. Write a SQL query to list medical records with patient and doctor name. 
SELECT mr.record_id, p.first_name AS patient, d.first_name AS doctor
FROM Medical_Records mr
JOIN Patients p ON mr.patient_id = p.patient_id
JOIN Doctors d ON mr.doctor_id = d.doctor_id;


-- 72. Write a SQL query to find appointments with reasons containing 'consultation'. 
SELECT appointment_id, appointment_date
FROM Appointments
WHERE appointment_id IN (
    SELECT appointment_id
    FROM Appointments
    WHERE reason LIKE '%consultation%'
);


-- 73. Write a SQL query to create a view for completed appointments with patient details.
CREATE VIEW CompletedAppointments AS
SELECT p.first_name, p.last_name, a.appointment_date, a.reason
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'Completed';

SELECT * FROM CompletedAppointments;


-- 74. Write a SQL query to list doctors with their patient count. 
SELECT d.first_name, d.last_name, COUNT(DISTINCT a.patient_id) AS patient_count
FROM Doctors d
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id;


-- 75. Write a SQL query to find patients with appointments after a specific doctor. 
SELECT p.first_name, p.last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Appointments a
    WHERE a.patient_id = p.patient_id
    AND a.doctor_id = (SELECT doctor_id FROM Doctors WHERE first_name = 'Priya')
);


-- 76. Write a SQL query to list medical records for outpatient visits in 2025. 
SELECT mr.record_id, mr.diagnosis, p.first_name
FROM Medical_Records mr
JOIN Patients p ON mr.patient_id = p.patient_id
WHERE mr.visit_type = 'Outpatient' AND YEAR(mr.record_date) = 2025;


-- 77. Write a SQL query to clone the Medical_Records table.
CREATE TABLE Medical_Records_Clone AS
SELECT * FROM Medical_Records;

SELECT record_id, diagnosis FROM Medical_Records_Clone;


-- 78. Write a SQL query to list patients with appointments in specific departments. 
SELECT first_name, last_name
FROM Patients
WHERE patient_id IN (
    SELECT a.patient_id
    FROM Appointments a
    JOIN Doctors d ON a.doctor_id = d.doctor_id
    WHERE d.department_id IN (
        SELECT department_id FROM Departments WHERE department_name IN ('Cardiology', 'Neurology')
    )
);


-- 79. Write a SQL query to count appointments per day.
SELECT DATE(appointment_date) AS appt_date, COUNT(*) AS appt_count
FROM Appointments
GROUP BY DATE(appointment_date);


-- 80. Write a SQL query to list doctors and their earliest appointment. 
SELECT d.first_name, d.last_name,
       (SELECT MIN(appointment_date) FROM Appointments a WHERE a.doctor_id = d.doctor_id) AS earliest_appointment
FROM Doctors d;


-- 81. Write a SQL query to create a view for patients with medical records and their diagnoses.
CREATE VIEW PatientDiagnoses AS
SELECT p.first_name, p.last_name, mr.diagnosis
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id;

SELECT * FROM PatientDiagnoses;


-- 82. Write a SQL query to find doctors with appointments in multiple departments. 
SELECT d.first_name, d.last_name, COUNT(DISTINCT dep.department_id) AS dept_count
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
JOIN Departments dep ON d.department_id = dep.department_id
GROUP BY d.doctor_id
HAVING dept_count > 1;


-- 83. Write a SQL query to list patients with specific diagnoses. 
SELECT first_name, last_name
FROM Patients p
WHERE EXISTS (
    SELECT 1 FROM Medical_Records mr
    WHERE mr.patient_id = p.patient_id
    AND mr.diagnosis IN ('Hypertension', 'Migraine')
);


-- 84. Write a SQL query to list appointments with patient addresses.
SELECT a.appointment_id, a.appointment_date, p.address
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id;


-- 85. Write a SQL query to clone the Doctors table and list its contents.
CREATE TABLE Doctors_Clone AS
SELECT * FROM Doctors;

SELECT first_name, last_name, specialization FROM Doctors_Clone;


-- 86. Write a SQL query to list patients who have both appointments and medical records using. 
SELECT DISTINCT p.first_name, p.last_name
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
WHERE p.patient_id IN (
    SELECT patient_id
    FROM Medical_Records
);


-- 87. Write a SQL query to find doctors with appointments on the same day as their medical records. 
SELECT DISTINCT d.first_name, d.last_name
FROM Doctors d
JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE EXISTS (
    SELECT 1
    FROM Medical_Records mr
    WHERE mr.doctor_id = d.doctor_id
    AND DATE(mr.record_date) = DATE(a.appointment_date)
);


-- 88. Write a SQL query to count the number of appointments per department for Scheduled status. 
SELECT dep.department_name, COUNT(a.appointment_id) AS scheduled_count
FROM Departments dep
JOIN Doctors d ON dep.department_id = d.department_id
LEFT JOIN Appointments a ON d.doctor_id = a.doctor_id
WHERE a.status = 'Scheduled' OR a.appointment_id IS NULL
GROUP BY dep.department_id;


-- 89. Write a SQL query to create a view showing patients with their total appointment duration (assuming duration is derived from status).
CREATE VIEW PatientAppointmentDuration AS
SELECT p.first_name, p.last_name,
       COUNT(a.appointment_id) AS total_appointments,
       SUM(CASE WHEN a.status = 'Completed' THEN 1 ELSE 0 END) AS completed_count
FROM Patients p
LEFT JOIN Appointments a ON p.patient_id = a.patient_id
GROUP BY p.patient_id;


-- 90. Write a SQL query to list patients whose medical records were created by doctors in specific departments. 
SELECT p.first_name, p.last_name, mr.diagnosis
FROM Patients p
JOIN Medical_Records mr ON p.patient_id = mr.patient_id
WHERE mr.doctor_id IN (
    SELECT doctor_id
    FROM Doctors
    WHERE department_id IN (
        SELECT department_id
        FROM Departments
        WHERE department_name IN ('Neurology', 'Pediatrics')
    )
);
