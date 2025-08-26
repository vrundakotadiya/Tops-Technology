CREATE DATABASE try;
USE try;

CREATE TABLE employees (
Employee_id INT AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR (100),
position VARCHAR (100), 
salary DECIMAL (10, 2), 
hire_date DATE
);

CREATE TABLE employee_audit (
audit_id INT AUTO_INCREMENT PRIMARY KEY,
employee_id INT,
name VARCHAR(100),
position VARCHAR (100), 
salary DECIMAL (10, 2), 
hire_date DATE,
action_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO employees (name, position, salary, hire_date) 
VALUES 
('John Doe','Software Engineer', 80000.00, '2022-01-15'),
('Jane Smith', 'Project Manager', 90000.00, '2021-05-22'),
('Alice Johnson', 'UX Designer', 75000.00, '2023-03-01'); 

select * from employees;
select * from employee_audit;

-- create a Trigger that will insert a record into the employee_audit table every time
-- a new employee is added to the employee’s table:
-- We have an employee’s table, and we want to create a stored procedure to add a
-- new employee and automatically log this action in an
-- employee_audit table. 

DELIMITER //
CREATE TRIGGER insert_data
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, name, position, salary, hire_date, action_date)
    VALUES (NEW.employee_id, NEW.name, NEW.position, NEW.salary, NEW.hire_date, now());
END;
//
DELIMITER ;

-- procedure
DELIMITER //
CREATE PROCEDURE add_employees (
    p_name varchar(100),
    p_position varchar(100),
    p_salary decimal (10,2),
    p_hire_date date
)
BEGIN
    INSERT INTO employees (name, position, salary, hire_date)
    values (p_name,p_position,p_salary,p_hire_date);
END;
//
DELIMITER ;

call add_employees('sam','data scientist',70000.00,'2024-02-04');

