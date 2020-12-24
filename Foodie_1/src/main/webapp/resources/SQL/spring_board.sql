------ **** 스프링 게시판 **** ------

show user;
-- USER이(가) "MYMVC_USER"입니다.

create table spring_test
(no         number
,name       varchar2(100)
,writeday   date default sysdate
);

select *
from spring_test;

delete from spring_test;
commit;

-----------------------------------------------------------------------------------------
show user;
-- USER이(가) "HR"입니다.

select employee_id, first_name || ' ' || last_name AS ename,
       nvl( (salary + salary*commission_pct)*12 ,  salary*12) AS yearpay,
       case when substr(jubun,7,1) in ('1','3') then '남' else '여' end AS gender,
       extract(year from sysdate) - ( case when substr(jubun,7,1) in('1','2') then 1900 else 2000 end + to_number(substr(jubun,1,2)) ) + 1 AS age         
from employees
order by 1;


show user;
-- USER이(가) "MYMVC_USER"입니다.

select * from tab;

select *
from tbl_main_image;

select *
from tbl_member;


select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender
     , birthyyyy, birthmm, birthdd, coin, point, registerday, pwdchangegap
     , nvl( lastlogingap, trunc( months_between(sysdate, registerday) )) as lastlogingap
from
(
select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender
     , substr(birthday,1,4) as birthyyyy, substr(birthday,6,2) as birthmm, substr(birthday,9) as birthdd
     , coin, point, to_char(registerday,'yyyy-mm-dd') as registerday
     , trunc( months_between(sysdate, lastpwdchangedate) ) as pwdchangegap
from tbl_member
where status = 1 and userid = 'kangkc' and pwd = '9695b88a59a1610320897fa84cb7e144cc51f2984520efb77111d94b402a8382' 
) M 
cross join 
(
select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap 
from tbl_loginhistory 
where fk_userid = 'kangkc' 
) H;

select *
from tbl_loginhistory;


    ------- **** 게시판(답변글쓰기가 없고, 파일첨부도 없는) 글쓰기 **** -------
desc tbl_member;

