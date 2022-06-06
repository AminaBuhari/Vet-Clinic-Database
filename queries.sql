/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM Animals WHERE name LIKE '%mon'; /*Find all Animals whose name ends in "mon".*/
SELECT name FROM Animals WHERE date_of_birth BETWEEN '2016-01-10' AND '2019-01-01' /*List the name of all Animals born between 2016 and 2019.*/
SELECT name FROM Animals WHERE neutered='t' AND escape_attempts < 3; /*List the name of all Animals that are neutered and have less than 3 escape attempts.*/
SELECT date_of_birth from Animals WHERE name='Agumon' OR name ='Pikachu'; /* List date of birth of all Animals named either "Agumon" or "Pikachu".*/
SELECT name,escape_attempts FROM Animals WHERE weight_kg > 10.5; /* List name and escape attempts of Animals that weigh more than 10.5kg */
SELECT * FROM Animals WHERE neutered = 't'; /* Find all Animals that are neutered.*/
SELECT * FROM Animals WHERE  NOT name='Gabumon'; /* Find all Animals not named Gabumon.*/
SELECT * FROM Animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3; /* Find all Animals with a weight between 10.4kg and 17.3kg (including the Animals with the weights that equals precisely 10.4kg or 17.3kg)*/


BEGIN; -- start transaction
UPDATE Animals
SET species = 'unspecified'; -- make change
SELECT species from animals; -- verify that change was made
ROLLBACK;
SELECT species from animals; -- verify that change went back to the previous state; 


BEGIN;
UPDATE Animals SET species='digimon' WHERE name LIKE '%mon';
UPDATE Animals SET species='pokemon' WHERE species IS NULL;
COMMIT;

/*
Now, take a deep breath and... Inside a transaction delete all records in the Animals table, then roll back the transaction.
*/
BEGIN;
TRUNCATE    Animals;
DELETE FROM Animals;
SELECT * FROM Animals; /* Check Whether table is now Empty*/
ROLLBACK;

/*
    Inside a transaction:
        Delete all Animals born after Jan 1st, 2022.
        Create a savepoint for the transaction.
        Update all Animals' weight to be their weight multiplied by -1.
        Rollback to the savepoint
        Update all Animals' weights that are negative to be their weight multiplied by -1.
        Commit transaction
*/

BEGIN;
DELETE FROM Animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT born_before_2022;
UPDATE Animals SET weight_kg = (weight_kg * -1);
ROLLBACK TO born_before_2022;
UPDATE Animals SET weight_kg = (weight_kg * -1) WHERE weight_kg < 0;
SELECT  * FROM Animals; /* Verify data state */
COMMIT;

/* How many Animals are there?*/
SELECT COUNT(*)  FROM Animals; 

/* How many Animals have never tried to escape?*/
SELECT COUNT(*)  FROM Animals WHERE escape_attempts > 0; 

/* What is the average weight of Animals?*/
SELECT AVG(weight_kg) FROM Animals; 

 /* Who escapes the most, neutered or not neutered Animals?*/
SELECT MAX(escape_attempts) FROM Animals WHERE (neutered='t') OR (neutered ='f');

/* What is the minimum and maximum weight of each type of animal?*/
SELECT species,MIN(weight_kg), MAX(weight_kg) FROM Animals GROUP BY species; 

/* What is the average number of escape attempts per animal type of those born between 1990 and 2000?*/
SELECT species, AVG(escape_attempts) FROM Animals WHERE date_of_birth > '1990-01-01' AND date_of_birth < '2000-01-01' GROUP BY species;

-- What animals belong to Melody Pond?
SELECT owner_id, animals.name, owners.id, owners.full_name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE owners.id = 4; 

-- List of all animals that are pokemon (their type is Pokemon).
SELECT species_id, animals.name, species.id, species.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.id = 1;

-- Answer
species_id |    name    | id |  name
------------+------------+----+---------
          1 | Pikachu    |  1 | Pokemon
          1 | Charmander |  1 | Pokemon
          1 | Squirtle   |  1 | Pokemon
          1 | Blossom    |  1 | Pokemon



-- List all owners and their animals, remember to include those that don't own any animal.

SELECT * FROM owners LEFT JOIN animals ON owners.id = animals.owner_id;

-- List all owners and their animals, remember to include those that don't own any animal.

SELECT species_id, COUNT (animals.species_id) FROM animals GROUP BY animals.species_id; 

-- List all Digimon owned by Jennifer Orwell.
SELECT * FROM (SELECT animals.name, animals.species_id, animals.owner_id, species.name FROM animals INNER JOIN species ON species_id = species.id) as animalsAndspecies INNER JOIN owners ON owner_id = owners.id WHERE owner_id = 2 AND species_id = 2;

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT owner_id, animals.name, owners.id, owners.full_name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE owners.id = 5 AND animals.escape_attempts = 0; 

