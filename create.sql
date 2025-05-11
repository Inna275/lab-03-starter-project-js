CREATE SCHEMA IF NOT EXISTS db;

CREATE TABLE IF NOT EXISTS db.role (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL UNIQUE,
    description TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS db.user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    email VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL,
    role_id INT NOT NULL REFERENCES db.role (id) ON DELETE NO ACTION
);

CREATE TABLE IF NOT EXISTS db.project (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description TEXT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT NOW(),
    user_id INT NOT NULL REFERENCES db.user (id) ON DELETE NO ACTION
);

INSERT INTO db.role (name, description)
VALUES ('User Role', 'description for User Role'),
       ('Tech Expert Role', 'description for Tech Expert Role'),
       ('Media Content Analyst Role', 'description for Media Content Analyst Role');

INSERT INTO db.user (name, email, password, role_id)
VALUES
    ('Mock user1', 'test1@test.com', '$2a$12$v.HK88e3zeXbJdQptStutOTyFBitIOdSlOxIfNeOcPey/ZKjtaWPm', 1),
    ('Mock user2', 'test2@test.com', '$2a$12$6IpiXsVmylfNzPBD29YbU.bchJr9IztZpYD/A9PrwUuIn4jEFQEd2', 1),
    ('Mock user3', 'test3@test.com', '$2a$12$363l0yY4Cxy3Gj.hr7D85OJmf0qkvd.tc0VIBxn4svkLazvsbBo3S', 1);

INSERT INTO db.project (name, description, user_id)
VALUES
    ('Project 1', '...', 1),
    ('Project 2', '...', 2),
    ('Project 3', '...', 3);