USE UpLiftFit

 DROP TABLE Employees
 DROP TABLE Clients
 DROP TABLE PackageType
 DROP TABLE ClientArea
 DROP TABLE TrainingSession
 DROP TABLE TrainerArea
 DROP TABLE Trainer

CREATE TABLE Employees (
    EmployeeID int identity (1,1) PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Address VARCHAR(50),
    Gender varchar(1) check (Gender in ('F','M','O')),
    DateOfBirth DATE,
	EmployeePosition varchar(30) check (EmployeePosition in ('Trainer','Marketing','Sales','Admin','Help Desk')),
	EmployeeContract varchar(10) check (EmployeeContract in ('Full Time','Casual','Part Time'))
)

INSERT INTO Employees VALUES
('George','Russell', '123 Maple Street', 'M', '1995-02-19','Trainer','Part Time'),
('Lewis','Hamilton','456 Avalon Drive', 'M' , '1989-04-09','Trainer','Full Time'),
('Jamie','Chadwick','212 Dowing Street','F','1999-04-19','Trainer','Part Time'),
('James', 'Johnson', '567 Birch Lane', 'M', '1987-09-25','Trainer','Casual'),
('Sophia', 'Williams', '321 Elm Street', 'F', '1993-11-12','Trainer','Part Time'),
('Natasha','Fernando','934 Pragma Rise', 'F', '1998-08-17','Admin','Full Time'),
('John','Cena','268 Mount Road', 'O','1985-02-20','Help Desk','Casual'),
('Alonso','Fernando','98 Cross Road','M','2000-01-04','Sales','Full Time'),
('Emma', 'Smith', '789 Oak Avenue', 'F', '1990-06-15','Admin','Full Time'),
('Michael', 'Brown', '101 Pine Road', 'M', '1983-03-30','Marketing','Full Time'),
('Olivia', 'Jones', '444 Cedar Court', 'F', '1988-07-22','Marketing','Casual'),
('Daniel', 'Garcia', '876 Walnut Drive', 'M', '1996-02-10','Admin','Full Time');


SELECT*FROM Employees


CREATE TABLE PackageType (
    PackageTypeID INT identity (1,1) PRIMARY KEY,
    PackageDetail VARCHAR(30)
)
INSERT INTO PackageType VALUES
('Weight Loss'),
('Weight Gain'),
('Muscle Building'),
('Yoga'),
('Strength Building');

SELECT*FROM PackageType

CREATE TABLE Clients (
    ClientID int identity (1,1) PRIMARY KEY,
    FirstName VARCHAR(10),
    LastName VARCHAR(10),
    Address VARCHAR(50),
    Gender char(1) check (Gender in ('F','M','O')),
    DateOfBirth DATE,
	PackageTypeID int FOREIGN KEY References PackageType(PackageTypeID),

)

INSERT INTO Clients VALUES
('Lance','Stroll','12 Elmo Street', 'M','1997-04-01',5),
('Emily', 'Martinez', '555 Maple Avenue', 'F', '1994-04-05',4),
('Alexander', 'Anderson', '777 Oak Street', 'M', '1991-08-20',2),
('Ava', 'Hernandez', '888 Birch Road', 'F', '1986-12-10',1),
('William', 'Gonzalez', '999 Elm Drive', 'M', '1984-05-18',1),
('Mia', 'Lopez', '111 Pine Lane', 'F', '1989-09-28',2),
('Ethan', 'Perez', '222 Cedar Avenue', 'M', '1995-03-15',5),
('Charlotte', 'Robinson', '333 Walnut Road', 'F', '1992-07-25',3),
('Liam', 'Taylor', '444 Maple Drive', 'M', '1988-11-05',3),
('Amelia', 'Clark', '666 Oak Lane', 'F', '1993-01-12',1),
('Benjamin', 'Lewis', '777 Birch Street', 'M', '1987-06-30',3),
('Harper', 'Walker', '888 Elm Avenue', 'F', '1990-10-22',4),
('Lucas', 'Hall', '999 Pine Road', 'M', '1985-04-08',5),
('Evelyn', 'Young', '121 Cedar Lane', 'F', '1996-02-18',4),
('Logan', 'Scott', '232 Walnut Street', 'M', '1983-08-15',1),
('Avery', 'King', '343 Maple Road', 'F', '1988-12-05',2);

SELECT*FROM ClientArea
SELECT*FROM PackageType
SELECT*FROM Clients


CREATE TABLE Trainer (
	TrainerID int identity (1,1) PRIMARY KEY,
	EmployeeID int FOREIGN KEY References Employees(EmployeeID),
	TrainingSpeciality VARCHAR (20)
)
INSERT INTO Trainer VALUES
(1,'Mens Training'),
(2,'Cardio'),
(3,'Womens Trainig'),
(4,'Yogo'),
(5,'Mens Training')

SELECT*FROM Trainer


CREATE TABLE ClientArea (
    ClientAreaID INT identity (1,1) PRIMARY KEY,
    City VARCHAR(20),
    Suburb VARCHAR(30),
	ClientID int FOREIGN KEY References Clients(ClientID)
)
INSERT INTO ClientArea VALUES
('Hamilton','Rototuna',1),
('Hamilton','Central',2),
('Hamilton', 'Nawton',5),
('Auckland', 'Mount Eden',7),
('Wellington', 'Te Aro',9),
('Wellington', 'Karori',3),
('Christchurch', 'Riccarton',4),
('Christchurch', 'Sumner',6),
('Dunedin', 'North Dunedin',8),
('Dunedin', 'St Clair',10),
('Tauranga', 'Papamoa',11),
('Tauranga', 'Mount Maunganui',12),
('Auckland', 'Papakura',13),
('Hamilton', 'Hamilton East',14),
('New Plymouth', 'Fitzroy',16),
('New Plymouth', 'Bell Block',15);

SELECT*FROM ClientArea
SELECT*FROM Clients
SELECT*FROM PackageType
SELECT*FROM Trainer

CREATE TABLE TrainingSession (
    TrainingSessionID INT identity (1,1) PRIMARY KEY,
    DatePlanned DATE,
    TimePlanned TIME,
	ClientID int FOREIGN KEY References Clients(ClientID),
	TrainerID int FOREIGN KEY References Trainer(TrainerID)
)

INSERT INTO TrainingSession VALUES
('2024-05-18','16:00',5,2),
('2024-05-18','10:00',4,3),
('2024-05-18','18:00',3,1),
('2024-05-19','10:00',10,3),
('2024-05-19','10:00',13,2),
('2024-05-19','14:00',15,1),
('2024-05-20','10:30',9,1),
('2024-05-20','12:00',10,4);

SELECT*FROM TrainingSession


CREATE TABLE TrainerArea (
    TrainerAreaID INT identity (1,1) PRIMARY KEY,
    City VARCHAR(20),
    Suburb VARCHAR(30),
	TrainerID int FOREIGN KEY References Trainer(TrainerID)
)
INSERT INTO TrainerArea VALUES
('Tauranga', 'Papamoa',2),
('Tauranga', 'Mount Maunganui',3),
('Auckland', 'Papakura',1),
('Hamilton', 'Hamilton East',4),
('New Plymouth', 'Fitzroy',5);
 
 SELECT*FROM TrainerArea


SELECT*FROM Employees
SELECT*FROM Clients
SELECT*FROM PackageType
SELECT*FROM ClientArea
SELECT*FROM TrainingSession
SELECT*FROM TrainerArea
SELECT*FROM Trainer