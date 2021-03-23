DROP DATABASE IF EXISTS tracker_db;

CREATE DATABASE tracker_db;

USE tracker_db;

CREATE TABLE employees (
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR  (10) NOT NULL,
  manager VARCHAR (50) NOT NULL,
  role_id INT,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


INSERT INTO employees(first_name, last_name, manager)
VALUES ( "Michael","Browning","Kim Yung"),
				("Colleen","Finazzo","Kim Yung"),
                ("Selena", "Mendez", "Kim Yung"),
                ("John", "Dupree", "Kim Yung"),
                ("Tim", "Morse", "Kim Yung"),
                ("Abrielle", "Sanders", "Sandra Somerville"),
				("Jeffrey", "Blane", "Sandra  Somerville"),
			("Rebecca", "Morris", "Sandra Somerville"),
			("Ronald", "Brewster", "Sandra Somerville"),
			("Shawn", "Sanders", "Chris Guitierrez"),
			("Tiffany", "Hatcher", "Chris Guitierrez"),
			("Louis", "Reiner", "Chris Guitierrez"),
			("Jayben", "Lee", "Chris Guitierrez"),	
			("Staphanie", "Barboza", "Chris Guitierrez"),
			("Alexis", "Hayword", "Richard Gilmore"),
			("Dean", "Mitchell", "Richard Gilmore"),
			("Ian", "Moore", "Richard Gilmore"),
			("Jamal", "Peters", "Richard Gilmore"),
			("Tahir", "Lang", "Emily Packer"),
			("Chelsea", "Smith", "Emily Packer"),
			("Samuel", "Singh", "Emily Packer"),
			("Jesse", "Wong", "Emily Packer");
		


CREATE TABLE departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  departments VARCHAR(100) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO departments (departments)	
VALUES ("Sales"),
			("Engineering"),
			("Finance"),
            ("Design"),
            ("Legal");
            
SELECT * FROM departments;

CREATE TABLE roles (
  role_id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  salary INT,
  department_id INT,
  PRIMARY KEY (role_id),
  FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO roles (title, salary)
VALUES ("Sales Lead", 65000),
				("Sales Rep", 55000),
                ("Sales Administrator", 45000),
                ("Sales Manager", 75000),
                ("Design Lead", 65000),
                ("Designer", 55000),
                ("Design Administrator", 45000),
                ("Design Manager", 75000),
                ("Finance Lead", 65000),
                ("Finance Associate", 55000),
                ("Finance Administrator", 45000),
                ("Legal Executive Lead", 85000),
                ("Legal Rep", 75000),
                ("Legal Admin", 55000),
                ("Legal Executive Manager", 95000),
                ("Engineer Team Lead", 70000),
                ("Software Engineer", 65000),
                ("Engineering Administrator", 55000),
                ("Engineering Manager", 75000);
                
                
SELECT * FROM employees;