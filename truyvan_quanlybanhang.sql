use quanlybanhang;
insert into customer(cname, cage)
values ('Minh Quan', 18),
		('Ngoc Oanh', 20),
        ('Hong Ha', 50);	
        use quanlybanhang;
insert into orderlist(cid, odate)
values (1, '2006-03-21'),
		(2, '2006-03-23'),
        (1, '2006-03-16');
insert into product(pname, pprice)
values ('May Giat', 3),
		('Tu Lanh',5),
        ('Dieu Hoa', 7),
        ('Quat', 1),
        ('Bep Dien', 2);
alter table orderdetail modify odqty int;
insert into orderdetail(oid,pid,odqty)
values (1,1,3),
		(1,3,7),
        (1,4,2),
		(2,1,1),
        (3,1,8),
		(2,5,4),
        (2,3,3);
select oid, odate, ototalprice
from orderlist;
select c.cid, c.cname, p.pname, ordt.odqty
from customer c join orderlist ord on c.cid = ord.cid join orderdetail ordt on ord.oid = ordt.oid join product p on ordt.pid = p.pid;
select distinct c.cid, c.cname
from customer c
where c.cid not in (select orderlist.cid from orderlist);
select  o.oid, o.odate, sum(p.pprice * ord.odqty) "oTotalPrice"
from orderlist o join product p join orderdetail ord
where o.oid = ord.oid and ord.pid = p.pid
group by oid;


