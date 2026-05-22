
CREATE DATABASE IF NOT EXISTS hospital;
USE hospital;

CREATE TABLE patient (
    PatientID INT,
    PatientName VARCHAR(20),
    Age INT,
    Gender VARCHAR(10),
    AdmissionDate DATE
);

-- Alteration tasks
ALTER TABLE patient ADD DoctorAssigned VARCHAR(20);
ALTER TABLE patient MODIFY PatientName VARCHAR(100);
    
-- Rename and cleanup demonstration
RENAME TABLE patient TO Patient_info;
DROP TABLE Patient_info;
