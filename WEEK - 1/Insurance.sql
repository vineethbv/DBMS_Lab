show databases;
create database Insurance;
use Insurance;

create table PERSON(driver_id char(5) not null primary key, name char(25) not null, address char(50) not null);
create table CAR(reg_num char(7) not null primary key, model char(15) not null, year int not null);
create table ACCIDENT(report_num int not null primary key, accident_date date not null, location char(20) not null);
create table OWNS(driver_id char(5) not null, reg_num char(7) not null, foreign key (driver_id) references PERSON(driver_id), foreign key (reg_num) references CAR(reg_num));
create table PARTICIPATED (driver_id char(5) not null, reg_num char(7) not null, report_num int not null, damage_amount int, foreign key (driver_id) references PERSON(driver_id), foreign key (reg_num) references CAR(reg_num), foreign key (report_num) references ACCIDENT(report_num));

show tables;

insert into PERSON values('00001', 'Adam', '#255, Park Street, California'), ('00002', 'John', '#154, Back Street, Washington'), ('00003', 'Timmy', '#334, Grand Eastern Estate, Park Street, Texas'), ('00004', 'Eric', '#252, Park Street, California'),('00005', 'Bob', '#451, Northern Brigade, Blue Street, Iowa');

select * from PERSON;

insert into CAR values('CA8051', 'Lamborghini', 2008), ('WA5002', 'Ferrari', 2010), ('TX2103', 'Merecedes Benz', 2014), ('CA4421', 'Jaguar', 2017), ('IO1326', 'BMW', 2021);

select * from CAR;

insert into ACCIDENT values(01, '2008-03-05', 'Los Angeles'), (02, '2010-10-11', 'Washington'), (03, '2014-09-30', 'San Diego'), (04, '2017-08-15', 'Texas'), (05, '2021-01-02', 'Iowa');

select * from ACCIDENT;

insert into OWNS values('00001', 'CA8051'), ('00002', 'WA5002'), ('00003', 'TX2103'), ('00004', 'CA4421'), ('00005', 'IO1326');

select * from OWNS;

insert into PARTICIPATED values('00001', 'CA8051', 1, 3200000), ('00002', 'WA5002', 2, 4500000), ('00003', 'TX2103', 3, 100000), ('00004', 'CA4421', 4, 2500000), ('00005', 'IO1326', 5, 100000);

select * from PARTICIPATED;

update PARTICIPATED set damage_amount=50000 where driver_id="00001";

select * from PARTICIPATED;

insert into ACCIDENT values(06, '2021-03-05', 'Alaska');
insert into PARTICIPATED values('00001', 'CA8051', 6, 3200000);
select count(distinct driver_id) CNT from participated a, accident b where a.report_num=b.report_num and b.accident_date like '2008%';
select count(driver_id) CNT from participated a, car c where a.reg_num=c.reg_num and c.model like 'Lamborghini';
