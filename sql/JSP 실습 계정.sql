alter table etf_member modify joindate date default sysdate;

--�ε��� ������
create sequence board_index
start with 1
increment by 1
nomaxvalue
nominvalue;

-- ����
insert into etf_board (text_index, title, text, name)
values(board_index.nextval, '�׽�Ʈ1��', '�׽�Ʈ�Դϴ�', 'watercase');
