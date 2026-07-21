CREATE DATABASE gram_panchayat_db;
USE gram_panchayat_db;
SELECT DATABASE();
CREATE TABLE Citizen (Citizen_id INT PRIMARY KEY, Full_name VARCHAR(100) NOT NULL, Date_of_Birth DATE NOT NULL, Gender VARCHAR(10) NOT NULL, Mobile_Number VARCHAR(15) UNIQUE NOT NULL, Occupation VARCHAR(50) , Village_name VARCHAR(50) NOT NULL, Is_active BOOLEAN NOT NULL);
INSERT INTO Citizen (Citizen_id, Full_name, Date_of_Birth, Gender, Mobile_Number, Occupation, Village_name, Is_active)VALUES
(101,'Ravi Kumar','1995-06-15','Male','9876500001','Farmer','Ramapuram',TRUE),
(102,'Lakshmi Devi','1988-11-22','Female','9876500002','Tailor','Ramapuram',TRUE),
(103,'Suresh Babu','1992-03-10','Male','9876500003','Shopkeeper','Seethapuram',TRUE),
(104,'Anjali Rao','2000-08-05','Female','9876500004','Student','Ramapuram',TRUE),
(105,'Kiran Kumar','1985-01-18','Male','9876500005','Electrician','Seethapuram',TRUE),
(106,'Meena Kumari','1998-12-30','Female','9876500006','Teacher','Lakshmipuram',FALSE);
select *from Citizen;
CREATE TABLE certification_Type(Certificate_type_id INT PRIMARY KEY, Certificate_name VARCHAR(100) UNIQUE NOT NULL, description VARCHAR(200) NOT NULL, Processing_days INT NOT NULL, Application_fee DECIMAL(8,2) NOT NULL, Is_available BOOLEAN NOT NULL);
INSERT INTO certification_Type(Certificate_type_id, Certificate_name, description, Processing_days, Application_fee, Is_available)VALUES
(1,'Residence Certificate','Certifies the declared place of residence', 7, 30.00, TRUE),
(2,'Birth Record Request','Request for a locally maintained birth record', 5, 20.00, TRUE),
(3,'Death Record Request','Request for a locally maintained death record', 5, 20.00, TRUE),
(4,'Family Member Certificate','Records declared family-member information', 10, 40.00, TRUE),
(5,'Property Certificate','Certificate related to locally maintained property records', 15, 50.00, TRUE),
(6,'No-Dues Certificate','Indicates applicable local dues status', 7, 25.00, FALSE);
SELECT *FROM certification_Type;
CREATE TABLE certificate_Application(Application_id INT PRIMARY KEY, Citizen_id INT NOT NULL, Certificate_name VARCHAR(100) NOT NULL, Application_date DATE NOT NULL, Purpose VARCHAR(200) NOT NULL, Application_status VARCHAR(30) NOT NULL, Fee_paid DECIMAL(8,2) NOT NULL, Reference_number VARCHAR(30) UNIQUE NOT NULL);
INSERT INTO certificate_Application(Application_id, Citizen_id, Certificate_name, Application_date, Purpose, Application_status, Fee_paid, Reference_number )VALUES
(1001,101,'Residence Certificate', '2026-07-01', 'Bank account documentation', 'Submitted', 30.00, 'GP20260001'),
(1002,102,'Family Member Certificate', '2026-07-02', 'Welfare Scheme Application', 'Under Review', 40.00, 'GP20260002'),
(1003,103,'Property Certificate', '2026-07-03', 'Property documentation', 'Submitted', 50.00, 'GP20260003'),
(1004,104,'Residence Certificate', '2026-07-04', 'College Admission', 'Approved', 30.00, 'GP20260004'),
(1005,105,'No-Dues Certificate', '2026-07-05', 'Local service requirement', 'Under Review', 25.00, 'GP20260005'),
(1006,106,'Birth Record Requests', '2026-07-06', 'Personal documentation', 'Rejected', 20.00, 'GP20260006');
SELECT *FROM certificate_Application;
CREATE TABLE Panchayat_office(Office_id INT PRIMARY KEY, Office_name VARCHAR(100) NOT NULL, Village_name VARCHAR(50) NOT NULL, Pincode VARCHAR(6) NOT NULL, Contact_number VARCHAR(15) UNIQUE, Office_email VARCHAR(100) UNIQUE, Opening_time TIME NOT NULL, Is_operational BOOLEAN NOT NULL);
INSERT INTO Panchayat_office(Office_id, Office_name, Village_name, Pincode, Contact_number, Office_email, Opening_time, Is_operational)VALUES
(1,'Ramapuram Gram Panchayat','Ramapuram','521101','0866000001','ramapuram@gp.example','09:00:00',TRUE),
(2,'Seethampeta Gram Panchayat','Seethampeta','521102','0866000002','seethampeta@gp.example','09:30:00',TRUE),
(3,'Lakshmipuram Gram Panchayat','Lakshmipuram','521103','0866000003','lakshmipuram @gp.example','09:00:00',TRUE),
(4,'Krishnapuram Gram Panchayat','Krishnapuram','521104','0866000004','krishnapuram@gp.example','10:00:00',TRUE),
(5,'Venkatapuram Gram Panchayat','Venkatapuram','521105','0866000005','venkatapuram@gp.example','09:30:00',TRUE),
(6,'Gopalapuram Gram Panchayat','Gopalapuram','521106','0866000006','gopalapuram@gp.example','09:00:00',FALSE);
SELECT *FROM Panchayat_office;
INSERT INTO Citizen VALUES(107,'Lakshmi Narayana','2008-04-07','Male','6781902851','Graduate','Ramapuram',TRUE);
INSERT INTO certification_Type VALUES(7,'Income Certificate','Certificate for Income verification',8,30.00,TRUE);
UPDATE certificate_Application SET Application_status='Under Review' WHERE Application_id=1001;
UPDATE certificate_Application SET Application_status='Approved' WHERE Application_id=1002;
UPDATE Citizen SET Occupation='Electrical_Technician' WHERE Citizen_id=105;
UPDATE certification_Type SET Processing_days=12 WHERE Certificate_type_id=5;
UPDATE certification_Type SET Is_available=TRUE WHERE Certificate_type_id=6;
DELETE FROM Citizen WHERE Citizen_id=107;
ALTER TABLE Citizen ADD Address VARCHAR(50);
ALTER TABLE certification_type ADD issued_date DATE;
ALTER TABLE certificate_application MODIFY Purpose VARCHAR(250);
ALTER TABLE panchayat_office ADD Closing_Time TIME;
CREATE TABLE Temporary_Request(request_id int PRIMARY KEY, request_name varchar(50) not null, request_date date not null); 
INSERT INTO  Temporary_Request(request_id , request_name, request_date)VALUES
(129,'P.Pavan kumar','2026-04-01'),
(130,'L.Varun','2026-05-03'),
(131,'N.Shiva','2026-07-17');
select *from temporary_request;
TRUNCATE TABLE temporary_request;
select *from temporary_request;
DROP TABLE Temporary_Request;
#these 62 to 65 statemets are to understand what errors are got.
INSERT INTO Citizen VALUES(101,'K Sai','2008-12-27','Male','6567902851','Farmer','Seethapuram',TRUE,'near maruthi hall');
#Error Code: 1062. Duplicate entry '101' for key 'citizen.PRIMARY'
INSERT INTO Citizen VALUES(108,'Ravi','2011-11-27','Male','9876500001','Clerk','Boozapuram',FALSE,'near iiit');
#Error Code: 1062. Duplicate entry '9876500001' for key 'citizen.Mobile_Number'
INSERT INTO certification_Type VALUES(9,null,'Certificate for CASTE verification',6,25.00,TRUE,'2025-09-07');
#Error Code: 1048. Column 'Certificate_name' cannot be null
INSERT INTO certificate_Application VALUES(1007,107,'Income Certificate','2026-07-07','Income Documentation','Approved',30.00,'GP20260001');
#Error Code: 1062. Duplicate entry 'GP20260001' for key 'certificate_application.Reference_number'
show tables;