-- created supplied_parts schema 
create table supplied_parts.S(
	sid varchar(20) not null,
	sname varchar(20),
	address varchar(50),
	primary key (sid)
	);
-- need to modify varchar for sname and address
alter table supplied_parts.S modify sname varchar(50); 
alter table supplied_parts.S modify address varchar(100); 
--------------------------------------------------------------------------------------   
create table supplied_parts.P(
	pid varchar(20) not null,
	pname varchar(20), 
	color varchar(15),
	primary key(pid)
	);
-- need to modify varchar for pname
alter table supplied_parts.P modify pname varchar(50);
alter table supplied_parts.P add foreign key (sid) references supplied_parts.S(sid);  
--------------------------------------------------------------------------------------      
create table supplied_parts.C(
	sid varchar(20) not null,
	pid varchar(20) not null,
	cost int not null
	);	
--------------------------------------------------------------------------------------   
insert into supplied_parts.S values(1,'Acme Widget Suppliers','1 Grub St., Potemkin Village, IL 61801'); 
insert into supplied_parts.S values(2,'Big Red Tool and Die',"4 My Way, Bermuda Shorts, OR 90305");  
insert into supplied_parts.S values(3,'Perfunctory Parts',"99999 Short Pier, Terra Del Fuego, TX 41299");
insert into supplied_parts.S values(4,'Alien Aircaft Inc.',"2 Groom Lake, Rachel, NV 51902"); 
select * from supplied_parts.S; 

insert into supplied_parts.P values(1,'Left Handed Bacon Stretcher Cover','Red');
insert into supplied_parts.P values(2,'Smoke Shifter End','Black');
insert into supplied_parts.P values(3,'Acme Widget Washer','Red');
insert into supplied_parts.P values(4,'Acme Widget Washer','Silver');
insert into supplied_parts.P values(5,'I Brake for Crop Circles Sticker','Translucent');
insert into supplied_parts.P values(6,'Anti-Gravity Turbine Generator','Cyan');
insert into supplied_parts.P values(7,'Anti-Gravity Turbine Generator','Magenta');
insert into supplied_parts.P values(8,'Fire Hydrant Cap','Red');
insert into supplied_parts.P values(9,'7 Segment Display','Green'); 
select * from supplied_parts.P; 

insert into supplied_parts.C values(1,3,0.50);
insert into supplied_parts.C values(1,4,0.50); 
insert into supplied_parts.C values(1,8,11.70); 
insert into supplied_parts.C values(2,3,0.55); 
insert into supplied_parts.C values(2,8,7.95); 
insert into supplied_parts.C values(2,1,16.50); 
insert into supplied_parts.C values(3,8,12.50);
insert into supplied_parts.C values(3,9,1.00); 
insert into supplied_parts.C values(4,5,2.20); 
insert into supplied_parts.C values(4,6,1247548.23); 
insert into supplied_parts.C values(4,7,1247548.23);
select * from supplied_parts.C;
--------------------------------------------------------------------------------------
select sname, address from supplied_parts.S;
--------------------------------------------------------------------------------------
select sname, pname from supplied_parts.S, supplied_parts.P;
--------------------------------------------------------------------------------------
select distinct sname, address from supplied_parts.S;
select upper(sname) as sname, address from supplied_parts.S;