create table tbl_board
(seq         number                not null    -- 글번호
,fk_userid   varchar2(20)          not null    -- 사용자ID
,name        varchar2(20)          not null    -- 글쓴이 
,subject     Nvarchar2(200)        not null    -- 글제목
,content     Nvarchar2(2000)       not null    -- 글내용   -- clob (최대 4GB까지 허용) 
,pw          varchar2(20)          not null    -- 글암호
,readCount   number default 0      not null    -- 글조회수
,regDate     date default sysdate  not null    -- 글쓴시간
,status      number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_board
order by seq desc;


select seq, fk_userid, name, subject  
     , readcount, to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate
from tbl_board
where status = 1
order by seq desc;


select previousseq, previoussubject
     , seq, fk_userid, name, subject, content, readCount, regDate
     , nextseq, nextsubject
from 
(
    select  lag(seq,1) over(order by seq desc) AS previousseq 
          , lag(subject,1) over(order by seq desc) AS previoussubject
            
           , seq, fk_userid, name, subject, content, readCount
           , to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') AS regDate
    
           , lead(seq,1) over(order by seq desc) AS nextseq 
           , lead(subject,1) over(order by seq desc) AS nextsubject
    from tbl_board
    where status = 1
) V 
where V.seq = 2;


update tbl_board set subject = '호호호'
                   , content = '하하하'
where seq = 2 and pw = '7890';


------------------------------------------------------------------------
   ----- **** 댓글 게시판 **** -----

/* 
  댓글쓰기(tbl_comment 테이블)를 성공하면 원게시물(tbl_board 테이블)에
  댓글의 갯수(1씩 증가)를 알려주는 컬럼 commentCount 을 추가하겠다. 
*/
drop table tbl_board purge;

create table tbl_board
(seq           number                not null    -- 글번호
,fk_userid     varchar2(20)          not null    -- 사용자ID
,name          varchar2(20)          not null    -- 글쓴이 
,subject       Nvarchar2(200)        not null    -- 글제목
,content       Nvarchar2(2000)       not null    -- 글내용   -- clob (최대 4GB까지 허용) 
,pw            varchar2(20)          not null    -- 글암호
,readCount     number default 0      not null    -- 글조회수
,regDate       date default sysdate  not null    -- 글쓴시간
,status        number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,commentCount  number default 0      not null    -- 댓글의 개수
,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

drop sequence boardSeq;

create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


----- **** 댓글 테이블 생성 **** -----
create table tbl_comment
(seq           number               not null   -- 댓글번호
,fk_userid     varchar2(20)         not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 댓글내용
,regDate       date default sysdate not null   -- 작성일자
,parentSeq     number               not null   -- 원게시물 글번호
,status        number(1) default 1  not null   -- 글삭제여부
                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,constraint PK_tbl_comment_seq primary key(seq)
,constraint FK_tbl_comment_userid foreign key(fk_userid) references tbl_member(userid)
,constraint FK_tbl_comment_parentSeq foreign key(parentSeq) references tbl_board(seq) on delete cascade
,constraint CK_tbl_comment_status check( status in(1,0) ) 
);

create sequence commentSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

select *
from tbl_comment
order by seq desc;

select *
from tbl_board
order by seq desc;

select *
from tbl_member;

update tbl_member set point = 0;

commit;

-- ==== Transaction 처리를 위한 시나리오 만들기 ==== --
---- 회원들이 게시판에 글쓰기를 하면 글작성 1건당 POINT 를 100점을 준다.
---- 회원들이 게시판에서 댓글쓰기를 하면 댓글작성 1건당 POINT 를 50점을 준다.
---- 그런데 POINT 는 300을 초과할 수 없다.

-- tbl_member 테이블에 POINT 컬럼에 Check 제약을 추가한다.

alter table tbl_member
add constraint CK_tbl_member_point check( point between 0 and 300 );
-- Table TBL_MEMBER이(가) 변경되었습니다.

update tbl_member set point = 301
where userid = 'seoyh';
/*
오류 보고 -
ORA-02290: check constraint (MYMVC_USER.CK_TBL_MEMBER_POINT) violated
*/

update tbl_member set point = 300
where userid = 'seoyh';

commit;


select *
from tbl_board
order by seq desc;


insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'seoyh', '서영학', '즐거운 하루 되세요~~', '오늘도 늘 행복하게~~', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'emojh', '엄정화', '오늘도 즐거운 수업을 합시다', '기분이 좋은 하루 되세요^^', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'seoyh', '서영학', '기분좋은 날 안녕하신가요?', '모두 반갑습니다', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'seoyh', '서영학', '모두들 즐거이 퇴근하세요 안녕~~', '건강이 최고 입니다.', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'eomjh', '엄정화', 'java가 재미 있나요?', '궁금합니다. java가 뭔지요?', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'leess', '이순신', '프로그램은 JAVA 가 쉬운가요?', 'java에 대해 궁금합니다', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'seoyh', '서영학', 'JSP 가 뭔가요?', '웹페이지를 작성하려고 합니다.', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'eomjh', '엄정화', 'Korea VS Japan 라이벌 축구대결', '많은 시청 바랍니다.', '1234', default, default, default);

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status)
values(boardSeq.nextval, 'leess', '이순신', '날씨가 많이 쌀쌀합니다.', '건강에 유의하세요~~', '1234', default, default, default);

commit;


select *
from tbl_board
order by seq desc;


select seq, fk_userid, name, subject  
		     , readcount, to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') as regDate
		     , commentCount 
		from tbl_board
		where status = 1
        and lower(subject) like '%'|| lower('jA') ||'%'
		order by seq desc;
        
        
select subject        
from tbl_board
where status = 1
and lower(subject) like '%'|| lower('jA') ||'%'
order by seq desc;

select seq, fk_userid, name, subject, readCount, regDate, commentCount 
from 
(
select row_number() over(order by seq desc) AS rno,
       seq, fk_userid, name, subject, readCount, 
       to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') AS regDate,
       commentCount
from tbl_board
where status = 1 
-- and lower(subject) like '%'|| lower('jA') ||'%'
) V 
where rno between 1 and 10; -- 1페이지 


