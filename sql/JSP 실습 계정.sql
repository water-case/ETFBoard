alter table etf_member modify joindate date default sysdate;

--시퀀스 조회
select boardreplygroup_index.currval from dual;

SELECT boardreplygroup_index.NEXTVAL FROM DUAL;


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

-- 시퀀스 cache 옵션을 사용하지 않도록 변경
alter sequence board_index nocache;
-- 게시글 시퀀스 삭제
drop sequence board_index;
-- 댓글 인덱스 삭제
drop sequence boardreply_index;
-- 댓글 그룹 인덱스 삭제
drop sequence boardreplygroup_index;

-- 삽입
insert into etf_board (boardindex, title, text, name)
values(board_index.nextval, '테스트'||board_index.currval, '테스트입니다'||board_index.currval, 'dummy'||board_index.currval);

commit;
-- 조회테스트
select * from etf_board order by boardIndex desc;

select sysdate from dual;

select parameter, value from nls_database_parameters where parameter like '%char%';

-- board & member 외래키
alter table etf_board add foreign key(name) references etf_member(name) on delete cascade;