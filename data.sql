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