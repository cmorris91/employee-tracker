DROP DATABASE IF EXISTS tracker_db;

CREATE DATABASE tracker_db;

USE tracker_db;

CREATE TABLE employees (
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name INTEGER (10) NOT NULL,
  manager VARCHAR (50) NOT NULL,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);



CREATE TABLE departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  departments VARCHAR(100) NOT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE roles (
  role_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary INT (20),
  PRIMARY KEY (role_id)
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);