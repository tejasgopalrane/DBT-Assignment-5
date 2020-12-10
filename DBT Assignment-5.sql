create database Assignment5;
use Assignment5;

Create table EMP ( 
EMPNO numeric(4) not null, 
ENAME varchar(30) not null, 
JOB varchar(10), 
MGR numeric(4), 
HIREDATE date, 
SAL numeric(7,2), 
DEPTNO numeric(2) 
); 
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1000,  'Manish' , 'SALESMAN', 1003,  '2020-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1001,  'Manoj' , 'SALESMAN', 1003,  '2018-02-18', 600,  30) ;
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1002 , 'Ashish', 'SALESMAN',1003 , '2013-02-18',  750,  30 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1004,  'Rekha', 'ANALYST', 1006 , '2001-02-18', 3000,  10);
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1005 , 'Sachin', 'ANALYST', 1006 ,  '2019-02-18', 3000, 10 );
Insert into EMP (EMPNO ,ENAME, JOB, MGR, HIREDATE, SAL, DEPTNO ) values(1006,  'Pooja',  'MANAGER'  , null , '2000-02-18' ,6000, 10 );

Create table dept (
dno numeric(4) not null, 
dname varchar(10) not null,
area varchar(30)
);
Insert into dept(dno,dname,area) values(10,'Store','Mumbai');
Insert into dept(dno,dname,area) values(20,'Purchase','Mumbai');
Insert into dept(dno,dname,area) values(30,'Store', 'Delhi');
Insert into dept(dno,dname,area) values(40,'Marketing','Pune');
Insert into dept(dno,dname,area) values(50,'Finance','Delhi');
Insert into dept(dno,dname,area) values(60,'Accounts','Mumbai');

Delimiter $$
Create Procedure get_Specific_EMP ()
begin
Select * from Emp;
End $$

call get_Specific_EMP ();

Delimiter $$
Create Procedure Query_1 (IN var1 int, var2 int)
begin
declare res1,res2,res3,res4 int default 0;
if var1 is null then 
set var1=0;
end if;
if var2 is null then 
set var2=0;
end if;
set res1=var1+var2;
set res2=var1-var2;
set res3=var1*var2;
set res4=var1/var2;
Select res1,res2,res3,res4;
End $$

call   Query_1(10,5);

Delimiter $$
Create Procedure Query_2 (IN str varchar(20))
begin
select REVERSE(str);
End $$
delimiter ;
call   Query_2('Database');

Delimiter $$
Create Procedure Query_3 ()
begin
select EMPNO,ENAME,SAL FROM EMP order by SAL desc limit 5;
End $$
delimiter ;
call   Query_3();

Delimiter $$
Create Procedure Query_4 ()
begin
create table if not exists EMP_TEST(
e_id integer, 
e_name varchar(10), 
e_joining_date date 
) ;
End $$
delimiter ;
call   Query_4();
desc emp_test;

Delimiter $$
Create Procedure Query_5 (IN dno int(5) ,dname varchar(20),area varchar(20))
begin
insert into dept values(dno,dname,area);
End $$
delimiter ;
call   Query_5(60, 'Education','Pune');
select * from dept;

Delimiter $$
Create Procedure Query_6 (IN num int)
begin
declare res1,res2 int;
SET res1= POWER(num,2);
SET res2= POWER(num,3);
select num,res1,res2;
End $$
delimiter ;
call   Query_6(11);

Delimiter $$
Create Procedure Query_7 (OUT num int)
begin
SET num=9;
End $$
delimiter ;
call   Query_7(@res1);
select @res1 "Result";

Delimiter $$
Create Procedure Query_8(INOUT num int, IN num1 int)
begin
SET num=num+num1;

End $$
delimiter ;
SET @Query_8=11;
call   Query_8(@Query_8, 24);
select @Query_8;

Delimiter $$
Create Procedure Query_9(INOUT num int)
begin
SET num=num+7;

End $$
delimiter ;
SET @Query_9=11;
call   Query_9(@Query_9);
select @Query_9;






















