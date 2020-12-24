create table tbl_member
(no                number(10)-- 회원번호
,type              varchar2(20)  default 0 not null  -- 가입유형
,kakaoid           varchar2(30)  -- 카카오 아이디 
,name              varchar2(30)  not null  -- 회원명
,email             varchar2(200) not null  -- 이메일 (AES-256 암호화/복호화 대상)
,pwd               varchar2(200) not null  -- 비밀번호 `
,mobile            varchar2(200) not null   -- 연락처 (AES-256 암호화/복호화 대상) 
,registerday      date default sysdate       -- 가입일자 
,status           number(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,idle             varchar2(1) default 0 not null              -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint UQ_tbl_member_email  unique(email)
,constraint CK_tbl_member_type  check(type in(0,1))
,constraint CK_tbl_member_status check( status in(0,1) )
,constraint CK_tbl_member_idle check( idle in(0,1) )
);

create sequence seq_memberno
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

drop table tbl_member;
drop sequence seq_memberno;

insert into tbl_member(no, type, kakaoid, name, email, pwd, mobile, registerday, status, idle)
values(seq_memberno.nextval, '1', '1558216196', '최지훈', 'sser98@naver.com', 'qwer1234$', '01095451492', default, default, default);

insert into tbl_member(no, type, kakaoid, name, email, pwd, mobile, registerday, status, idle)
values(seq_memberno.nextval, '0', null, '최지훈', 'sser89@naver.com', 'qwer1234$', '01095451492', default, default, default);

commit;