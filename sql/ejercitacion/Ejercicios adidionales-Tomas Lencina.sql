--EJERCICIOS ADICIONALES

/*1)Muestre el apellido y el salario para todos los empleados cuyos salarios no
     están comprendidos entre $5.000 y $12.000.*/

SELECT last_name "Apellido"
       , salary "salario"
       FROM EMPLOYEES
       WHERE (salary > 12000) OR (salary < 5000)
       ORDER BY SALARY 

 

/* 2)Muestre el apellido del empleado, el identificador de cargo y la fecha de
   inicio de los empleados contratados entre el 20 de febrero de 1998 y el 1 
   de mayo de 1998.
    Ordene la consulta en orden ascendente por fecha de inicio.*/
    
    SELECT last_name "apellido" ,  employee_id, hire_date
    FROM EMPLOYEES
    WHERE HIRE_DATE BETWEEN ('20/2/1998') AND ('20/5/1998')
    ORDER BY HIRE_DATE ASC;
    
/* 3) Muestre el apellido y el cargo de todos los empleados que no tienen director.*/
SELECT last_name "apellido", job_id "cargo", manager_id
FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL



4)/*Muestre el apellido de todos los empleados que tengan una a y una e en el apellido*/
SELECT last_name "apellido"
FROM employees
WHERE last_name LIKE '%a%' AND last_name LIKE '%e%'/*and '%e%'*/

--Ejercicio 5
-- Cree un listado único de todos los cargos que haya en el departamento 80. Incluya la ubicación del departamento en el resultado.

SELECT DISTINCT e.job_id, l.street_address
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE d.department_id = 80;

--Ejercicio 6
--Escriba una consulta para mostrar el apellido del empleado, el nombre de departamento, el identificador de ubicación y la ciudad de todos los empleados que perciben comisión.
SELECT e.last_name, d.department_name, d.location_id, l.city
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE e.commission_pct IS NOT NULL OR e.commission_pct > 0;

--Ejercicio 7
--  Escriba una consulta para mostrar el apellido, el cargo, el número de departamento y el nombre de departamento para todos los empleados que trabajan en Toronto

SELECT e.last_name, j.job_title, d.department_id, d.department_name, l.city
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
JOIN locations l ON d.location_id = l.location_id
WHERE l.city = 'Toronto';

--Ejercicio 8
-- Muestre el apellido y el número de empleado, junto con id y nombre de departamento. Etiquete las columnas Employee, Emp#, Cód Dep, Descrip Dep, respectivamente. Traiga todos los datos de empleados, más allá que no pertenezca a ningún departamento.

SELECT e.last_name Employee, e.employee_id "Emp%", e.department_id "Cod Dep", d.department_name "Descrip Dep"
FROM employees e
LEFT JOIN departments d ON e.department_id = d.department_id;

--Ejercicio 9
-- Determine el número de directores sin enumerarlos. Etiquete la columna Number of Managers. Indicación: Utilice la columna MANAGER_ID para determinar el número de directores.

SELECT COUNT(DISTINCT(e.manager_id)) "Number of Managers"
FROM employees e;

--Ejercicio 10
--     Escriba una consulta que muestre la diferencia entre el salario más alto y el más bajo. Etiquete la columna DIFFERENCE.

SELECT (MAX(e.salary) - MIN(e.salary)) "DIFFERENCE"
FROM employees e;

--Ejercicio 11
--  Muestre el número de director y el salario del empleado peor pagado para 
-- ese director. Excluya los empleados de los que no se conozca el director. 
-- Excluya los grupos en los que el salario mínimo sea
-- $6.000 o menos. Ordene el resultado por salario en orden descendente.
SELECT E.MANAGER_ID, MIN(E.SALARY)"SALARIO MINIMO"
FROM EMPLOYEES E
WHERE E.MANAGER_ID IS NOT NULL
GROUP BY E.MANAGER_ID
HAVING MIN(E.SALARY) > 6000
ORDER BY "SALARIO MINIMO" DESC

--Ejercicio 12
--  Enumere los identificadores de departamento para departamentos que no contienen el ID de cargo ST_CLERK, utilizando operadores de conjunto.

SELECT department_id, job_id
FROM employees
WHERE job_id <> 'ST_CLERK';

