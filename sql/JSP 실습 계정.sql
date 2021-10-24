alter table etf_member modify joindate date default sysdate;

--인덱스 시퀀스
create sequence board_index
start with 1
increment by 1
nomaxvalue
nominvalue;

-- 삽입
insert into etf_board (text_index, title, text, name)
values(board_index.nextval, '테스트1번', '테스트입니다', 'watercase');
