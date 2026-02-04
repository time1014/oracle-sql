select *
from emp;

select *
from dept;

select e.* , dname, loc
from emp e,dept d
where e.deptno = d.deptno;


--ANSI vs ORACLE
select *
from emp e JOIN dept d ON e.deptno = d.deptno
where job = 'SALESMAN';

--student(profno) , professor(profno)
select studno , s.name , p.profno , p.name
from student s  right outer join professor p on s.profno = p.profno;

-- 학생번호 ,학생 이름 , 담당교수이름(있으면넣고 없으면 담당교수 없음)
select studno , s.name , NVL(p.name,'담당교수 없음')
from student s left outer join professor p  on s.profno = p.profno;

--student 지역번호 구분 02서울 031 경기도 051 부산 그외 기타
select name 
       ,substr(tel,1,instr(tel,')',1)-1) tel
       ,case substr(tel,1,instr(tel,')',1)-1) when '02' then '서울'
                                              when '031' then '경기도'
                                              when '051' then '부산'
                                              else '기타'
                                              end "지역명"
from student;

select name
       ,jumin
       ,case when substr(jumin,3,2) between '01' and '03' then '1/4분기'
              when substr(jumin,3,2) between '04' and '06' then '2/4분기'
              when substr(jumin,3,2) between '07' and '09' then '3/4분기'
              when substr(jumin,3,2) between '10' and '12' then '4/4분기'
              end "분기"
from student;


select empno 
       , ename 
       , sal 
       , case when sal between 1 and 1000 then 'LEVEL1'
                                   when sal between 1001 and 2000 then 'LEVEL2'
                                   when sal between 2001 and 3000 then 'LEVEL3'
                                   when sal between 3001 and 4000 then 'LEVEL4'
                                   else 'LEVEL5'
                                   end "LEVEL"
from emp
order by sal DESC;

--123페이지
select job , count(*) , sum(sal) ,round(avg(sal),1) avg , min(hiredate) , max(hiredate)
from emp
group by job;

-- 부서별 급여합계 , 평균 급여 ,인원
select dname as "부서", sum(e.sal)as "급여합계" ,round(avg(e.sal+nvl(comm,0)),1)as "평균급여" ,count(*) as "인원"
from emp e join dept d on e.deptno = d.deptno
group by dname;


select d.dname , e.*
from (select deptno
              ,sum(sal)
              ,round(avg(sal))
              ,count(*)
       from emp
       group by deptno ) e
join dept d on e.deptno = d.deptno;

-- rollup()
-- 부서별 직무별 평균급여 , 사원수 , 
select deptno
       ,job
       ,avg(sal)
       ,count(*)
from emp
group by deptno
         ,job
union
-- 부서별 평균 급여 , 사원수,
select deptno
       ,'소계'
       ,round(avg(sal),1)
       ,count(*)
from emp
group by deptno
union
-- 평균급여 , 사원수,
select 99
       ,'전체집계'
       ,round(avg(sal),1)
       ,count(*)
from emp
order by deptno;

--rollup
select deptno 
       , job
       ,round(avg(sal),1)
       ,count(*)
from emp
group by rollup(deptno,job)
order by 1;