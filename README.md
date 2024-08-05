# adapostAnimale
-- DDL -> cream baza de date
CREATE DATABASE adapostAnimale;

USE adapostAnimale;

CREATE TABLE Animalute (
	AnimalutID INT PRIMARY KEY,
    Specie VARCHAR(50),
    Varsta INT,
    Rasa VARCHAR(100),
    Gen VARCHAR(10),
    AdapostID INT,
    Nume VARCHAR(100)
);

CREATE TABLE Adaposturi (
	AdapostID INT PRIMARY KEY,
    NumeAdapost VARCHAR(100),
    Locatie VARCHAR(100)
);

-- DDL -> ALTER TABLE -> adaugam un foreign key foreignkey_shelter in tabelul Pets -> legam intre ele tabelele Pets si Shelters
ALTER TABLE Animalute
ADD CONSTRAINT foreignkey_adapost
FOREIGN KEY (AdapostID) REFERENCES Adaposturi(AdapostID);

-- cream tabela Stapani 
create table Stapani (
	StapanID INT PRIMARY KEY,
    NumeStapan VARCHAR(100),
    ContactInfo VARCHAR(100)
); 

-- cream tabela Adoptii
create table Adoptii (
	AdoptieID INT PRIMARY KEY,
    AnimalutID INT,
    StapanID INT,
    DataAdoptie DATE,
    FOREIGN KEY (AnimalutID) REFERENCES Animalute(AnimalutID),
    FOREIGN KEY (StapanID) REFERENCES Stapani(StapanID)
);

-- cream tabela OrarPreluari
create table OrarPreluari (
	OrarID INT PRIMARY KEY,
    AdoptieID INT,
    DataPreluare DATE,
    FOREIGN KEY (AdoptieID) REFERENCES Adoptii(AdoptieID)
);

-- DML -> inseram un adapost
INSERT INTO Adaposturi (AdapostID, NumeAdapost, Locatie)
VALUES (1, 'Happy Paws', 'Arad');

-- DML -> inseram alte 3 adaposturi
INSERT INTO Adaposturi (AdapostID, NumeAdapost, Locatie)
VALUES 
	(2, 'Fluffy Friends', 'Oradea'),
	(3, 'Furry Tails', 'Timisoara'),
    (4, 'Paw Prints' , 'Cluj');
    
-- DML -> stergem un adapost
DELETE FROM Adaposturi WHERE AdapostID = 4;

-- DML -> inseram un  animalut
INSERT INTO Animalute (AnimalutID, Specie, Varsta, Rasa, Gen, AdapostID)
VALUES (1, 'Pisica', 2, 'British Shorthair', 'Masculin', 1);

-- DML -> updatam animalutul cu ID 1 adaugand si un nume pentru acesta
UPDATE Animalute
SET Nume = 'Rocky'
WHERE AnimalutID = 1;
 
-- DML -> mai inseram 5 animalute
INSERT INTO Animalute (AnimalutID, Specie, Varsta, Rasa, Gen, AdapostID, Nume)
VALUES 
	(2, 'Caine', 1, 'Ciobanesc', 'Masculin', 2, 'Rex'),
    (3, 'Caine', 10, 'Fara rasa specifica', 'Masculin', 3, 'Bob'),
    (4, 'Pisica', 2, 'Tabby Mix', 'Feminin', 3, 'Luna'),
    (5, 'Caine', 4, 'Labrador', 'Feminin', 2, 'Nala'),
    (6, 'Pisica', 1, 'Tuxedo Mix', 'Masculin', 1, 'Leo'),
    (7, 'Pisica', 2, 'Calico Mix', 'Feminin', 2, 'Tigruta');

-- inseram mai multi stapani
INSERT INTO Stapani (StapanID, NumeStapan, ContactInfo)
VALUES 
	(1, 'George', '0755.190.190'),
	(2, 'Laurentiu', '0740.123.123'),
    (3, 'Andrei', '0741.234.234'),
    (4, 'Izabela', '0732.456.456'),
    (5, 'Lorena', '0753.678.678');
    
-- inseram mai multe adoptii
INSERT INTO Adoptii (AdoptieID, AnimalutID, StapanID, DataAdoptie)
VALUES 
	(1, 1, 1, '2024-10-10'),
	(2, 2, 5, '2024-09-01'),
    (3, 6, 4, '2024-08-12'),
    (4, 3, 3, '2024-09-03'),
    (5, 5, 2, '2024-08-24');
    
-- inseram cateva preluari
INSERT INTO OrarPreluari(OrarID, AdoptieID, DataPreluare)
VALUES 
(1, 1, '2024-10-11'),
(2, 2, '2024-09-01'),
(3, 3, '2024-08-20'),
(4, 4, '2024-09-15');

-- facem select sa vedem arata datele din tabelele
SELECT * FROM Adaposturi;
SELECT * FROM Animalute;
SELECT * FROM Stapani; 
select * from Adoptii;
select * from Animalute;

-- facem un inner join - inner join intre "Animalute" si "Adoptii"
-- explicatie: acest join returneaza doar recordurile/inregistrarile in care exista o potrivire intre tabelele "Animalute" si "Adoptii" pe baza AnimalutID

