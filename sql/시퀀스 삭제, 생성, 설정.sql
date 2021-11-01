--시퀀스 조회
select boardreply_index.currval from dual;
SELECT boardreply_index.NEXTVAL FROM DUAL;

-- 게시글 인덱스 시퀀스
create sequence board_index
start with 1
increment by 1
nomaxvalue
nominvalue;
-- 댓글 인덱스 시퀀스
create sequence boardreply_index
start with 1
increment by 1
nomaxvalue
nominvalue;
-- 댓글 그룹 인덱스 시퀀스
create sequence boardreplygroup_index
start with 1
increment by 1
nomaxvalue
nominvalue;

-- 게시글 시퀀스 삭제
drop sequence board_index;
-- 댓글 인덱스 삭제
drop sequence boardreply_index;
-- 댓글 그룹 인덱스 삭제
drop sequence boardreplygroup_index;

-- 시퀀스 cache 옵션을 사용하지 않도록 변경
alter sequence board_index nocache;
alter sequence boardreply_index nocache;
alter sequence boardreplygroup_index nocache;

insert into etf_mock (name, itemcode)
		values('꼭꼭씹어먹어', '278530');
select * from etf_mock
		where name='꼭꼭씹어먹어';

delete from (select name, itemcode from etf_mock where name='꼭꼭씹어먹어') where itemcode=157490;


