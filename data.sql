INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (1,'Agumon','2020-02-03',0,'t',10.23);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (2,'Gabumon','2018-11-15',2,'t',8);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (3,'Pikachu','2021-01-07',1,'f',15.02);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (4,'Devimon','2017-05-12',5,'t',11);

-- Update Database

INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (5,'Charmander','2020-02-08',0,'f',11);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (6,'Plantmon','2021-11-15',2,'t',5.7);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (7,'Squirtle','1993-04-02',3,'f',12.13);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (8,'Angemon','2005-06-12',1,'t',45);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (9,'Boarmon','2005-06-07',7,'t',20.4);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (10,'Blossom','1998-10-13',3,'t',17);
INSERT INTO animals (id, name,date_of_birth,escape_attempts,neutered,weight_kg) VALUES (11,'Ditto','2022-05-14',4,'t',22);

-- Update the owners table

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name,age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name,age) VALUES ('Bob', 45);
INSERT INTO owners (full_name,age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name,age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name,age) VALUES ('Jodie Whittaker', 38);


-- Update the species table

INSERT INTO owners (name) VALUES ('Pokemon');
INSERT INTO owners (name) VALUES ('Digimon');

-- Modify inserted animals so it includes species_id value: 

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id): 

UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name='Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


-- Populate vet table
INSERT INTO vets (name, age, date_of_graduation) VALUES('William Tatcher', 45, '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Maisy Smith', 26, '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES('Jack Harkness', 38, '2008-06-08');

-- Populate specialization table

INSERT INTO specializations (vet_id, specialization_id) VALUES(1, 1);
INSERT INTO specializations (vet_id, specialization_id) VALUES(3, 1);
INSERT INTO specializations (vet_id, specialization_id) VALUES(3, 2);
INSERT INTO specializations (vet_id, specialization_id) VALUES(4, 2);

-- Populate visit table; 
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(1, 1, '2020-05-24');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(3, 1, '2020-07-22');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(4, 2, '2021-02-02');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 3, '2020-01-05');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 3, '2020-03-08');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 3, '2020-05-14');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(3, 4, '2021-05-04');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(4, 5, '2021-02-24');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 6, '2019-12-21');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(1, 6, '2020-08-10');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 6, '2021-04-07');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(3, 7, '2019-09-29');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(4, 8, '2020-10-03');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(4, 8, '2020-11-04');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 9, '2019-01-24');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 9, '2019-05-15');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 9, '2020-02-27');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(2, 9, '2020-08-03');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(3, 10, '2020-05-24');
INSERT INTO visits (vet_id, animal_id, date_of_visit) VALUES(1, 10, '2021-01-11');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


