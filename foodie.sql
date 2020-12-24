select store.code, info.store_name, menu.menu
from store_korea store
join store_info info
on store.code = info.fk_store_code
join store_menu menu
on info.fk_store_code = menu.fk_store_code
where info.store_name like '%BHC%' and store.addr_new like '%둔산동%';

SELECT rownum, STORE.CODE, STORE.TYPE, STORE.OPEN_STATUS, STORE.HYGINE, STORE.NAME, STORE.CALL,
nvl(STORE.POSTCODE_NEW, STORE.postcode_old) as postcode, nvl(STORE.addr_NEW, STORE.addr_old) as address
FROM ( SELECT CODE, DIST_CODE, OPEN_STATUS, STATUS_DETAIL, CALL, POSTCODE_OLD, ADDR_OLD, POSTCODE_NEW, ADDR_NEW,
NAME, BUSINESS_TYPE, COORDINATES_X, COORDINATES_Y, HYGIENE_TYPE AS HYGINE, BUSINESS_TYPE AS BUSINESS, TYPE,
NAME || ADDR_OLD || ADDR_NEW || HYGIENE_TYPE || BUSINESS_TYPE || NAME || ADDR_OLD || ADDR_NEW || HYGIENE_TYPE || BUSINESS_TYPE AS SEARCH_ALL
FROM STORE_KOREA WHERE STATUS_DETAIL = '영업' ) STORE
WHERE LOWER(REPLACE(TRIM(STORE.SEARCH_ALL), ' ', ''))
LIKE LOWER(REPLACE(TRIM('%크리스피크림%'), ' ', ''));

STORE_INFO
STORE_KOREA
STORE_MENU
TBL_LOGINHISTORY
TBL_MEMBER

select * from tab;
select * from TBL_MEMBER;
select * from TBL_LOGINHISTORY;
select * from STORE_MENU;

select * from STORE_INFO;

select *
from user_constraints
where table_name = 'TBL_MEMBER';
	
-- === 회원가입 해주기 start === -->
	<insert id="">
		insert into tbl_member(no, type, kakaoid, name, email, pwd, mobile, registerday, status, idle)
                values(memberSeq.nextval, null, null, #{name}, #{email}, #{pwd}, #{mobile}, default, default, default)
	</insert>
-- === 회원가입 해주기 end === -->

select * from tbl_member where email = 'sser';

insert into tbl_member(no, type, kakaoid, name, email, pwd, mobile, registerday, status, idle)
values(seq_memberno.nextval, null, null,'exam01','exam01@google.com','qwer1234$','010-4321-4321',default,default,default);


insert into tbl_member(no, type, kakaoid, name, email, pwd, mobile, registerday, status, idle)
values(seq_memberno.nextval, '1', '1558216196', '최지훈', 'sist1234@naver.com', 'qwer1234$', '01095451492', default, default, default);

INSERT INTO TBL_MEMBER(NO, TYPE, KAKAOID, NAME, EMAIL, PWD, MOBILE, REGISTERDAY, STATUS, IDLE)
VALUES(SEQ_MEMBERNO.NEXTVAL, DEFAULT, DEFAULT, '최지훈', 'sist2222@naver.com', 'qwer1234$', '01095451492', DEFAULT, DEFAULT, DEFAULT);

select * from tbl_member;

