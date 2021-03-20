DROP DATABASE IF EXISTS tracker_db;

CREATE DATABASE tracker_db;

USE tracker_db;

CREATE TABLE employees (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name INTEGER (100) NOT NULL,
  title VARCHAR(100),
  department VARCHAR(100) NOT NULL,
  salary INT,
  manager VARCHAR (100) NOT NULL,
  PRIMARY KEY (id)
);

SELECT * FROM employees;

CREATE TABLE departments (
  id INT NOT NULL AUTO_INCREMENT,
  department varchar (100) NOT NULL,
  employees VARCHAR(100) NOT NULL,
  budget INTEGER (100) NOT NULL,
  manager VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE managers (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name INTEGER (100) NOT NULL,
  department VARCHAR(100) NOT NULL,
  salary INT (20),
  PRIMARY KEY (id)
);