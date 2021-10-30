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

-- reply 댓글 대댓글 정렬

select * from etf_boardreply order by groupindex asc, replyindex asc;