--Ejercicio 13
--   Escriba una consulta compuesta que enumere lo siguiente:
-- Id de empleados e identificadores de departamento de todos los empleados de la tabla EMPLOYEES, independientemente de si pertenecen o no a algún departamento.

-- Identificador y nombre de departamento de todos los departamentos de la tabla DEPARTMENTS, independientemente de si tienen o no empleados trabajando en ellos.

SELECT e.employee_id, e.department_id, d.department_name
FROM employees e JOIN departments d ON e.department_id = d.department_id


--Ejercicio 14
--  Escriba una consulta para mostrar el apellido y la fecha de contratación de cualquier empleado del mismo departamento que Zlotkey. Excluya a Zlotkey.

SELECT e.last_name, e.hire_date
FROM employees e
WHERE e.department_id = (SELECT ea.department_id
                         FROM employees ea
                         WHERE ea.last_name = 'Zlotkey') AND e.last_name <> 'Zlotkey';
                         
--Ejercicio 15
--  Cree una consulta para mostrar los números de empleado y los apellidos de todos los empleados que ganen más del salario medio. Ordene los resultados por salario en orden ascendente.

SELECT e.employee_id, e.last_name, e.salary
FROM employees e
WHERE e.salary > (SELECT AVG(ea.salary)
                  FROM employees ea)
ORDER BY e.salary;

--Ejercicio 16
--    Escriba una consulta para mostrar el apellido, el número de departamento y el salario de cualquier empleado cuyo número de departamento y salario coinciden con el número de departamento y salario de cualquier empleado que gane comisión.
 

SELECT e.last_name, e.department_id, e.salary
FROM employees e
WHERE e.department_id = (SELECT ea.department_id
                         FROM employees ea
                         WHERE ea.commission_pct IS NOT NULL OR ea.commission_pct > 0)
--Ejercicio 17
--Cree una consulta para mostrar los empleados que ganen un salario más alto que el de todos los directores de ventas (JOB_ID = 'SA_MAN'). Ordene los resultados por salario de más alto a más bajo.
 

SELECT e.last_name, e.first_name, e.salary
FROM employees e
WHERE e.salary > (SELECT MAX(ea.salary)
                  FROM employees ea
                  WHERE ea.JOB_ID = 'SA_MAN');
--Ejercicio 18
--  Escriba una consulta para encontrar todos los empleados que ganen más que el salario medio en sus departamentos. Muestre el apellido, el salario, el identificador de departamento y el salario medio para el departamento. Ordene por salario medio. Utilice alias para las columnas recuperadas por la consulta.  

SELECT ea.last_name, ea.salary,ea.department_id, e.sala_promedio
FROM employees ea,(SELECT avg(salary)sala_promedio , department_id
                    FROM employees
                    GROUP BY department_id)e
WHERE ea.department_id=e.department_id AND ea.salary>e.sala_promedio
ORDER BY e.sala_promedio  

--19)⦁	Cree una tabla EMP basándose en el siguiente cuadro. Confirme que se ha creado la tabla.
CREATE TABLE EMP_TL (
ID_TL NUMBER(7),
FIRST_NAME VARCHAR2(25),
LAST_NAME VARCHAR2(25),
DEP_ID NUMBER(7)
)

SELECT * FROM EMP_TL

--20)	Modifique la tabla EMP para permitir apellidos de empleado más largos. Confirme la modificación.

ALTER TABLE EMP_TL
MODIFY LAST_NAME varchar2(50)
 
 
 --21)Cree la tabla EMPLOYEES2 basándose en la estructura de la tabla EMPLOYEES. Incluya sólo las columnas EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY y DEPARTMENT_ID. Llame a las columnas de la nueva tabla ID, FIRST_NAME, LAST_NAME, SALARY y DEPT_ID, respectivamente.
CREATE TABLE EMPLOYEES2_TL AS
SELECT EMPLOYEE_ID ID_TL, FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID DEPT_ID 
FROM EMPLOYEES 
WHERE ROWNUM >1

SELECT * FROM  EMPLOYEES2_TL

--22)	Borre la tabla EMP.

DROP TABLE EMP_TL

