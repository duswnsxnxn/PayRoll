CREATE DATABASE cal default CHARACTER SET UTF8;
CREATE DATABASE thuman0503 default CHARACTER SET UTF8; 

-- 사용자 테이블
create table PAYROLL_USER (
user_no int,
user_id varchar(20),
pwd varchar(20) not null,
name varchar(20) not null,
phone varchar(20) not null,
gender tinyint not null,
age smallint not null,
grade tinyint not null, 
CONSTRAINT PAYROLL_USER PRIMARY KEY (user_no)
)

-- 근무자 스케쥴 테이블
create table PAYROLL_SCHEDULE (
user_no int,
schedule_no int,
name varchar(20) not null,
work_start_time varchar(20) not null,
work_end_time varchar(20) not null,
work_start_date varchar(20) not null,
work_end_date varchar(20) not null,
reg_date datetime,
update_date datetime,
constraint PAYROLL_USER foreign key(user_no) references PAYROLL_USER(user_no),
PRIMARY KEY (user_no, schedule_no, work_start_time, work_end_time, work_start_date, work_end_date)
)

-- 근무자 월급 테이블
create table PAYROLL_SALARY (
user_no int,
schedule_no int,
worktime int,
totalWorktime int,
workDay int,
salary int default 0,
pay int default 9160,
checked_days varchar(50),
contractDay int,
constraint PAYROLL_SALARY primary key(user_no,schedule_no)
)