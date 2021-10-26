alter table etf_member modify joindate date default sysdate;

-- 인덱스 시퀀스
create sequence board_index
start with 1
increment by 1
nomaxvalue
nominvalue;
-- 시퀀스 cache 옵션을 사용하지 않도록 변경
alter sequence board_index nocache;
-- 시퀀스 삭제
drop sequence board_index ;

-- 삽입
insert into etf_board (boardindex, title, text, name)
values(board_index.nextval, '테스트', '테스트입니다', 'dummy');

commit;
-- 조회테스트
select * from etf_board order by boardIndex desc;

select sysdate from dual;

