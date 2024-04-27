



CREATE SEQUENCE Sobuj_Id 
INCREMENT BY 2
START WITH 100
MAXVALUE 999999
NOCACHE
NOCYCLE;

CREATE TABLE  sobuj
(id number (5)default sobuj_Id.nextval constraint sys_sobuj_Id primary key ,
Name varchar2 (30) not null,
Phone number (11) not null
);

insert into sobuj 
values (default,'nusrat',12545456);


DESCRIBE sobuj

select * from sobuj