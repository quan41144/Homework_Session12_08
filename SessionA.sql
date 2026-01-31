create database Homework_session12_08;
-- create table
create table accounts(
	account_id serial primary key,
	account_name varchar(50) not null,
	balance numeric(12,2) not null
);
insert into accounts(account_id, account_name, balance) values (1, 'Alice', 1000.00);
-- READ COMMITTED
-- Session A:
begin;
select balance from accounts where account_id = 1;
-- chờ Session B update
select balance from accounts where account_id = 1;
commit;
-- REPEATABLE READ
begin;
set transaction isolation level repeatable read;
select balance from accounts where account_id = 1;
-- Chờ session B update
select balance from accounts where account_id = 1;
commit;

-- Ghi nhận kết quả và nêu cách tránh Non-Repeatable Read
-- Nâng cấp Isolation Level: Sử dụng ít nhất là REPEATABLE READ hoặc SERIALIZABLE.