-- Who owns the most animals?
SELECT MAX(COUNT) FROM (SELECT COUNT (*) FROM animals INNER JOIN owners ON owner_id = owners.id) AS animalsAndowners GROUP BY animals.owner_id ORDER BY count; 



SELECT owner_id, COUNT(*) FROM (SELECT * FROM animals INNER JOIN owners ON owner_id = owners.id) as animalsAndowners GROUP BY owner_id ORDER BY count asc;

/*Last animal seen by William Thatcher*/
SELECT vets.name, Visits.specie_name, Visits.date_of_visit FROM 
    (SELECT id, name as specie_name, vet_id, date_of_visit FROM animals 
    INNER JOIN visits
    ON animals.id = animal_id) as Visits
    INNER JOIN vets
    ON vet_id = vets.id
    WHERE vet_id = 1
    ORDER BY date_of_visit desc
    LIMIT 1;

/*number of animals seen by Stephanie Mendez*/
SELECT vets.name, COUNT(*) FROM
    (SELECT id, animals.name, vet_id FROM animals 
    INNER JOIN visits
    ON animals.id = animal_id) as Visits
    INNER JOIN vets
    ON vet_id = vets.id
    WHERE vet_id = 3
    GROUP BY vets.name;

/*All vets and their specialties*/
SELECT species.name, vets_name FROM (SELECT name as vets_name, id, specialization_id, vet_id FROM vets LEFT JOIN specializations
    ON vets.id = vet_id) as SPECIALIZATION
    LEFT JOIN species
    ON species.id = specialization_id;

/*All animals that visited Stephanie Mendez between April 1st and August 30th, 2020*/
SELECT Visited.animal_name, Visited.date_of_visit FROM 
    (SELECT id, name as animal_name, vet_id, date_of_visit FROM animals 
    INNER JOIN visits
    ON animals.id = animal_id) as Visited
    INNER JOIN vets
    ON vet_id = vets.id
    WHERE vet_id = 3 AND date_of_visit BETWEEN '2020-04-01' and '2020-08-30';


/*What animal has the most vet visits*/
SELECT name, COUNT(*) FROM animals JOIN visits ON animal_id = animals.id GROUP BY name ORDER BY COUNT(*) DESC LIMIT 1;
    
/*Maisy Smith's first visit*/
SELECT vets.name, visits.date_of_visit, animals.name as animal_name FROM animals 
JOIN visits  ON animals.id = animal_id 
JOIN vets ON vet_id = vets.id  WHERE vet_id = 2
ORDER BY date_of_visit
LIMIT 1;

/*Details for most recent visit of each animal*/
SELECT animal_name, visit_date, name as vet_name, age FROM
    (SELECT id, animal_name, visit_date, date_of_birth, escape_attempts, neutered, weight_kg, vet_id FROM
    (SELECT id, max as visit_date, animals.name as animal_name, date_of_birth, escape_attempts, neutered, weight_kg FROM
    (SELECT animal_id, MAX(date_of_visit) FROM animals
    JOIN visits
    ON animals.id = animal_id
    GROUP BY animal_id) as VISITS
    JOIN animals
    ON animals.id = animal_id) as ANIMAL
     JOIN visits
    ON visit_date = date_of_visit) as VETID
     JOIN vets
    ON vet_id = vets.id;

/*Number of non-specialized visits*/
SELECT COUNT(*) as non_specialized_visits FROM
    (SELECT species_id, animal_id,  vet_id, date_of_visit FROM
    (SELECT species_id, animals.id as animals_id FROM animals
    JOIN species
    ON species.id = species_id) as Animalspec
    JOIN visits
    ON visits.animal_id = animals_id) as Visited
    LEFT JOIN specializations
    ON specializations.vet_id = Visited.vet_id
    WHERE specialization_id != species_id OR specialization_id IS NULL;

/*What species Maisy Smith gets the most*/
SELECT name, count FROM
    (SELECT species_id, COUNT(*) FROM
    (SELECT species_id, animal_id, vet_id date_of_visit FROM
    (SELECT species_id, animals.id as animals_id FROM animals
    JOIN species
    ON species.id = species_id) as SPECIES
    JOIN visits
    ON visits.animal_id = animals_id
    WHERE vet_id = 2) as Visited
    GROUP BY species_id
    ORDER BY species_id desc
    LIMIT 1) as maxnumber
    JOIN species
    ON species.id = species_id;

    -- The following queries are taking too much time (1 sec = 1000ms can be considered as too much time for database query). Try them on your machine to confirm it: use explain analyze
    
explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';

-- Improve execution time of the other two queries.
CREATE INDEX email_asc ON owners(email ASC);
CREATE INDEX vet_id_asc ON visits(vet_id ASC);
CREATE INDEX animal_id_asc ON visits(animal_id ASC);

-- Rerun test

explain analyze SELECT COUNT(*) FROM visits where animal_id = 4;
explain analyze SELECT * FROM visits where vet_id = 2;
explain analyze SELECT * FROM owners where email = 'owner_18327@mail.com';
