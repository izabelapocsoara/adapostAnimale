# Proiectul AdapostAnimale

## Descriere
Acest proiect reprezintă o bază de date pentru gestionarea unui adăpost de animale. Baza de date conține informații despre animale, adăposturi, stăpâni, adopții și preluări.  

## Structura bazei de date
Baza de date este formată din următoarele tabele:
- **Animalute**: Informații despre animalele din adăposturi.
- **Adaposturi**: Detalii despre adăposturile unde sunt găzduite animalele.
- **Stapani**: Informații despre stăpânii care adoptă animale.
- **Adoptii**: Detalii despre adopțiile animalelor.
- **OrarPreluari**: Programul de preluare al adopțiilor.

![schema_adapostAnimale](https://github.com/user-attachments/assets/c1e65ce5-c7ff-47fb-8d52-4de1bac286a3)

## Crearea bazei de date
Am creat baza de date adapostAnimale:
```sql
CREATE DATABASE adapostAnimale;
USE adapostAnimale;
```
## Crearea tabelelor principal
Am definit tabelele principale necesare pentru gestionarea informațiilor:  
#### Tabela Animalute
Această tabelă stochează informații despre animalele din adăposturi. Fiecare animal este identificat printr-un AnimalutID unic.
```sql
CREATE TABLE Animalute (
    AnimalutID INT PRIMARY KEY,
    Specie VARCHAR(50),
    Varsta INT,
    Rasa VARCHAR(100),
    Gen VARCHAR(10),
    AdapostID INT,
    Nume VARCHAR(100)
);
```

#### Tabela Adaposturi  
Această tabelă stochează informații despre adăposturi.  
```sql
CREATE TABLE Adaposturi (
	AdapostID INT PRIMARY KEY,
    NumeAdapost VARCHAR(100),
    Locatie VARCHAR(100)
);
```

## Adăugarea relațiilor între tabele
Am creat relații între tabele folosind chei externe (Foreign Keys) pentru a asigura integritatea datelor.   
Am legat tabelele Animalute și Adaposturi astfel încât fiecare animal să fie asociat cu un adăpost.
```sql
ALTER TABLE Animalute
ADD CONSTRAINT foreignkey_adapost
FOREIGN KEY (AdapostID) REFERENCES Adaposturi(AdapostID);
```
## Crearea urmatoarelor tabele
#### Tabela Stapani
Aceasta stochează informații despre stăpânii care adoptă animale.
```sql
CREATE TABLE Stapani (
    StapanID INT PRIMARY KEY,
    NumeStapan VARCHAR(100),
    ContactInfo VARCHAR(100)
);
```
#### Tabela Adoptii
Această tabelă înregistrează informații despre adopțiile animalelor.
```sql
CREATE TABLE Adoptii (
    AdoptieID INT PRIMARY KEY,
    AnimalutID INT,
    StapanID INT,
    DataAdoptie DATE,
    FOREIGN KEY (AnimalutID) REFERENCES Animalute(AnimalutID),
    FOREIGN KEY (StapanID) REFERENCES Stapani(StapanID)
);
```
#### Tabela OrarPreluari
Aceasta stochează informații despre preluările animalelor de către stăpâni după adopție.
```sql
CREATE TABLE OrarPreluari (
    OrarID INT PRIMARY KEY,
    AdoptieID INT,
    DataPreluare DATE,
    FOREIGN KEY (AdoptieID) REFERENCES Adoptii(AdoptieID)
);
```
## Popularea bazei de date cu date inițiale
Am populat tabelele cu date inițiale pentru a simula o situație reală.
#### Inserăm date în tabela Adaposturi:
```sql
INSERT INTO Adaposturi (AdapostID, NumeAdapost, Locatie)
VALUES
 (1, 'Happy Paws', 'Arad'),
 (2, 'Fluffy Friends', 'Oradea'),
 (3, 'Furry Tails', 'Timisoara'),
 (4, 'Paw Prints' , 'Cluj');
```
#### Inserăm date în tabela Animalute
```sql
INSERT INTO Animalute (AnimalutID, Specie, Varsta, Rasa, Gen, AdapostID, Nume)
VALUES
 (1, 'Pisica', 2, 'British Shorthair', 'Masculin', 1, 'Rocky'),
 (2, 'Caine', 1, 'Ciobanesc', 'Masculin', 2, 'Rex'),
 (3, 'Caine', 10, 'Fara rasa specifica', 'Masculin', 3, 'Bob'),
 (4, 'Pisica', 2, 'Tabby Mix', 'Feminin', 3, 'Luna'),
 (5, 'Caine', 4, 'Labrador', 'Feminin', 2, 'Nala'),
 (6, 'Pisica', 1, 'Tuxedo Mix', 'Masculin', 1, 'Leo'),
 (7, 'Pisica', 2, 'Calico Mix', 'Feminin', 2, 'Tigruta');
```
#### Inserăm date în tabela Stapani
```sql
INSERT INTO Stapani (StapanID, NumeStapan, ContactInfo)
VALUES 
 (1, 'George', '0755.190.190'),
 (2, 'Laurentiu', '0740.123.123'),
 (3, 'Andrei', '0741.234.234'),
 (4, 'Izabela', '0732.456.456'),
 (5, 'Lorena', '0753.678.678');
```
#### Inserăm date în tabela Adoptii
```sql
INSERT INTO Adoptii (AdoptieID, AnimalutID, StapanID, DataAdoptie)
VALUES 
 (1, 1, 1, '2024-10-10'),
 (2, 2, 5, '2024-09-01'),
 (3, 6, 4, '2024-08-12'),
 (4, 3, 3, '2024-09-03'),
 (5, 5, 2, '2024-08-24');
```
#### Inserăm date în tabela OrarPreluari
```sql
INSERT INTO OrarPreluari(OrarID, AdoptieID, DataPreluare)
VALUES 
 (1, 1, '2024-10-11'),
 (2, 2, '2024-09-01'),
 (3, 3, '2024-08-20'),
 (4, 4, '2024-09-15');
```
## Select-uri pentru a vedea cum arată tabelele din baza de date:

#### Tabela `Animalute`
```sql
SELECT * FROM Animalute;
```
| AnimalutID | Specie | Varsta | Rasa                | Gen     | AdapostID | Nume   |
|------------|--------|--------|---------------------|---------|-----------|--------|
| 1          | Pisica | 2      | British Shorthair   | Masculin| 1         | Rocky  |
| 2          | Caine  | 1      | Ciobanesc           | Masculin| 2         | Rex    |
| 3          | Caine  | 10     | Fara rasa specifica | Masculin| 3         | Bob    |
| 4          | Pisica | 2      | Tabby Mix           | Feminin | 3         | Luna   |
| 5          | Caine  | 4      | Labrador            | Feminin | 2         | Nala   |
| 6          | Pisica | 1      | Tuxedo Mix          | Masculin| 1         | Leo    |
| 7          | Pisica | 2      | Calico Mix          | Feminin | 2         | Tigruta|

#### Tabela `Adaposturi`
```sql
SELECT * FROM Adaposturi;
```
| AdapostID | NumeAdapost    | Locatie    |
|-----------|----------------|------------|
| 1         | Happy Paws     | Arad       |
| 2         | Fluffy Friends | Oradea     |
| 3         | Furry Tails    | Timisoara  |
| 4         | Paw Prints     | Cluj       |

#### Tabela `Stapani`
```sql
SELECT * FROM Stapani;
```
| StapanID | NumeStapan | ContactInfo  |
|----------|------------|--------------|
| 1        | George     | 0755.190.190 |
| 2        | Laurentiu  | 0740.123.123 |
| 3        | Andrei     | 0741.234.234 |
| 4        | Izabela    | 0732.456.456 |
| 5        | Lorena     | 0753.678.678 |

#### Tabela `Adoptii`
```sql
SELECT * FROM Adoptii;
```
| AdoptieID | AnimalutID | StapanID | DataAdoptie |
|-----------|------------|----------|-------------|
| 1         | 1          | 1        | 2024-10-10  |
| 2         | 2          | 5        | 2024-09-01  |
| 3         | 6          | 4        | 2024-08-12  |
| 4         | 3          | 3        | 2024-09-03  |
| 5         | 5          | 2        | 2024-08-24  |


#### Tabela `OrarPreluari`
```sql
SELECT * FROM OrarPreluari
```
| OrarID | AdoptieID | DataPreluare |
|--------|-----------|--------------|
| 1      | 1         | 2024-10-11   |
| 2      | 2         | 2024-09-01   |
| 3      | 3         | 2024-08-20   |
| 4      | 4         | 2024-09-15   |

## Operatiuni SQL

#### DELETE - ștergem un adăpost:
```sql
DELETE FROM Adaposturi WHERE AdapostID = 4;
```
#### UPDATE - facem update la numele unui animăluț:
```sql
UPDATE Animalute
SET Nume = 'RockyYY'
WHERE AnimalutID = 1;
```
#### WHERE - filtrare cu WHERE pentru a vedea câte pisici sunt:
```sql
SELECT * FROM Animalute
WHERE Specie = 'Pisica';
```
#### LIKE - filtrare care returnează toate animăluțele a căror nume începe cu litera T:
```sql
SELECT * FROM Animalute
WHERE Nume LIKE 'T%';
```
#### AND și OR - returnează toate animăluțele de specie pisică și vârsta mai mică de 2 ani, și toți câinii pentru care vârsta este mai mare de 5 ani:
```sql
SELECT * FROM Animalute
WHERE (Specie = 'Pisica' AND Varsta < 2)
OR (Specie = 'Caine' AND Varsta > 5);
```
#### LIMIT - afișează doar 5 rânduri din tabela Animaluțe:
```sql
SELECT * FROM Animalute
LIMIT 5;
```
#### Selectare coloane specifice:
```sql
SELECT AnimalutID, Specie, Nume FROM Animalute;
```
#### ORDER BY - această interogare aranjează animăluțele în ordine crescătoare după vârstă:
```sql
SELECT * FROM Animalute
ORDER BY Varsta ASC;
```
## Funcții agregate și filtrare pe funcții agregate
#### COUNT - această funcție agregată numără câte animăluțe sunt în total:
```sql
SELECT COUNT(*) AS TotalAnimalute FROM Animalute;
```
#### AVG - folosind această funcție agregată calculăm media de vârstă a animăluțelor:
```sql
SELECT AVG(Varsta) AS MediaVarstei FROM Animalute;
```
#### Filtrare pe funcția agregată COUNT folosind GROUP BY și HAVING: 
- GROUP BY grupează înregistrările după ShelterID
- COUNT(*) calculează numărul de pisici per adăpost
- HAVING filtrează grupurile pe baza valorii agregate (2 in cazul nostru)
```sql
SELECT AdapostID, COUNT(*) AS NumarAnimalute
FROM Animalute 
GROUP BY AdapostID
HAVING COUNT(*) > 2;
```
## JOIN-uri
#### INNER JOIN între "Animalute" si "Adoptii" - Acest join returnează doar înregistrările în care există o potrivire între tabelele "Animalute" și "Adoptii" pe baza AnimalutID:
```sql
SELECT Animalute.AnimalutID, Animalute.Specie, Adoptii.DataAdoptie
FROM Animalute
INNER JOIN Adoptii ON Animalute.AnimalutID = Adoptii.AnimalutID;
```
#### LEFT JOIN între "Animalute" si "Adaposturi" - acest join returnează toate înregistrările din tabela "Animalute" și înregistrările corespunzatoare din tabela "Adaposturi":
```sql
SELECT Animalute.AnimalutID, Animalute.Specie, Adaposturi.NumeAdapost
FROM Animalute
LEFT JOIN Adaposturi ON Animalute.AdapostID = Adaposturi.AdapostID;
```
#### RIGHT JOIN între "Adoptii" si "Stapani" - acest join returnează toate înregistrările din tabela Stapani si înregistrările corespunzatoare din tabela Adoptii, rezultatul afisat in partea stanga va contine NULL  daca nu exista o potrivire (adica nu exista o potrivire pe baza StapanID):
```sql
SELECT Adoptii.AdoptieID, Adoptii.AnimalutID, Stapani.NumeStapan
FROM Adoptii
RIGHT JOIN Stapani ON Adoptii.StapanID = Stapani.StapanID;
```
#### CROSS JOIN între tabelele "Animalute" si "Adaposturi" - acest join returneaza un produs Cartesian al celor doua tabele, adica, fiecare rand din tabela "Animalute" este combinat cu toate randurile din tabela "Adaposturi"
```sql
SELECT Animalute.AnimalutID, Adaposturi.AdapostID
FROM Animalute
CROSS JOIN Adaposturi;
```
## SUBQUERY - numară câte animăluțe a adoptat fiecare stăpân.
Subquery-ul '(SELECT StapanID FROM Adoptii)' obține ID-urile stăpânilor care au adoptat animăluțe selectând "StapanID" din tabela "Adoptii", care dă o listă cu ID-urile stăpânilor care au adoptat animaluțe.

Main Query-ul: folosește rezultatul Subquery-ului pentru a lista numele proprietarilor care au fost implicați în cel puțin o adopție selectând "NumeStapan" din tabela "Stapani" pentru acele ID-uri de stăpâni care există în lista obținută de subquery.
```sql
SELECT NumeStapan
FROM Stapani
WHERE StapanID IN (
	SELECT StapanID
    FROM Adoptii
);
```
