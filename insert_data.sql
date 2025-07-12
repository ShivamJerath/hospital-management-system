-- Insert Departments
INSERT INTO Departments (department_name, location) VALUES
('Cardiology', 'Building A, Floor 2'),
('Neurology', 'Building B, Floor 1'),
('Orthopedics', 'Building A, Floor 3'),
('Pediatrics', 'Building C, Floor 1');




-- Insert Doctors
INSERT INTO Doctors (first_name, last_name, specialization, phone, email, department_id, hire_date) VALUES
('Arjun', 'Sharma', 'Cardiologist', '9876543201', 'arjun.sharma@hospital.com', 1, '2020-03-15'),
('Priya', 'Verma', 'Neurologist', '9876543202', 'priya.verma@hospital.com', 2, '2019-07-22'),
('Vikram', 'Patel', 'Orthopedic Surgeon', '9876543203', 'vikram.patel@hospital.com', 3, '2021-01-10'),
('Anjali', 'Nair', 'Pediatrician', '9876543204', 'anjali.nair@hospital.com', 4, '2022-05-30');




-- Insert Patients
INSERT INTO Patients (first_name, last_name, dob, gender, phone, email, address) VALUES
('Riya', 'Singh', '1990-05-15', 'F', AES_ENCRYPT('9876543210', 'secret_key'), 'riya.singh@email.com', '123 MG Road, Mumbai'),
('Amit', 'Kumar', '1985-08-22', 'M', AES_ENCRYPT('9876543211', 'secret_key'), 'amit.kumar@email.com', '456 Anna Nagar, Chennai'),
('Sneha', 'Gupta', '1995-11-10', 'F', AES_ENCRYPT('9876543212', 'secret_key'), 'sneha.gupta@email.com', '789 Connaught Place, Delhi'),
('Rahul', 'Mehta', '1978-03-05', 'M', AES_ENCRYPT('9876543213', 'secret_key'), 'rahul.mehta@email.com', '321 Brigade Road, Bangalore');




-- Insert Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, reason) VALUES
(1, 1, '2025-07-10 10:00:00', 'Scheduled', 'Chest pain evaluation'),
(2, 2, '2025-07-11 14:00:00', 'Scheduled', 'Headache consultation'),
(3, 3, '2025-07-12 09:30:00', 'Completed', 'Knee injury checkup'),
(4, 4, '2025-07-13 11:00:00', 'Canceled', 'Child fever consultation'),
(1, 2, '2025-07-14 15:00:00', 'Scheduled', 'Follow-up neurological exam');




-- Insert Medical_Records
INSERT INTO Medical_Records (patient_id, doctor_id, diagnosis, prescription, record_date, visit_type) VALUES
(1, 1, 'Hypertension', 'Lisinopril 10mg daily', '2025-07-10', 'Outpatient'),
(2, 2, 'Migraine', 'Sumatriptan 50mg as needed', '2025-07-11', 'Outpatient'),
(3, 3, 'Knee Sprain', 'Ibuprofen 400mg, rest', '2025-07-12', 'Outpatient'),
(4, 4, 'Viral Fever', 'Paracetamol 500mg', '2025-07-13', 'Inpatient'),
(1, 2, 'Tension Headache', 'Aspirin 300mg', '2025-07-14', 'Outpatient');
