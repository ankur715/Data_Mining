-- shows all databases in MySQL
show databases;

-- create database, use for created tables
create database suppliers_parts;
use suppliers_parts;

-- tables for suppliers, parts, catalog
create table suppliers(
	sid int not null,
	sname varchar(50), 
	address varchar(50),
	primary key(sid)
	);
create table parts(
	pid int not null,
	pname varchar(50), 
	color varchar(15),
	primary key(pid)
	);
create table catalog(
	sid int not null,
    pid int not null,
    cost numeric(10,2) not null,
    primary key (sid,pid),
    foreign key (sid) references suppliers(sid),
    foreign key (pid) references parts(pid)
    );
    
-- insert statements for data    
insert into suppliers values(1,'Acme Widget Suppliers','1 Grub St., Potemkin Village, IL 61801'); 
insert into suppliers values(2,'Big Red Tool and Die',"4 My Way, Bermuda Shorts, OR 90305");  
insert into suppliers values(3,'Perfunctory Parts',"99999 Short Pier, Terra Del Fuego, TX 41299");
insert into suppliers values(4,'Alien Aircaft Inc.',"2 Groom Lake, Rachel, NV 51902"); 
select * from suppliers; 

insert into parts values(1,'Left Handed Bacon Stretcher Cover','Red');
insert into parts values(2,'Smoke Shifter End','Black');
insert into parts values(3,'Acme Widget Washer','Red');
insert into parts values(4,'Acme Widget Washer','Silver');
insert into parts values(5,'I Brake for Crop Circles Sticker','Translucent');
insert into parts values(6,'Anti-Gravity Turbine Generator','Cyan');
insert into parts values(7,'Anti-Gravity Turbine Generator','Magenta');
insert into parts values(8,'Fire Hydrant Cap','Red');
insert into parts values(9,'7 Segment Display','Green'); 
select * from parts; 

insert into catalog values(1,3,0.50);
insert into catalog values(1,4,0.50); 
insert into catalog values(1,8,11.70); 
insert into catalog values(2,3,0.55); 
insert into catalog values(2,8,7.95); 
insert into catalog values(2,1,16.50); 
insert into catalog values(3,8,12.50);
insert into catalog values(3,9,1.00); 
insert into catalog values(4,5,2.20); 
insert into catalog values(4,6,1247548.23); 
insert into catalog values(4,7,1247548.23);
select * from catalog;

-- names of all suppliers and their addresses
select sname,address from suppliers;

-- names of all suppliers and the name of parts that they supply
select sname,pname from (suppliers natural join catalog) natural join parts;

-- names of all parts and their costs
select pname,cost from parts natural join catalog;

-- part names of parts for which there is some supplier
select pname from parts natural join catalog;