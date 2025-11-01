

CREATE DATABASE IF NOT EXISTS hms_db;
USE hms_db;

-- Table: departments
CREATE TABLE departments (
  dept_id INT AUTO_INCREMENT PRIMARY KEY,
  dept_name VARCHAR(50) NOT NULL
);

INSERT INTO departments (dept_name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('General Medicine'),
('ENT'),
('Dermatology');

-- Table: doctors
CREATE TABLE doctors (
  doc_id INT AUTO_INCREMENT PRIMARY KEY,
  doc_name VARCHAR(50) NOT NULL,
  dept_id INT,
  email VARCHAR(80),
  phone VARCHAR(20),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO doctors (doc_name, dept_id, email, phone) VALUES
('Dr. Meera Nair', 1, 'meera@hms.com', '9876543210'),
('Dr. Arjun Rao', 4, 'arjun@hms.com', '9876543211'),
('Dr. Asha Balan', 3, 'asha@hms.com', '9876543212'),
('Dr. Neel Patil', 2, 'neel@hms.com', '9876543213'),
('Dr. Kiran Devi', 5, 'kiran@hms.com', '9876543214');

-- Table: patients
CREATE TABLE patients (
  patient_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_name VARCHAR(50) NOT NULL,
  age INT,
  gender VARCHAR(10),
  contact VARCHAR(20),
  address VARCHAR(100),
  dept_id INT,
  doctor_id INT,
  condition_summary VARCHAR(100),
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doc_id)
);

INSERT INTO patients (patient_name, age, gender, contact, address, dept_id, doctor_id, condition_summary) VALUES
('Ravi Kumar', 45, 'Male', '9876500011', 'Chennai', 1, 1, 'Chest Pain'),
('Priya Singh', 29, 'Female', '9876500012', 'Coimbatore', 4, 2, 'Fever'),
('Suresh Patel', 53, 'Male', '9876500013', 'Madurai', 2, 4, 'Migraine'),
('Divya Sharma', 38, 'Female', '9876500014', 'Erode', 3, 3, 'Fracture'),
('Manoj Verma', 40, 'Male', '9876500015', 'Salem', 5, 5, 'Diabetes'),
('Lakshmi Iyer', 34, 'Female', '9876500016', 'Trichy', 1, 1, 'Palpitations'),
('Rohit Das', 50, 'Male', '9876500017', 'Vellore', 2, 4, 'Headache'),
('Anita George', 27, 'Female', '9876500018', 'Nagercoil', 4, 2, 'Cough'),
('Vikas Reddy', 60, 'Male', '9876500019', 'Tirunelveli', 5, 5, 'Blood Pressure'),
('Renu Joseph', 22, 'Female', '9876500020', 'Karur', 3, 3, 'Sprain');

-- Table: appointments
CREATE TABLE appointments (
  appt_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  appt_date DATE,
  status VARCHAR(20),
  remarks VARCHAR(100),
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doc_id)
);

INSERT INTO appointments (patient_id, doctor_id, appt_date, status, remarks) VALUES
(1, 1, '2025-10-28', 'Completed', 'Follow-up in 1 week'),
(2, 2, '2025-10-26', 'Completed', 'Recovered well'),
(3, 4, '2025-10-30', 'Pending', 'Further tests required'),
(4, 3, '2025-10-29', 'Admitted', 'Surgery scheduled'),
(5, 5, '2025-10-31', 'Completed', 'Routine checkup');

-- Table: billing
CREATE TABLE billing (
  bill_id INT AUTO_INCREMENT PRIMARY KEY,
  patient_id INT,
  doctor_id INT,
  amount DECIMAL(10,2),
  payment_status VARCHAR(20),
  bill_date DATE,
  FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
  FOREIGN KEY (doctor_id) REFERENCES doctors(doc_id)
);

INSERT INTO billing (patient_id, doctor_id, amount, payment_status, bill_date) VALUES
(1, 1, 4500.00, 'Paid', '2025-10-28'),
(2, 2, 1200.00, 'Paid', '2025-10-26'),
(3, 4, 2300.00, 'Pending', '2025-10-30'),
(4, 3, 9800.00, 'Paid', '2025-10-29'),
(5, 5, 1500.00, 'Pending', '2025-10-31');

-- Table: staff
CREATE TABLE staff (
  staff_id INT AUTO_INCREMENT PRIMARY KEY,
  staff_name VARCHAR(50),
  role VARCHAR(30),
  contact VARCHAR(20),
  dept_id INT,
  FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO staff (staff_name, role, contact, dept_id) VALUES
('Vimal Raj', 'Nurse', '9876500030', 1),
('Anu Thomas', 'Receptionist', '9876500031', 5),
('Raghav Menon', 'Lab Technician', '9876500032', 2),
('Deepa S', 'Pharmacist', '9876500033', 5),
('Hari Narayan', 'Janitor', '9876500034', 4);


