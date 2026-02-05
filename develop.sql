select *
from student;

---추가작업 origin merge 테스트
select *
from dept;

--dml insert update delete merge
-- insert into table명 (컬럼1,컬럼2..) values(값1,값2..)
select *
from board;
-- 글등록연습 /user01 /sql 연습중
--insert 완성
insert into board (board_no,title,writer,content,click_cnt) values(4,'글등록연습','user01','sql연습중',0);

insert into board (board_no,title,writer,content,click_cnt) values((select max(board_no)+1 from board),:title,:writer,:content,0);


update board
set click_cnt = 0;


select max(board_no)+1 from board;

-- 외워라 :?  => 입력하는 값
update board
set click_cnt = click_cnt + 1
       ,title = :title
       ,content = :content
where board_no = :bno;

delete from board
where writer = 'user03';

delete from board
where content like '%바인드%';

select *
from board;

select *
from emp;

--max + 1 ,이름, selesman , , 2026-02-01,3000,10,30
insert into emp (empno,ename,job,hiredate,sal,comm,deptno) values((select max(empno)+1 from emp),'BJY','salesman',to_date('2026/02/01','rrrr/mm/dd'),3000,10,30);

--30부서의 매니저의 사번
select *
from emp;

update emp
set MGR = (select empno
           from emp
           where job = 'MANAGER'
           AND DEPTNO = 30)
where empno = 7935;

-- 상품테이블(product_tbl)
-- 상품코드(varchar),상품명(varchar),가격(number),상품설명(varchar),평점(5,4,3,2,1),제조사(varchar),등록일자(date)
create table product_tbl(
       icode varchar2(10) primary key
       ,iname varchar2(50) not null
       ,price number not null
       ,idescription varchar2(200) not null
       ,rate float
       ,company varchar2(30) 
       ,created_date date default sysdate);


insert into product_tbl values('S005','사탕2',3000,'다른사탕',3.5,'오리온',sysdate);




select *
from product_tbl;
       
       
--merge into table1
--using table2
--on 병합조건
--when matched then
--update 
--when not matched then
-- insert

merge into product_tbl tbl1
using(select 'S005' icode
       ,'지우개2' iname
       ,2200 price
       ,'글씨 지우는거2' idescription
       from dual)tbl2
on (tbl1.icode = tbl2.icode)
when matched then 
update set
       tbl1.iname = tbl2.iname
       ,tbl1.price = tbl2.price
       ,tbl1.idescription = tbl2.idescription
when not matched then
insert (icode,iname,price,idescription) values (tbl2.icode,tbl2.iname,tbl2.price,tbl2.idescription);