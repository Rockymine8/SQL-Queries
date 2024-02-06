USE SAMPLEDB
GO


--challenge 1
CREATE TABLE dbo.dept 
(
    dept_id INT IDENTITY(1,1),
    dept_name VARCHAR(50) NOT NULL
    CONSTRAINT PK_dept_dept_id PRIMARY KEY (dept_id)
);

--challenge 2
INSERT INTO dept(dept_name)
    VALUES ('Business Intelligence');

--Challenge 3
INSERT INTO dept(dept_name)
SELECT department_name
FROM hcm.departments

--Challenge 4
CREATE TABLE dbo.emp
(
    emp_id INT IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hire_date DATE NOT NULL,
    dept_id INT,
    CONSTRAINT PK_emp_emp_id PRIMARY KEY (emp_id),
	CONSTRAINT fk_emp_dept_id FOREIGN KEY (dept_id) REFERENCES dbo.dept (dept_id)    
);

--Challenge 5
INSERT INTO emp(first_name, last_name, hire_date, dept_id)
    VALUES ('Scott', 'Davis', '20201211', 1),   
           ('Miriam', 'Yardley', '20201205', 1)

select *
from emp;

