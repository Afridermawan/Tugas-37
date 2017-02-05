create database perpustakaan;
use perpustakaan;
create table college_student (id int(11) primary key auto_increment, 
	name varchar(255), 
	gender varchar(255), 
	phone_number varchar(255), 
	address text);
insert into college_student (`name`, `gender`, `phone_number`, `address`) 
	values 
	('afri dermawan ginting', 'pria', '081285338513', 'yogyakarta');
insert into college_student (`name`, `gender`, `phone_number`, `address`) 
	values 
	('rani santia mika', 'wanita', '082277119212', 'binjai');
insert into college_student (`name`, `gender`, `phone_number`, `address`) 
	values 
	('randy elmana putra', 'pria', '082164662354', 'siantar');
insert into college_student (`name`, `gender`, `phone_number`, `address`) 
	values 
	('ardiansyah', 'pria', '087844561244', 'rantauprapat');
insert into college_student (`name`, `gender`, `phone_number`, `address`) 
	values 
	('mardiansyah', 'pria', '091276723651', 'malang');

create table books (id int(11) primary key auto_increment, 
	bookshelf_id int(11), 
	publisher_id int(11), 
	author_id int(11), 
	employee_id int(11), 
	tittle varchar(255), 
	amount int(11), 
	publication_year varchar(50), 
	date_created timestamp, 
	date_update datetime, 
	deleted int(1));
insert into books (`bookshelf_id`, `publisher_id`, `author_id`, `employee_id`, `tittle`, `amount`, `publication_year`, `date_update`, `deleted`) 
	values (1,1,1,1, 'la tahzan', 10, 2003, now(), 0);
insert into books (`bookshelf_id`, `publisher_id`, `author_id`, `employee_id`, `tittle`, `amount`, `publication_year`, `date_update`, `deleted`) 
	values (3,2,2,2, 'cinta brontosaurus', 20, 2006, now(), 0);
insert into books (`bookshelf_id`, `publisher_id`, `author_id`, `employee_id`, `tittle`, `amount`, `publication_year`, `date_update`, `deleted`) 
	values (3,2,2,3, 'kambing jantan', 15, 2006, now(), 0);
insert into books (`bookshelf_id`, `publisher_id`, `author_id`, `employee_id`, `tittle`, `amount`, `publication_year`, `date_update`, `deleted`) 
	values (1,3,3,3, 'kamus santri baru', 30, 2016, now(), 0);
insert into books (`bookshelf_id`, `publisher_id`, `author_id`, `employee_id`, `tittle`, `amount`, `publication_year`, `date_update`, `deleted`) 
	values (2,4,4,4, 'tenggelamnya kapal van der wijck', 5, 1938, now(), 0);

create table category (id int(11) primary key auto_increment, name varchar(255));
insert into category (`name`) 
	values ('novel');
insert into category (`name`) 
	values ('komedi');
insert into category (`name`) 
	values ('keagamaan');

create table books_category (books_id int(11), category_id int(11));
insert into books_category values 
('1', '3'),
('2', '2'),
('3', '2'),
('4', '3'),
('5', '1');

create table bookshelf (id int(11) primary key auto_increment, location_code varchar(255));
insert into bookshelf (`location_code`) values ('R01');
insert into bookshelf (`location_code`) values ('R02');
insert into bookshelf (`location_code`) values ('R03');

create table author (id int(11) primary key auto_increment, name varchar(255));
insert into author (`name`) values ('Dr.Aidht Al-Qorni');
insert into author (`name`) values ('Raditya dika');
insert into author (`name`) values ('Zaid abdillah Al-fatih');
insert into author (`name`) values ('Abdul malik karim amrullah');

create table publisher (id int(11) primary key auto_increment, name varchar(255));
insert into publisher (`name`) values ('Qisthi press');
insert into publisher (`name`) values ('GagasMedia');
insert into publisher (`name`) values ('Swasta Hamka');

create table borrow (id int(11) primary key auto_increment, 
	college_student_id int(11), 
	employee_id int(11), 
	dated_borrowing date, 
	the_time_limit_borrowing date, 
	date_added timestamp, 
	date_update datetime, 
	deleted int(1));
alter table borrow modify date_added datetime;
alter table borrow modify date_update timestamp;
insert into borrow (`college_student_id`, `employee_id`, `dated_borrowing`, `the_time_limit_borrowing`, `date_added`, `deleted`) values 	
	(1, 2, '2017-02-03', '2017-02-08', now(), 0),
	(4, 3, '2017-02-04', '2017-02-09', now(), 0),
	(2, 1, '2017-02-05', '2017-02-10', now(), 0),
	(3, 4, '2017-02-05', '2017-02-10', now(), 0),
	(5, 5, '2017-02-05', '2017-02-10', now(), 0);


create table borrow_item (id int(11) primary key auto_increment, 
	borrow_id int(11), 
	books_id int(11), 
	number_of_books int(11), 
	date_added timestamp, 
	date_update datetime, 
	deleted int(1));
