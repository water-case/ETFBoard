--시퀀스 조회
select board_index.currval from dual;
SELECT board_index.NEXTVAL FROM DUAL;

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

-- 더미데이터 추가하기
insert into etf_board (boardindex, title, text, name)
		values(board_index.nextval, '더미', '더미', 'watercase');

begin    
    for i in 1..1000
    loop
    insert into etf_board (boardindex, title, text, name)
            values(board_index.nextval, '더미', '더미', 'watercase');
    end loop;
end;

