--I
--select all columns, all rows
SELECT * FROM dept;

--select specific columns, all rows
SELECT deptno, loc 
FROM dept;

--arithmetic operators * / + -
SELECT ename, sal, 12*(sal+100) 
FROM emp;

--aliases
SELECT ename AS name, sal
salary FROM emp;

--aliases, p2
SELECT	ename "Name",
	sal*12 "Annual Salary" 
FROM emp;

--concatenation operator
SELECT ename || ' is a ' || job AS "Employee Details" 
FROM emp;

--duplicate rows
SELECT DISTINCT deptno, job FROM emp;





--II
--WHERE clause
SELECT	ename, job, deptno
FROM	emp
WHERE	job='CLERK';

--comparison operators = < > <= >= <>
SELECT	ename, sal, comm
FROM	emp
WHERE	sal<=comm;

--BETWEEN
SELECT	ename, sal
FROM	emp
WHERE	sal BETWEEN 1000 AND 1500;

--IN
SELECT	empno, ename, sal, mgr
FROM	emp
WHERE	mgr IN (7902, 7566, 7788);

--LIKE _ % ???
SELECT	ename
FROM	emp
WHERE	ename LIKE '_A%';

--IS NULL ???
SELECT	ename, mgr
FROM	emp
WHERE	mgr IS NULL;

--AND operator
SELECT	empno, ename, job, sal
FROM	emp
WHERE	sal>=1100
AND	job='CLERK';

--OR operator
SELECT	empno, ename, job, sal
FROM	emp
WHERE	sal>=1100
OR	job='CLERK';

--NOT IN
SELECT	ename, job
FROM	emp
WHERE	job NOT IN ('CLERK', 'MANAGER', 'ANALYST');

--NOT BETWEEN
SELECT	ename, job
FROM	emp
WHERE	job NOT BETWEEN 1000 AND 1500;

--NOT LIKE
SELECT	ename, job
FROM	emp
WHERE	job NOT LIKE '%A%';

--NOT NULL
SELECT	ename, job
FROM	emp
WHERE	comm IS NOT NULL;

