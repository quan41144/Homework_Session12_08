-- Session B:
-- READ COMMITTED
begin;
update accounts set balance = balance - 200 where account_id = 1;
commit;

-- REPEATABLE READ
update accounts set balance = 400 where account_id = 1;
commit;