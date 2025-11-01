
## 🏥 HMS — Hospital Management System

### 📋 Overview

The **Hospital Management System (HMS)** is a full-stack web application built using **Flask**, **MySQL**, **HTML**, **CSS**, and **JavaScript**.
It provides a complete digital platform to manage hospital operations including **patient records**, **appointments**, **billing**, **analytics**, and **staff management** — all through dedicated dashboards for **Admin**, **Doctor**, and **Patient** roles.

---

### 🚀 Features

#### 👨‍⚕️ Admin Dashboard

* Search, add, and manage patient records
* Access to appointment history and patient details
* Manage staff and hospital resources
* View analytics and billing summaries

#### 🩺 Doctor Dashboard

* View assigned patients
* Access appointment history
* Review medical records
* Add remarks and update patient condition

#### 👩‍💼 Patient Dashboard

* View medical history and records
* Track appointments and billing info
* Access doctor details and hospital updates

#### 🔍 Search Patient Module

* Fast, dynamic search with real-time filtering
* Integrated with MySQL backend
* View full patient details in a clean, teal-themed interface

---

### 🧱 Tech Stack

| Component          | Technology                          |
| ------------------ | ----------------------------------- |
| Backend            | Flask (Python)                      |
| Database           | MySQL                               |
| Frontend           | HTML, CSS, JavaScript               |
| Styling            | TailwindCSS & Custom CSS            |
| Hosting (optional) | Render / PythonAnywhere / Localhost |

---



### 🧩 Database Setup

Run the following commands in your MySQL shell:

```sql
CREATE DATABASE hms;
USE hms;

CREATE TABLE patients (
    id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id VARCHAR(10),
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50),
    doctor VARCHAR(100),
    condition_desc VARCHAR(100),
    status VARCHAR(50),
    last_visit DATE
);
```

(Optional) Insert sample data:

```sql
INSERT INTO patients (patient_id, name, age, gender, department, doctor, condition_desc, status, last_visit)
VALUES
('P101', 'Ravi Kumar', 45, 'Male', 'Cardiology', 'Dr. Arjun', 'Chest Pain', 'Admitted', '2025-10-25'),
('P102', 'Priya Sharma', 29, 'Female', 'Neurology', 'Dr. Meera', 'Migraine', 'Discharged', '2025-10-24');
```

---

### ⚙️ Installation & Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/Mahimha13/HMS_Hospital_Management_System.git
   cd HMS_Hospital_Management_System
   ```

2. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

   *(or manually install: `flask`, `mysql-connector-python`)*

3. Update MySQL credentials in `app.py`:

   ```python
   db = mysql.connector.connect(
       host="localhost",
       user="root",
       password="yourpassword",
       database="hms"
   )
   ```

4. Run the application:

   ```bash
   python app.py
   ```

5. Open in browser:

   ```
   http://127.0.0.1:5000
   ```

---

### 💡 Future Enhancements

* Add login authentication for all roles
* Role-based access control
* Automated email notifications for appointments
* Integration with hospital billing systems

---

### 🧑‍💻 Author

**Mahimha A.K**
Hospital Management System — Flask + MySQL Project
GitHub: [Mahimha13](https://github.com/Mahimha13)

---


