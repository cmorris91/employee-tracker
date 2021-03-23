DROP DATABASE IF EXISTS tracker_db;

CREATE DATABASE tracker_db;

USE tracker_db;

CREATE TABLE employees (
  employee_id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR  (10) NOT NULL,
  manager VARCHAR (50),
  role_id INT,
  PRIMARY KEY (employee_id),
  FOREIGN KEY (role_id) REFERENCES roles(role_id)
);


INSERT INTO employees(first_name, last_name, manager, role_id)
VALUES ("Michael","Browning","Kim Yung", 1),
				("Colleen","Finazzo","Kim Yung", 2),
        ("Selena", "Mendez", "Kim Yung", 2),
        ("John", "Dupree", "Kim Yung", 2),
        ("Tim", "Morse", "Kim Yung", 3),
        ("Abrielle", "Sanders", "Sandra Somerville", 5),
				("Jeffrey", "Blane", "Sandra  Somerville", 6),
			("Rebecca", "Morris", "Sandra Somerville", 6),
			("Ronald", "Brewster", "Sandra Somerville", 7),
			("Shawn", "Sanders", "Chris Guitierrez",9),
			("Tiffany", "Hatcher", "Chris Guitierrez", 10),
			("Louis", "Reiner", "Chris Guitierrez",10),
			("Jayben", "Lee", "Chris Guitierrez",10),	
			("Staphanie", "Barboza", "Chris Guitierrez", 11),
			("Alexis", "Hayword", "Richard Gilmore", 13),
			("Dean", "Mitchell", "Richard Gilmore",14),
			("Ian", "Moore", "Richard Gilmore", 14),
			("Jamal", "Peters", "Richard Gilmore", 15),
			("Tahir", "Lang", "Emily Packer", 17),
			("Chelsea", "Smith", "Emily Packer", 18),
			("Samuel", "Singh", "Emily Packer", 18),
			("Jesse", "Wong", "Emily Packer", 19);
      ("Kim", "Yung", null, 4),
      ("Sandra", "Somerville", null, 8),
      ("Chris", "Guitierrez", null, 12),
      ("Richard", "Gilmore", null, 16),
      ("Emily", "Packer", null, 20);
		


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

INSERT INTO roles (title, salary, department_id)
VALUES ("Sales Lead", 65000, 1),
				("Sales Rep", 55000,1),
        ("Sales Administrator", 45000),1,
        ("Sales Manager", 75000,1),
        ("Design Lead", 65000,4),
        ("Designer", 55000,4),
        ("Design Administrator", 45000,4),
        ("Design Manager", 75000,4),
        ("Finance Lead", 65000,3),
        ("Finance Associate", 55000,3),
        ("Finance Administrator", 45000,3),
        ("Finance Manager", 75000,3)
        ("Legal Executive Lead", 85000,5),
        ("Legal Rep", 75000,5),
        ("Legal Admin", 55000, 5),
        ("Legal Executive Manager", 95000, 5),
        ("Engineer Team Lead", 70000, 2),
        ("Software Engineer", 65000, 2),
        ("Engineering Administrator", 55000 ,2),
        ("Engineering Manager", 75000, 2);
        
                
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM roles;