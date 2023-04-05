--1)      Mostrar todos los datos de los empleados (tabla: employees) 
-- ordenados por apellido (last_name), cuyo nro de empleado (employee_id) > 10.1 
SELECT *
       FROM EMPLOYEES
       WHERE EMPLOYEE_ID > 10
       ORDER BY LAST_NAME;

--2)      Mostrar el apellido (last_name), nombre (first_name) y salario (salario) del empleado (tabla: employees) con apellido (last_name) llamado ‘Whalen’.
SELECT FIRST_NAME, LAST_NAME,SALARY 
       FROM EMPLOYEES 
       WHERE LAST_NAME = "Whalen";
       
--3 3)      Mostrar el nro de empleado (employee_id), apellido (last_name) y nombre (first_name) de todos los empleados (tabla: employees) utilizando el alias Apellido para la columna last_name y nombre para first_name (deben mostrarse de la misma manera, respetando mayúsculas y minúsculas) ordenando los datos por nro de empleado (employee_id) en forma descendente)
SELECT EMPLOYEE_ID, LAST_NAME AS Apellido,FIRST_NAME AS nombre 
       FROM EMPLOYEES 
       ORDER BY EMPLOYEE_ID DESC;

--4)   Mostrar el apellido (last_name) y nombre (first_name) en una
--   misma columna (asignar como alias Apellido y Nombre,
-- además de la fecha de ingreso (hire_date) de los empleados (tabla: employees)
-- ordenando los datos por salario (salary),
-- que se encuentran en el departamento (department_id) 100 0 120.

SELECT CONCAT(LAST_NAME,FIRST_NAME) "APELLIDO Y NOMBRE",HIRE_DATE
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (100,120)
ORDER BY SALARY 


--5 5)      Mostrar los empleados cuyo apellido comience con A.

 
SELECT LAST_NAME, FIRST_NAME
       FROM EMPLOYEES
       WHERE LAST_NAME LIKE 'A%'

--6 6)      Mostrar los apellidos (last_name) de los empleados (tabla: employees), en el caso de que haya 2 empleados con el mismo apellido (last_name) mostrar sólo una vez el mismo.
SELECT DISTINCT LAST_NAME 
       FROM EMPLOYEES;
       
--7 7)      Mostrar los datos del departamento (tabla: departments) denominado (department_name) IT
SELECT * 
       FROM DEPARTMENTS
       WHERE DEPARTMENT_NAME = 'IT';
       
--8 8)      Mostrar el nro. De empleado (employee_id), apellido (last_name) y nombre de los empleados cuyo salario (salary) no sea igual a $2500.
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME
       FROM EMPLOYEES
       WHERE SALARY != 2500;
       
--9 9)      Mostrar los nombres (department_name) de los departamentos (tabla: departments) que poseen un nro de departamento (department_id) comprendido entre 40 y 100.

 
SELECT DEPARTMENT_NAME
       FROM DEPARTMENTS
       WHERE DEPARTMENT_ID BETWEEN 40 AND 100;
       
--10 10)   Mostrar los empleados (tabla: employees) que no poseen departamento (department_id).
SELECT FIRST_NAME, LAST_NAME
       FROM EMPLOYEES 
       WHERE DEPARTMENT_ID IS NULL

--11 11)   Mostrar el nro. De empleado (employee_id), apellido (last_name) y nombre de los empleados cuyo nro de empleado sea 100 o 101.
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME 
       FROM EMPLOYEES 
       WHERE EMPLOYEE_ID = 100 OR EMPLOYEE_ID = 101
       
SELECT EMPLOYEE_ID, LAST_NAME, FIRST_NAME 
       FROM EMPLOYEES 
       WHERE EMPLOYEE_ID IN (100,101)
     
--12)   Mostrar el nro de empleado (employee_id), apellido (last_name), nombre (first_name), y el nombre de departamento (department_name) de los empleados (tabla: employees) que se encuentran en le departamento (department_id) 50
SELECT employee_id,first_name,last_name,department_name
       FROM EMPLOYEES e INNER JOIN DEPARTMENTS d ON e.employee_id = d.department_id
       WHERE e.department_id = 50

--13)   Mostrar la cantidad de empleados (tabla: employees).

 
SELECT COUNT(employee_id) from employees

--14)   Mostrar el apellido y nombre del empleado, además el nombre del departamento cuyos empleados tengan una o como segunda letra de su apellido.
SELECT last_name, first_name,department_name
       FROM employees e JOIN departments d ON e. department_id = d.department_id
       WHERE last_name like '_o%'
       
--15)   Mostrar el salario máximo (salary) de los empleados (tabla: employees) del departamento 20.
SELECT MAX(salary) 
FROM employees
WHERE department_id = 20

--16)   Mostrar la diferencia entre el salario mínimo y máximo.

 
select (MAX(SALARY) - MIN(SALARY)) AS diferencia
from employees

--17 17)   Mostrar la cantidad de departamentos (department_id) diferentes que poseen los empleados (tabla: employees).

SELECT COUNT(DISTINCT(department_id)) "cantidad dptos"
from employees

