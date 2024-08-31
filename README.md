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
```sql
CREATE DATABASE adapostAnimale;
```


## Exemple de interogări
### 1. Listarea tuturor animalelor adoptate și data adopției:
```sql
SELECT Animalute.AnimalutID, Animalute.Specie, Adoptii.DataAdoptie
FROM Animalute
INNER JOIN Adoptii ON Animalute.AnimalutID = Adoptii.AnimalutID;
