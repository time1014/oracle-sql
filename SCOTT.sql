-- 1)professor 테이블 전체 컬럼 조회
SELECT *
FROM professor;

-- 2)학생 -> 학생번호 ,이름 ,학년
SELECT STUDNO,NAME,GRADE
FROM student;


--숙제완료함




select name || '의 아이디는 ' || id as 전체설명
    ,grade as "학년"
from student;

--james seo 의 아이디는 75true이고 4학년 입니다
select name || '의 ''아이디''는 ' ||id || '이고 ' || grade ||'학년입니다' as 학년설명
from student
where name = 'James Seo';

select distinct name , grade
from student;

select *
from emp;
select *
from student;

select name || '''s ID:'|| id ||' , '||'WEIGHT is ' || weight || 'kg' as "ID AND WEIGHT" 
from student;

select ename||'('||job||'), ' ||ename||''''||job||'''' as "NAME AND JOB"
from emp;


SELECT *
FROM student
WHERE weight between 60 and 70
AND deptno1 <> 201;

SELECT *
FROM student
WHERE deptno2 is not null;


select *
from emp;
-- emp 테이블 급여 3000보다 큰 직원
select *
FROM emp
where SAL > 3000;

--emp테이블 보너스 있는 직원
select *
from emp
Where comm is not null;

--student테이블 주전공학과: 101,102,103인 학생
select *
from student
where deptno1 IN(101,102,103);

-- 급여 2000이상인 직원 커미션 (급여+커미션)
select *
from emp
where SAL >= 2000 or SAL + comm >= 2000;

select studno,name , grade , height , weight
from student
where height > 170
AND weight > 60

-- 교수 연봉이 4천 이상인 보너스 1년에 3번 받음
select *
from professor;

select profno 
    , name
    ,pay
    ,bonus
    , pay * 12 as total1 
    , pay * 12 + bonus as total2
from professor
where (pay * 12 >= 3000 and bonus is null)
or(pay * 12 + bonus * 3 >= 3000 and bonus is not null)
order by 5;

--문자열 like 연산자
Select *
from student
where name like '%on____';


select *
from professor
where hiredate > to_date('1999-01-01','rrrr-mm-dd')
order by hiredate;

--학생테이블, 전화번호(02,031,051,052,053..)
-- 051부산에 거주하는 학생 쭉
select *
from student
where tel like '051%';

-- 이름 중 m으로 시작하는 이름 8글자 이상조회
select *
from student
where name like 'M%_______';

-- 주민번호 10월달에 태어난 사람 조회
select *
from student
where jumin like '__10%';