/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM Animals WHERE name LIKE '%mon'; /*Find all Animals whose name ends in "mon".*/
SELECT name FROM Animals WHERE date_of_birth BETWEEN '2016-01-10' AND '2019-01-01' /*List the name of all Animals born between 2016 and 2019.*/
SELECT name FROM Animals WHERE neutered='t' AND escape_attempts < 3; /*List the name of all Animals that are neutered and have less than 3 escape attempts.*/
SELECT date_of_birth from Animals WHERE name='Agumon' OR name ='Pikachu'; /* List date of birth of all Animals named either "Agumon" or "Pikachu".*/
SELECT name,escape_attempts FROM Animals WHERE weight_kg > 10.5; /* List name and escape attempts of Animals that weigh more than 10.5kg */
SELECT * FROM Animals WHERE neutered = 't'; /* Find all Animals that are neutered.*/
SELECT * FROM Animals WHERE  NOT name='Gabumon'; /* Find all Animals not named Gabumon.*/
SELECT * FROM Animals WHERE weight_kg >= 10.4 AND weight_kg <=17.3; /* Find all Animals with a weight between 10.4kg and 17.3kg (including the Animals with the weights that equals precisely 10.4kg or 17.3kg)*/




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
