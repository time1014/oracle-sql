--숙제완료함
SELECT
       ename
       || '''s sal is $'
       || sal AS "Name And Sal"
FROM
       emp;


--2026.02.03 화

--107page

select empno , ename , sal , comm , to_char((sal*12)+comm,'999,999') salary
from emp
where ename = 'ALLEN';

select name,pay,bonus, to_char((pay*12)+ bonus,'999,999') total
from professor
where deptno = 201;

--108page
select empno , ename ,to_char(hiredate,'rrrr-mm-dd'), to_char((sal*12)+comm,'$999,999') sal , to_char(((sal*12)+comm)+(((sal*12)+comm)/100*15),'$999,999')
from emp
where comm is not null;


--113page(nv12)
select empno , ename , comm , decode(deptno,30,decode(comm,null,'NULL','EXIST')) as NVL2
from emp
where deptno = 30
order by empno;

--학생테이블의 생년월일을 기준으로 1~3 => 1/4분기
                             4~6 => 2/4분기
                             7~9 => 3/4분기
                             10~12 => 4/4분기
                             

select name , birthday 
       ,decode(
       substr(birthday, 6, 2),
       1,
       '1/4분기',
       2,
       '1/4분기',
       3,
       '1/4분기',
       4,
       '2/4분기',
       5,
       '2/4분기',
       6,
       '2/4분기',
       7,
       '3/4분기',
       8,
       '3/4분기',
       9,
       '3/4분기',
       10,
       '4/4분기',
       11,
       '4/4분기',
       12,
       '4/4분기'
)as 생일분기                           
from student;

                             