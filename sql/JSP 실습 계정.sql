alter table etf_member modify joindate date default sysdate;

-- �ε��� ������
create sequence board_index
start with 1
increment by 1
nomaxvalue
nominvalue;
-- ������ cache �ɼ��� ������� �ʵ��� ����
alter sequence board_index nocache;
-- ������ ����
drop sequence board_index ;

-- ����
insert into etf_board (boardindex, title, text, name)
values(board_index.nextval, '�׽�Ʈ', '�׽�Ʈ�Դϴ�', 'dummy');

commit;
-- ��ȸ�׽�Ʈ
select * from etf_board order by boardIndex desc;

select sysdate from dual;