select seq, fk_userid, name, subject, readCount, regDate, commentCount 
from 
(
select row_number() over(order by seq desc) AS rno,
       seq, fk_userid, name, subject, readCount, 
       to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') AS regDate,
       commentCount
from tbl_board
where status = 1 
-- and lower(subject) like '%'|| lower('jA') ||'%'
) V 
where rno between 11 and 20; -- 2페이지 


-----------------------------------------------------------------------------
desc tbl_comment;

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '두번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '세번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '네번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '다섯번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '여섯번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '일곱번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '여덟번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '아홉번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '열번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '열한번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '열두번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '열세번째 댓글입니다.', 12);

insert into tbl_comment(seq, fk_userid, name, content, parentseq)
values(commentSeq.nextval, 'seoyh', '서영학', '열네번째 댓글입니다.', 12);

commit;

update tbl_board set commentcount = 14
where seq = 12; 

commit;

select * 
from tbl_comment
order by seq desc;


select name, content, regDate
from 
(
select row_number() over(order by seq desc) as rno, name, content, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regDate
from tbl_comment
where status = 1 and parentseq = 12
) V
where rno between 1 and 5;  -- 댓글의 1페이지 


select name, content, regDate
from 
(
select row_number() over(order by seq desc) as rno, name, content, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regDate
from tbl_comment
where status = 1 and parentseq = 12
) V
where rno between 6 and 10;  -- 댓글의 2페이지 


select name, content, regDate
from 
(
select row_number() over(order by seq desc) as rno, name, content, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regDate
from tbl_comment
where status = 1 and parentseq = 12
) V
where rno between 11 and 15;  -- 댓글의 3페이지 


--------------------------------------------------------------------------------------------------------------
          ------ ****** 댓글 및 답변글 및 파일첨부가 있는 게시판 ****** ------

drop table tbl_comment purge;

drop sequence commentSeq;

drop table tbl_board purge;

drop sequence boardSeq;

create table tbl_board
(seq           number                not null    -- 글번호
,fk_userid     varchar2(20)          not null    -- 사용자ID
,name          varchar2(20)          not null    -- 글쓴이 
,subject       Nvarchar2(200)        not null    -- 글제목
,content       Nvarchar2(2000)       not null    -- 글내용   -- clob (최대 4GB까지 허용) 
,pw            varchar2(20)          not null    -- 글암호
,readCount     number default 0      not null    -- 글조회수
,regDate       date default sysdate  not null    -- 글쓴시간
,status        number(1) default 1   not null    -- 글삭제여부   1:사용가능한 글,  0:삭제된글
,commentCount  number default 0      not null    -- 댓글의 개수 

,groupno       number                not null    -- 답변글쓰기에 있어서 그룹번호 
                                                 -- 원글(부모글)과 답변글은 동일한 groupno 를 가진다.
                                                 -- 답변글이 아닌 원글(부모글)인 경우 groupno 의 값은 groupno 컬럼의 최대값(max)+1 로 한다.

,fk_seq         number default 0      not null   -- fk_seq 컬럼은 절대로 foreign key가 아니다.!!!!!!
                                                 -- fk_seq 컬럼은 자신의 글(답변글)에 있어서 
                                                 -- 원글(부모글)이 누구인지에 대한 정보값이다.
                                                 -- 답변글쓰기에 있어서 답변글이라면 fk_seq 컬럼의 값은 
                                                 -- 원글(부모글)의 seq 컬럼의 값을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.

,depthno        number default 0       not null  -- 답변글쓰기에 있어서 답변글 이라면
                                                 -- 원글(부모글)의 depthno + 1 을 가지게 되며,
                                                 -- 답변글이 아닌 원글일 경우 0 을 가지도록 한다.

,fileName       varchar2(255)                    -- WAS(톰캣)에 저장될 파일명(2020120809271535243254235235234.png)                                       
,orgFilename    varchar2(255)                    -- 진짜 파일명(강아지.png)  // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
,fileSize       number                           -- 파일크기  

,constraint PK_tbl_board_seq primary key(seq)
,constraint FK_tbl_board_fk_userid foreign key(fk_userid) references tbl_member(userid)
,constraint CK_tbl_board_status check( status in(0,1) )
);

create sequence boardSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