alter table borrow_item modify date_added datetime;
alter table borrow_item modify date_update timestamp;
insert into borrow_item (`borrow_id`, `books_id`, `number_of_books`, `date_added`, `deleted`) values 
	(1, 1, 2, now(), 0),
	(1, 2, 1, now(), 0),
	(2, 5, 1, now(), 0),
	(2, 3, 1, now(), 0),
	(3, 5, 1, now(), 0),
	(4, 4, 3, now(), 0),
	(5, 4, 2, now(), 0);

create table returned (id int(11) primary key auto_increment, 
	books_id int(11), 
	employee_id int(11), 
	date_of_return date, 
	date_added timestamp, 
	date_update datetime, 
	deleted int(11));
alter table returned modify date_added datetime;
alter table returned modify date_update timestamp;
insert into returned (`books_id`, `employee_id`, `date_of_return`, `date_added`, `deleted`) values 
	(1, 2, '2017-02-09', now(), 0),
	(2, 2, '2017-02-09', now(), 0),
	(5, 3, '2017-02-10', now(), 0),
	(3, 3, '2017-02-10', now(), 0),
	(5, 1, '2017-02-11', now(), 0),
	(4, 4, '2017-02-11', now(), 0),
	(4, 5, '2017-02-11', now(), 0);

create table returned_item (id int(11) primary key auto_increment, 
	returned_id int(11), 
	books_id int(11), 
	employee_id int(11), 
	date_added timestamp, 
	date_update datetime, 
	deleted int(1)); 
alter table returned_item modify date_added datetime;
alter table returned_item modify date_update timestamp;
insert into returned_item (`returned_id`, `books_id`, `employee_id`, `date_added`, `deleted`) values 
	(1, 1, 2, now(), 0),
	(2, 2, 2, now(), 0),
	(3, 5, 3, now(), 0),
	(4, 3, 3, now(), 0),
	(5, 5, 1, now(), 0),
	(6, 4, 4, now(), 0),
	(7, 4, 5, now(), 0);

create table penalties (id int(11) primary key auto_increment, 
	borrow_id int(11), 
	employee_id int(11), 
	nominal_of_penalties int(50), 
	date_added timestamp, 
	date_update datetime, 
	deleted int(1));
alter table	penalties modify date_added datetime;
alter table penalties modify date_update timestamp;
insert into penalties (`borrow_id`, `employee_id`, `nominal_of_penalties`, `date_added`, `deleted`)values 
	(1, 2, '3000', now(), 0),
	(2, 3, '6000', now(), 0),
	(3, 1, '15000', now(), 0),
	(4, 4, '15000', now(), 0),
	(4, 5, '7000', now(), 0);

create table regulatory_penalties (id int(11) primary key auto_increment, 
	number_of_days varchar(255), 
	nominal_of_penalties int(50));
insert into regulatory_penalties (`number_of_days`, `nominal_of_penalties`) values ('one month', '500');

create table penalties_item (id int(11) primary key auto_increment, 
	books_id int(11), 
	regulatory_penalties_id int(11), 
	employee_id int(11), 
	late varchar(255),
	nominal int(50), 
	date_added timestamp, 
	date_update datetime, 
	deleted int(1));
alter table penalties_item modify date_added datetime;
alter table penalties_item modify date_update timestamp;
insert into penalties_item (`books_id`, `regulatory_penalties_id`, `employee_id`, `late`, `nominal`, `date_added`, `deleted`) values 
	(1, 1, 2, 'three days', '1500', now(), 0),
	(2, 1, 2, 'three days', '1500', now(), 0),
	(5, 1, 3, 'six day', '3000', now(), 0),
	(3, 1, 3, 'six day', '3000', now(), 0),
	(5, 1, 1, 'one month', '15000', now(), 0),
	(4, 1, 4, 'three month', '15000', now(), 0),
	(4, 1, 5, 'two weeks', '7000', now(), 0);

create table employee (id int(11) primary key auto_increment, 
	name varchar(255), 
	phone_number varchar(50), 
	email varchar(255), 
	username varchar(255), 
	password varchar(255), 
	address text, 
	last_login timestamp);
insert into employee (`name`, `phone_number`, `email`, `username`, `password`, `address`, `last_login`) values 
	('Kim taqim', '081233678798', 'kimtaqim@gmail.com', 'kim taqim', 'akumasukya', 'Bekasi', now());
insert into employee (`name`, `phone_number`, `email`, `username`, `password`, `address`, `last_login`) values
	('Febrianti', '082277861650', 'febrianti@gmail.com', 'febrianti', 'silahkanmasuk', 'lampung', now());
insert into employee (`name`, `phone_number`, `email`, `username`, `password`, `address`, `last_login`) values
	('Darmawanti', '081934431781', 'darmawanti@yahoo.com', 'darmawanti', 'yokyokmari', 'malang', now());
insert into employee (`name`, `phone_number`, `email`, `username`, `password`, `address`, `last_login`) values
	('Joko marwanto', '081256789101', 'jokomarwanto@gmail.com', 'Joko marwanto', 'brother', 'yogyakarta', now());
insert into employee (`name`, `phone_number`, `email`, `username`, `password`, `address`, `last_login`) values
	('Meli ariska', '082278871921', 'meliariska@yahoo.com', 'meli ariska', 'cewekece', 'bandung', now());