--23) Cambie el nombre de la tabla EMPLOYEES2 a EMP.
ALTER TABLE EMPLOYEES2_TL
RENAME TO EMP_TL
SELECT * FROM EMP_TL
--24)Borre la columna FIRST_NAME de la tabla EMP. Confirme la modificación comprobando la descripción de la tabla.

ALTER TABLE EMP_TL
DROP COLUMN FIRST_NAME

SELECT * FROM EMP_TL
--25)	Agregue una restricción de PRIMARY KEY de nivel de tabla a la tabla EMP en la columna ID. Se debe poner nombre a la restricción en el momento de su creación. Llame a la restricción my_emp_id_pk.
ALTER TABLE EMP_TL
ADD CONSTRAINT my_emp_id_pk PRIMARY KEY (ID_TL)




--26)	Modifique la tabla EMP. Agregue una columna COMMISSION del tipo de dato NUMBER, precisión 2, escala 2. Agregue una restricción a la columna COMMISSION que asegure que un valor de comisión sea mayor que cero.
ALTER TABLE EMP_TL
  ADD COMISSION_2 NUMBER(2)not null
  
  
--27)⦁	Crear la tabla MY_EMPLOYEE que se utilizará para la práctica.


CREATE TABLE my_employee_TL
(id NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL, last_name VARCHAR2(25),
first_name VARCHAR2(25), userid VARCHAR2(8), salary NUMBER(9,2));


--28) Agregue la primera fila de datos a la tabla MY_EMPLOYEE desde los siguientes datos de ejemplo. No enumere las columnas en la cláusula INSERT.

INSERT INTO MY_EMPLOYEE_TL VALUES (1, 'Patel', 'Ralph', 'Rpatel',895)

--29) ⦁	Rellene la tabla MY_EMPLOYEE con la segunda fila de los datos de ejemplo de la lista anterior. Esta vez, enumere las columnas explícitamente en la cláusula INSERT.

INSERT INTO MY_EMPLOYEE_TL(ID,LAST_NAME,FIRST_NAME,USERID,SALARY) VALUES (2, 'Dancs', 'Betty','Bdancs',860)

--30) Haga que las adiciones de datos ean permanentes.
commit
--31)	Cambie el apellido del empleado 3 por Drexler.
insert into my_employee_tl values(3,'Biri','Ben','Bbiri',1100)

UPDATE MY_EMPLOYEE_TL
SET LAST_NAME = 'Drexler'
where id = 3


⦁	--32) Cambie el salario a 1000 para todos los empleados con un salario menor que 900.
update my_employee_tl
set salary = 1000
where salary < 900

⦁--33)	Suprima a Betty Dancs de la tabla MY_EMPLOYEE.

delete from my_employee_tl
where last_name = 'Dancs' and first_name = 'Betty' 

⦁--34)	Valide todos los cambios pendientes.
commit;

--35

SELECT job_id JOB, DECODE(job_id,'AD_PRES', 'A',
                             'ST_MAN', 'B',
                             'IT_PROG', 'C',
                             'SA_REP', 'D',
                             'ST_CLERK', 'E',
                                         '0') GRADE  
FROM employees;

--36

SELECT job_id JOB, CASE JOB_ID
                       WHEN 'AD_PRES' THEN 'A'
                       else '0';
                       end              
FROM employees;

--37

SELECT employee_id, last_name, salary, ROUND (salary * 1.25) "New Salary"
FROM employees;

--38

SELECT  last_name "Apellido", COALESCE(TO_CHAR(commission_pct, '0.99'), 'NO COMMISSION')
FROM employees;

--39

SELECT
     ROUND(MAX(SALARY)) AS "SALARIO MAX"
   , ROUND(MIN(SALARY)) AS "SALARIO MIN"
   , ROUND(SUM(SALARY)) AS "SALARIO TOTAL"
   , ROUND(AVG(SALARY)) AS "SALARIO PROMEDIO"
FROM EMPLOYEES

--40

SELECT
     ROUND (MAX(SALARY)) AS "SALARIO MAX"
     ,ROUND(MIN (SALARY)) AS "SALARIO MIN"
     ,ROUND (SUM (SALARY)) AS "SALARIO TOTAL"
     ,ROUND (AVG (SALART)) AS "SALARIO PROMEDIO"
     ,JOB_ID
FROM employees
GROUP BY JOB_ID;              