SELECT Animalute.AnimalutID, Animalute.Specie, Adoptii.DataAdoptie
FROM Animalute
INNER JOIN Adoptii ON Animalute.AnimalutID = Adoptii.AnimalutID;

-- facem un left join - left join intre "Animalute" si "Adaposturi"
-- acest join va lista toate animalutele impreuna cu informatia despre adaposturile lor, 
-- ... incluzand si animalutele care in acest moment nu se afla intr-un adapost
-- explicatie: acest join returneaza toate inregistrarile din tabela "Animalute" si inregistrarile corespunzatoare din tabela "Adaposturi"
-- daca pentru un anumit AnimalutID din tabela Animalute nu exista o inregistrare corespunzatoare in tabela Adaposturi(o potrivire pe baza AdaposturiID)
-- ... ,campurile din tabela Adaposturi vor avea in rezultatul final valoarea NULL - acestea sunt afisate in partea dreapta

SELECT Animalute.AnimalutID, Animalute.Specie, Adaposturi.NumeAdapost
FROM Animalute
LEFT JOIN Adaposturi ON Animalute.AdapostID = Adaposturi.AdapostID;

-- facem un right join - right join intre "Adoptii" si "Stapani"
-- listam toate adoptiile cu informatie despre stapan, incluzand adoptiile unde informatia despre stapan ar putea sa lipseasca
-- explicatie: acest join returneaza toate inregistrarile din tabela Stapani si inregistrarile corespunzatoare din tabela Adoptii
-- ... rezultatul afisat in partea stanga va contine NULL  daca nu exista o potrivire (adica nu exista o potrivire pe baza StapanID)

SELECT Adoptii.AdoptieID, Adoptii.AnimalutID, Stapani.NumeStapan
FROM Adoptii
RIGHT JOIN Stapani ON Adoptii.StapanID = Stapani.StapanID;

-- cross join - cross join intre tabelele "Animalute" si "Adaposturi"
-- generam un produs Cartesian al animalutelor si animalelor
-- explicatie: acest join returneaza un produs Cartesian al celor doua tabele 
-- ... adica, fiecare rand din tabela "Animalute" este combinat cu toate randurile din tabela "Adaposturi"
-- .. rezultatul include toate combinatiile posibile dintre randurile celor doua tabele

SELECT Animalute.AnimalutID, Adaposturi.AdapostID
FROM Animalute
CROSS JOIN Adaposturi;

-- Subquery
-- obiectiv: sa gasim numele stapanilor care au adoptat cel putin un animalut
-- subquery-ul numara cate animalute a adoptat fiecare stapan
-- explicatie: Subquery-ul: '(SELECT StapanID FROM Adoptii)' obtine ID-urile stapanilor care au adoptat animalute 
-- ... selectand "StapanID" din tabela "Adoptii", care da o lista cu ID-urile stapanilor care au adoptat animalute
-- explicatie... Main Query-ul: foloseste rezultatul Subquery-ului pentru a lista numele proprietarilor care au fost implicati in cel putin o adoptie 
-- ...- selectand "NumeStapan" din tabela "Stapani" pentru acele ID-uri de stapani care exista in lista obtinuta de subquery

SELECT NumeStapan
FROM Stapani
WHERE StapanID IN (
	SELECT StapanID
    FROM Adoptii
);

-- Select all - selecteaza toate animalutele
SELECT * FROM Animalute;

-- Selectarea unor coloane specifice din tabela Animalute
SELECT AnimalutID, Specie, Nume FROM Animalute;

-- Filtrade cu WHERE - returneaza toate animalutele de specie pisica
SELECT * FROM Animalute
WHERE Specie = 'Pisica';

-- Filtrare cu LIKE - returneaza toate animalutele al caror nume incepe cu T
SELECT * FROM Animalute
WHERE Nume LIKE 'T%';

-- Filtrare cu AND si OR - returneaza toate animalutele pentru care specia este pisica si varsta e mai mica decat 2, sau pentru care specia este caine si varsta este mai mare de 5
SELECT * FROM Animalute
WHERE (Specie = 'Pisica' AND Varsta < 2)
OR (Specie = 'Caine' AND Varsta > 5);

-- Functie Agregata COUNT numara cate animalute sunt in total, numarand cate randuri sunt
SELECT COUNT(*) AS TotalAnimalute FROM Animalute;

-- Functie Agregata care calculeaza media de varsta
SELECT AVG(Varsta) AS MediaVarstei FROM Animalute;

-- Filtrare pe functie agregata alter
-- explicatie: GROUP BY grupeaza inregistrarile dupa ShelterID
-- COUNT(*) calculeaza numarul de pisici per adapost
-- iar HAVING filtreaza grupurile pe baza valorii agregate (2 in cazul nostru)
SELECT AdapostID, COUNT(*) AS NumarAnimalute
FROM Animalute 
GROUP BY AdapostID
HAVING COUNT(*) > 2;

-- Limit - selecteaza numarul de randur afisate din tabela Animalute
SELECT * FROM Animalute
LIMIT 5;

-- Order By - aranjeaza aici animalutele dupa varsta in ordine crescatoare
SELECT * FROM Animalute
ORDER BY Varsta ASC;