create table tbl_comment
(seq           number               not null   -- 댓글번호
,fk_userid     varchar2(20)         not null   -- 사용자ID
,name          varchar2(20)         not null   -- 성명
,content       varchar2(1000)       not null   -- 댓글내용
,regDate       date default sysdate not null   -- 작성일자
,parentSeq     number               not null   -- 원게시물 글번호
,status        number(1) default 1  not null   -- 글삭제여부
                                               -- 1 : 사용가능한 글,  0 : 삭제된 글
                                               -- 댓글은 원글이 삭제되면 자동적으로 삭제되어야 한다.
,constraint PK_tbl_comment_seq primary key(seq)
,constraint FK_tbl_comment_userid foreign key(fk_userid) references tbl_member(userid)
,constraint FK_tbl_comment_parentSeq foreign key(parentSeq) references tbl_board(seq) on delete cascade
,constraint CK_tbl_comment_status check( status in(1,0) ) 
);

create sequence commentSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;


desc tbl_board;


begin
    for i in 1..100 loop
        insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status, groupno)
        values(boardSeq.nextval, 'leess', '이순신', '이순신 입니다'||i, '안녕하세요? 이순신'|| i ||' 입니다.', '1234', default, default, default, i);
    end loop;
end;


begin
    for i in 101..200 loop
        insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status, groupno)
        values(boardSeq.nextval, 'eomjh', '엄정화', '엄정화 입니다'||i, '안녕하세요? 엄정화'|| i ||' 입니다.', '1234', default, default, default, i);
    end loop;
end;

commit;


select *
from tbl_board
order by seq desc;


---- **** 답변글쓰기는 일반회원은 불가하고 직원(관리자)들만 답변글쓰기가 가능하도록 한다 **** ----
select *
from tbl_member;

-- *** tbl_member 테이블에 gradelevel 이라는 컬럼을 추가하겠다. *** --
alter table tbl_member
add gradelevel number default 1;

-- *** 직원(관리자)들에게는 gradelevel 컬럼의 값을 10 으로 부여하겠다. gradelevel 컬럼의 값이 10 인 직원들만 답변글쓰기가 가능하다 *** --
update tbl_member set gradelevel = 10
where userid in('admin','seoyh');

commit;


--- *** 글번호 197 에 대한 답변글쓰기를 한다라면 아래와 같이 insert 를 해야 한다. *** ---
select *
from tbl_board
where seq = 197;

insert into tbl_board(seq, fk_userid, name, subject, content, pw, readCount, regDate, status, groupno, fk_seq, depthno)
values(boardSeq.nextval, 'admin', '관리자', '글번호 197에 대한 답변글입니다', '답변내용 입니다. 행복하세요~~', '1234', default, default, default, 197, 197, 1);

commit;

---- *** 답변글이 있을시 글목록 보여주기 *** ----
select *
from tbl_board
order by seq desc;


--- *** 계층형 쿼리(답변형 게시판) *** ---
select seq, fk_userid, name, subject, readCount, regDate, commentCount  
     , groupno, fk_seq, depthno
from 
(
    select rownum AS rno
         , seq, fk_userid, name, subject, readCount, regDate, commentCount  
         , groupno, fk_seq, depthno 
    from 
    (
        select seq, fk_userid, name, subject, readCount, 
               to_char(regDate, 'yyyy-mm-dd hh24:mi:ss') AS regDate,
               commentCount, 
               groupno, fk_seq, depthno 
        from tbl_board
        where status = 1 
        start with fk_seq = 0 
        connect by prior seq = fk_seq    --- connect by prior 다음에 나오는 컬럼 seq은 start with 되어지는 행의 컬럼이다.
                                         --- fk_seq 는 start with 되어지는 행이 아닌 다른행에 존재하는 컬럼이다.
        order siblings by groupno desc, seq asc  
        -- order siblings by 를 사용하는 이유는 그냥 정렬(order by)하면 계층구조가 깨진다.
        -- 그래서 계층구조를 그대로 유지하면서 동일한 groupno를 가진 행끼리 정렬을 하려면 siblings 를 써야만 한다.
    ) V 
) T 
where rno between 1 and 10;


--- *** tbl_member 테이블에 존재하는 제약조건 조회하기 *** ---
select *
from user_constraints
where table_name = 'TBL_MEMBER';

alter table tbl_member
drop constraint CK_TBL_MEMBER_POINT;























