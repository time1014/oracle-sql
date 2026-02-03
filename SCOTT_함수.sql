select profno
    ,name
    ,pay * 12 + nvl(bonus ,0)*3 as 연봉
    ,pay
    ,nvl(bonus , 0) bonus
from professor;
    
-- initcap ('문자열'/컬럼)
select initcap('hello')
from dual;

select profno
    ,initcap(name)
    ,lower(name)
    ,upper(name)
from professor;

select length(name) , lengthb(name)
from student;

-- 교수테이블의 이름에 st가 포함된 교수의 교수번호 이름 입사일 출력

select profno 
      ,name 
      ,hiredate 
from professor
where name like upper('%st%') 
or name like initcap('%st%') 
or name like lower('%st%');


-- 교수테이블의 교수이름이 10글자가 안되는 교수번호 이름 이메일

select profno , name , email
from professor
where length(name) < 10;


-- 문자열 인덱스 0이랑 1이랑 같음
select name , substr(jumin,3,4) "birthday"
from student
where deptno1  = 101;


select 'hello, world'
      ,substr('hello, world' ,1,5) str1 
      ,substr('hello, world' ,-5,5) str2
      ,substr('0'||5, -2 , 2)mm
      ,substr('02)1234-1234',1,instr('02)1234-1234',')',1)-1) inst1            
      ,substr('031)1234-1234',1,instr('031)1234-1234',')',1)-1) inst2   
      ,instr('031)1234-1234',')',1)instr3 --문자열에서 찾을 문자열의 위치 반환
from dual;


select name , tel , substr(tel,1,instr(tel,')',1)-1) as "AREA CODE" , rtrim(substr(tel , instr(tel,')',1)+1 ,4),'-') as "1st NO"
from student
where deptno1 = '201';

select name , tel , substr(tel,1,instr(tel,')',1)-1) as "AREA CODE" 
, substr(tel , instr(tel,')',1)+1 , instr(tel,'-',1)-instr(tel,')',1)-1) as "1st NO"
from student
where deptno1 = '201';

select lpad ('hello', 10 , '*')
from dual;

select lpad (ename,9,'123456789') lpad
       ,rpad(ename,10,'-')rpad      
from emp
where deptno = 10;

select rpad(ename,lengthb(ename))
from emp 
where deptno = 10;




-- 중간에 하던것들 응답없음으로 날아감(trim , replace )


select ename , replace(ename,substr(ename,2,2),'--') as replace
from emp
where deptno = 20;

select name , jumin , replace(jumin, substr(jumin,7,7),'-/-/-/-') as replace
from student
where deptno1 = 101;

select name 
       , tel 
       ,replace(tel,substr(tel,instr(tel,')',1)+1,instr(tel,'-',1)-instr(tel,')',1)-1),'****' ) as replace
from student
where deptno1 = 102;

select name , tel , replace(tel,substr(tel,instr(tel,'-',1)+1,4),'****') as replace
from student
where deptno1 = 101;


--round
select round(123.456,2) round
       ,trunc(123.1234,-2) trunc
       ,mod(15,5) mod -- 나머지
       ,ceil(12.3) ceil -- 올림
       ,floor(12.3)floor -- 내림
       ,to_char(trunc(sysdate,'rrrr'),'rrrr/mm/dd hh24:mi:ss') datetrunc -- 년/월/일 시/분/초
       ,to_char(sysdate,'rrrr/mm/dd hh24:mi:ss') datetrunc -- 년/월/일 시/분/초

from dual;

select add_months(sysdate+28,1)
       ,months_between(sysdate + 1,  sysdate)
from dual;

--사원 번호 , 이름, 근속년수 (23년)
select empno 
       , ename 
       , trunc(months_between(sysdate,hiredate) / 12) || '년'
       || mod(trunc(months_between(sysdate,hiredate)  ),12) || '개월' "근속일"
from emp;

select * -- 교수번호 , 이름 , 입사일자 , 급여 (30년이상한사람의)
from professor;

select profno , name , hiredate , pay  , p.deptno
from professor p 
where (months_between(sysdate , hiredate) / 12) >= 30
order by hiredate;

select *
from department;

select profno , name , p.deptno , dname
from professor p, department d
where p.deptno = d.deptno
AND d.dname = 'Computer Engineering';

-- 교수번호 ㅡ이름 입사일자 급여 (20년이상이고 software engineering)
select profno , name , hiredate , pay , dname
from professor p , department d
where p.deptno = d.deptno 
AND months_between(sysdate,hiredate)/12 >= 20
AND d.dname = 'Software Engineering';

select *
from emp , dept
order by emp.empno;  
-- 세일즈 부서에 근속년 40년이 넘는 사람 사번,이름,급여,부서명
select empno , ename , sal , dname
from emp e , dept d
where e.deptno = d.deptno
AND dname = 'SALES'
AND months_between(sysdate,hiredate)/12 >= 40;

select 2 + to_number('2',9)
       ,concat(2,'2')
       ,sysdate
from dual
where sysdate > '2026/02/03';

select sysdate
       ,to_char(sysdate,'rrrr/month/dd HH24:MI:SS')
       ,to_date('05202403','mmrrrrdd')
from dual;

--to_char
select to_char(12345.6789,'099,999.99')--반올림 값 출력
from dual;

select studno , name , to_char(birthday,'dd-MON-rr','NLS_DATE_LANGUAGE = AMERICAN') --한글로 안나와서 강제로 바꿈 원래 한글
from student
where substr(birthday,6,2) = 01; 

SELECT nvl(10,0) -- mysql에선 IFNULL 이였음
from dual;

select pay + nvl(bonus,0)
from  professor;

select name , nvl(to_char(profno),'담당교수 없음') AS "profno"
from student
order by profno;

--decode(A,B,'같은조건','다른조건')
Select decode(10,10,'같다','다르다') -- 10 == 20 ? '같다' : '다르다'
from dual;


select studno , profno , decode(profno,null,9999,profno) --profno가 null과 같으면 9999 다르면 profno
from student
order by profno DESC;

select decode('B','A' , '현재값은 A입니다' , 'B' , '현재B','기타') -- if문처럼 값과 비교해서 같으면 뒤의 조건 전부 아니면 마지막 조건
from dual;


--예제 1번
select DEPTNO , NAME , decode(deptno , 101 , 'Computer Engineering') as DNAME
from professor;

--예제 2번
select deptno , name, decode(deptno,101,'Computer Engineering','ETC')
from professor;
--예제 3번
select deptno,name , decode(deptno , 101 , 'Computer Engineering',102,'Multimedia Engineering',103,'Software Engineering','ETC')
from professor;
--예제 4번
select name , deptno, decode(deptno,101,decode(name,'Audie Murphy','BEST!')) as decode
from professor;
--예제 5번
select name, deptno, decode(deptno,101,decode(name,'Audie Murphy','BEST!','GOOD!'),'') as ETC
from professor;
--예제 6번
select name, deptno, decode(deptno,101,decode(name,'Audie Murphy','BEST!','GOOD!'),'N/A') as ETC
from professor;




