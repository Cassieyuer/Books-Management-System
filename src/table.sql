drop table bookpic;
drop table book;
drop table category;

select * from book;

create table category(
	id varchar2(32) primary key,
	name varchar2(32)
);

create table book(
	id varchar2(32) primary key,
	name varchar2(32),
	price number(5),
	author varchar2(32),
	publishdate date,
	status varchar2(5),
	categoryid varchar2(32),
	foreign key(categoryid) references category(id)
);

create table bookpic(
	id varchar2(32) primary key,
	savepath varchar2(200),
	showname varchar2(100),
	fm varchar2(5),
	bookid varchar2(32),
	foreign key(bookid) references book(id)
);