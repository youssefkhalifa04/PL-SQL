-- Création de la table EMP
CREATE TABLE EMP (
    Matricule INT PRIMARY KEY,
    NomE VARCHAR(50),
    Poste VARCHAR(50),
    DateEmb DATE,
    Salaire DECIMAL(10, 2),
    Comm DECIMAL(10, 2),
    NumDept INT
);

-- Création de la table DEPT
CREATE TABLE DEPT (
    NumDept INT PRIMARY KEY,
    NomDept VARCHAR(50),
    Lieu VARCHAR(50),
    Directeur INT 
);
alter table dept 
add constarint fk_directeur foreign key (Directeur) references EMP(Matricule);
-- Création de la table PROJET
CREATE TABLE PROJET (
    CodeP VARCHAR(10) PRIMARY KEY,
    NomP VARCHAR(100)
);

-- Création de la table PARTICIPATION
CREATE TABLE PARTICIPATION (
    Matricule INT,
    CodeP VARCHAR(10),
    Fonction VARCHAR(50),
    PRIMARY KEY (Matricule, CodeP),
    FOREIGN KEY (Matricule) REFERENCES EMP(Matricule),
    FOREIGN KEY (CodeP) REFERENCES PROJET(CodeP)
);
-- Insertion des données dans EMP
INSERT INTO EMP (Matricule, NomE, Poste, DateEmb, Salaire, Comm, NumDept)
VALUES 
(101, 'Ali', 'Analyste', '2022-05-01', 4000, 200, 1),
(102, 'Samir', 'Développeur', '2021-03-15', 3000, 150, 2),
(103, 'Yasmine', 'Chef de projet', '2020-10-10', 5000, 300, 3);

-- Insertion des données dans DEPT
INSERT INTO DEPT (NumDept, NomDept, Lieu, Directeur)
VALUES 
(1, 'Informatique', 'Paris', 201),
(2, 'RH', 'Lyon', 202),
(3, 'Finances', 'Marseille', 203);

-- Insertion des données dans PROJET
INSERT INTO PROJET (CodeP, NomP)
VALUES 
('P001', 'Migration Système'),
('P002', 'Développement Mobile'),
('P003', 'Audit Financier');

-- Insertion des données dans PARTICIPATION
INSERT INTO PARTICIPATION (Matricule, CodeP, Fonction)
VALUES 
(101, 'P001', 'Développeur'),
(102, 'P002', 'Analyste'),
(103, 'P003', 'Responsable');


select * from EMP ; 
select * from DEPT ; 
select * from PROJET ; 
select * from PARTICIPATION ;