--18)   Mostrar la cantidad de empleados por departamento (employee_id), si la cantidad es mayor a 5 (tabla: employees).
SELECT department_id, count(*) "cantidad empleados"
from employees
group by department_id
having count(*) > 5



--19)   Mostrar los empleados que ganan el salario mínimo.
SELECT FIRST_NAME,LAST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY)
                FROM EMPLOYEES)


--20)      Mostrar el salario (salary) promedio de cada uno de los departamentos
--    (asignarle el alias Salario Promedio.), además del nro de departamento
--  (department_id) y nombre (department_name), (tablas: employees/departments)
SELECT e.department_id,d.department_name, AVG(SALARY) "Salario Promedio"
FROM employees e join departments d on e.department_id = d.department_id
GROUP BY E.DEPARTMENT_ID,D.DEPARTMENT_NAME

 

-- 21) Buscar todos los departamentos que no tengan empleados
SELECT department_name, employee_id
from departments D left join employees E on D.department_id = E.department_id
where employee_id is NULL 

-- 22)      Mostrar el salario (salary) mínimo por departamento (department_id)
--            y cargo (job_id). (tabla: employees).
SELECT  DEPARTMENT_ID, JOB_ID, MIN(SALARY) "salario minimo"
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, JOB_ID
 

-- 23)Mostrar los empleados (tabla: employees) que ganan más (salary)
--       que el empleado 101.

select first_name,last_name,salary
from employees
where salary > (select salary  from employees where employee_id = 101)

--24)      Mostrar los empleados (tabla: employees) que se encuentren en el departamento 
--   (department_id) 50 y que ganan (salary) más que el empleado (employee_id) 120
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50 AND SALARY > (SELECT SALARY FROM EMPLOYEES WHERE EMPLOYEE_ID = 120)

--25)Crear la tabla denominada emple con los mismos datos y estructura de la tabla employees.
CREATE TABLE emple_TL as (select * from employees)

-- 26) ⦁	Crear la tabla dep con los siguientes campos:
-- Id, de tipo number(5) y nombre de tipo varchar2(50)
CREATE TABLE dep_tl (
       id_dep number(5),
       nombre varchar2(50)
       )

--27) ⦁	Crear la columna cantidad_empleados en la tabla dep.La columna debe ser del tipo number.

ALTER TABLE dep_tl 
ADD cantidad_empleados number
select * from dep_tl

--28)⦁	Modificar la tabla dep para que el nombre tenga una longitud de 100
ALTER TABLE dep_tl
MODIFY nombre varchar(100)

--29)⦁ Agregar una clave primaria a la tabla de emple (employee_id)
ALTER TABLE emple_tl
ADD CONSTRAINT empleid_ok PRIMARY KEY (employee_id);

--30) Insertar en la tabla dep el siguiente registro: Id 10
-- Nombre: nuevo departamento Cantidad_empleados: 25

INSERT INTO dep_tl(id_dep, nombre, cantidad_empleados) VALUES (10, 'Nuevo departamento', 25)
 
--31) Modificar el nombre del departamento 10 de la tabla dep por Recursos Humanos

UPDATE dep_tl
SET nombre = 'Recursos Humanos' WHERE id_dep = 10
select * from dep_tl


--32) Eliminar de la tabla emp el empleado 110.
select * from emp 
DELETE FROM EMP WHERE EMPLOYEE_ID = 110

--31) Eliminar la tabla dep.
DROP TABLE DEP_TL

--32)Mostrar el nro. De empleado, la fecha de ingreso (hire_date) de los empleados (tabla:employees) y la misma fecha más un año.
SELECT EMPLOYEE_ID, HIRE_DATE,ADD_MONTHS(TO_DATE(HIRE_DATE,'DD/MM/YYYY'),12) FECHA
 FROM EMPLOYEES

--33)Mostrar el apellido (last_name) en mayúsculas, nombre (first_name) en minúsculas y nro de departamento (department_id) de los empleados (tabla: employees) qua poseen de salario (salary) 7000. En el caso de que el empleado no posea departamento (department_id) mostrar el nro 99 en lugar del valor nulo.

SELECT UPPER(LAST_NAME), LOWER(FIRST_NAME), NVL(DEPARTMENT_ID,99) DEPARTMENT_ID
FROM EMPLOYEES
WHERE SALARY = 7000
--34)Mostrar el último día del mes actual

SELECT LAST_DAY(SYSDATE) AS ULTIMO
FROM EMPLOYEES
--35)Mostrar el apellido (last_name) de los empleados (tabla: employees) y la cantidad de letras de los mismos.
SELECT LAST_NAME, LENGTH(LAST_NAME) CARACTERES
FROM EMPLOYEES 

--36)Mostrar las 5 primeras filas de la tabla de empleados (tabla: employees).
SELECT * FROM EMPLOYEES WHERE ROWNUM < 6

--37)Mostrar el apellido, la cantidad de letras que posee y las 5 primeras letras de los apellidos.
SELECT LAST_NAME, LENGTH(LAST_NAME) CARACTERES, SUBSTR(LAST_NAME, 0,5) FROM EMPLOYEES
