--must specify at least 1 column
SELECT FROM dept;

--must specify table
SELECT * FROM;

--commas only between column names
SELECT deptno, loc, 
FROM dept;

--operations need 2 operands
SELECT ename, sal, sal+-100* 
FROM emp;

--alias needs to be specified
SELECT ename AS 
FROM emp;

--concatenation needs 2 operands as well
SELECT ename ||' is a '|| AS "Employee Details" 
FROM emp;

--WHERE clause after from
SELECT	ename, job, deptno
WHERE	job='CLERK'
FROM	emp;

--invalid comparison operator
SELECT	ename, sal, comm
FROM	emp
WHERE	sal><comm;

--faulty BETWEEN
SELECT	ename, sal
FROM	emp
WHERE	sal BETWEEN 1000;

--LIKE compares to string
SELECT	ename
FROM	emp
WHERE	ename LIKE A;

--"IS" is required
SELECT	ename, mgr
FROM	emp
WHERE	mgr NULL;

--OR operator requires comparisons
SELECT	empno, ename, job, sal
FROM	emp
WHERE	sal 
OR	'CLERK';

--NOT NULL
SELECT	ename, job
FROM	emp
WHERE	comm IS NOT;

