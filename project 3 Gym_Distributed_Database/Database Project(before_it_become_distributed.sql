CREATE DATABASE Gym;
DROP DATABASE Gym;

create table Employee(  
Ssn int NOT NULL, 
Fname varchar(50), 
initial varchar(50), 
Lname varchar(50), 
Bdate varchar(50), 
Adress varchar(50), 
Salary int, 
Bouns int, 
Gender char, 
work_hour int, 
Super_ssn int,
constraint EMP_PK primary key (Ssn),
constraint Emp_supervisor_fk
Foreign key (Super_ssn) references Employee (Ssn)
);

create table repairman(
Ssn int not null,
Check_Time time,
CONSTRAINT fr
primary key (Ssn),
);

create table Emp_telephnum(
Ssn int Not Null,
Teleph_num int,
constraint EMP_tel_PK primary key (Ssn,Teleph_num),
CONSTRAINT telph_fk
FOREIGN KEY (Ssn) REFERENCES Employee (Ssn)
);


create table G_branch
(
Branch_num  int  not null,
Branch_name varchar(1000) not null,
Branch_location varchar(1000) not null,
constraint G_branch_pk
primary key(Branch_num)
);

create table Department
(
Essn int,
Gbranch_num int,
Dept_name varchar(50),
constraint Dept_Emp_branch_pk
primary key (Essn,Gbranch_num),
constraint Branch_Dept_fk
foreign key (Gbranch_num) references G_branch(Branch_num),
constraint Emp_Dept_fk
foreign key (Essn) references Employee(Ssn)
);

create table Branch_telephon_num
(
Branch_num int not null,
Branch_telphone_num int ,
constraint Branch_telephon_num_pk
primary key(Branch_num,Branch_telphone_num),
constraint Branch_telephon_num_fk
foreign key (Branch_num) references G_branch(Branch_num)
);

create table Sponser
(
Spon_code int not null,
Spon_name varchar(50),
Spon_location varchar(1000),
constraint Sponser_pk
primary key(Spon_code)
);

create table Sponser_telephon_num
(
Spon_code int not null,
Spon_telephone_num int ,
constraint Sponser_telephon_num_pk
primary key(Spon_code,Spon_telephone_num),
constraint Sponser_telephon_num_fk
foreign key (Spon_code) references Sponser(Spon_code)
);

create table Equipment
(
Equip_code int not null,
Equip_name varchar(1000),
Equip_price int ,
Equip_function varchar(1000),
constraint Equipment_pk
primary key(Equip_code)
);

create table supplied_equipment
(
Spon_code int ,
Equip_code int ,
Delivry_time int ,
constraint Supplied_equipment_pk
primary key(Spon_code,Equip_code),
constraint Supplied_equipment_fk
foreign key (Spon_code) references Sponser(Spon_code),
constraint Supplied_equipment_fk2
foreign key (Equip_code) references Equipment(Equip_code)
);

create table Maintainence(
Rssn int,
Mequip_code int,
Repair_Time time,
CONSTRAINT rrrr
foreign key (Rssn) REFERENCES repairman(Ssn),
CONSTRAINT me
foreign key (Mequip_code) REFERENCES Equipment(Equip_code),
);

create table Membership(

Code int NOT NULL,
Price int,
Feature varchar(50),
Discount int,
Sub_period varchar(50),

constraint Memship_PK
primary key (Code)

);

create table Client(

ID int NOT NULL,
Fname varchar(50),
initial varchar(50),
Lname varchar(50),
Addresss varchar(50),
Gender varchar(25),
M_code int,

constraint Clirnt_PK
primary key (ID),

constraint Code_FK
foreign key (M_code) references Membership (Code)

);

create table Client_telphnum(

ID int NOT NULL,
telph_num varchar(50),

constraint Tele_PK
primary key (ID,telph_num),

constraint Tele_CID
foreign key (ID) references Client (ID)

);
create table supplement(
QR_code varchar(30) not null,
Price int,
Pname varchar(30)not null ,
Descriiption varchar(100),
Supp_Type varchar(20),
Cid int ,

constraint supfori
foreign key (Cid) REFERENCES  Client(ID),
);

create table Trainer(

Ssn int NOT NULL,
Experience varchar(50),

constraint Trainer_PK
primary key (Ssn),
constraint Trainer_fk
foreign key (Ssn) references Employee (Ssn)
); 

create table Activity(

TSsn int,
CID int,
Train_time varchar(50),

constraint Activity_PK
primary key (TSsn,CID),

constraint Train_FK
foreign key (TSsn) references Trainer(Ssn),

constraint Client_fk
foreign key (CID) references Client(ID)

);

create table Cleaner(
Ssn int NOT NULL, 
Clean_shift varchar(50),
constraint Clean_PK primary key (Ssn),
CONSTRAINT Clean_fk
FOREIGN KEY (Ssn) REFERENCES Employee (Ssn)
);

CREATE TABLE Report
(
T_code   int    not null,
Height   int    ,
R_Weight   int    ,
Progress_level  varchar(5),
Client_ID   int ,

constraint  T_code_PK  Primary key (T_code),

constraint  Client_ID_FK foreign key (Client_ID) references Client(ID)
);

create table Security
(
Ssn		int   ,
security_rank   varchar(5),

 constraint Ssn_Pk   primary key (Ssn),
 constraint Ssn_fk   foreign key (Ssn) references Employee(Ssn)
);

create table Room(
Room_number int,
Floor_num int,
Capacity int,
Cleaner_ssn int Not Null,
Branch_num int Not Null,
constraint Room_PK primary key (Room_number),
CONSTRAINT Cleaner_Room_fk
FOREIGN KEY (Cleaner_ssn) REFERENCES Cleaner (Ssn),
CONSTRAINT Branch_Room_fk
FOREIGN KEY (Branch_num) REFERENCES G_branch (Branch_num)
);



Insert into Employee
Values
(201,'Ahmed','M','Mahmoud','5/7/1995','Fifth settelment',2000,50,'M',6,204),
(202,'Aly','O','Elsafty','8/10/1999','Nasr city',1000,100,'M',4,204),
(203,'Khaled','S','Tamer','9/9/1994','Alex',5000,0,'M',9,204),
(204,'Salma','R','Youssef','10/11/1992','Nasr city',2000,90,'F',6,null),
(205,'Sara','M','Tamer','25/12/2000','Alex',5000,100,'M',8,204);

insert into Employee
values 
(301,'Tamer','Ahmed','Samir','22/5/1999','Nasr city/Cairo',4000,0,'M',12,305),
(302,'Ahmed','Mohamed','hamed','23/6/1998','Matarya/Cairo',5000,1500,'M',8,305),
(303,'fatma','Salah','Mahmmoud','12/9/1995','Gesr EL-Swees',6000,2000,'F',9,305),
(304,'yossef','Ahmed','Saleh','4/7/1999','Haddaek El-Maady',7000,2500,'M',12,305),
(305,'Ziad','Mohamed','Said','7/3/2002','Giza',8000,3000,'M',8,null);

Insert into Employee
Values
(101,'Mostafa','Mohamed','Ahmed','9/8/1990','Maadi',15000,500,'M',8,105),
(102,'Amera','Ahmed','Ali','10/12/1995','Zamalik',5000,200,'F',12,105),
(103,'Ali','Ahmed','Ali','20/10/1997','New Cairo',10000,0,'M',10,105),
(104,'Omar','Moostafa','Mahmoud','2/1/1990','Nasr City',12000,250,'M',12,105),
(105,'Nada','Ahmed','Ashraf','5/6/1996','Maadi',15000,700,'F',12,null);

Insert into Employee
Values
(206,'Yara','R','Ahmed','15/8/2001','Mansoura',9000,900,'F',3,204);

Insert into Membership 
Values
(35,1000,'Gym & Fittness',0,'3 months'),
(38,5000,'Gym & Fittness & training',0.5,'3 months'),
(45,10000,'Gym & Fittness & supplment',0.2,'5 months'),
(31,2000,'Gym',0.1,'2 months'),
(40,2000,'Gym & Fittness',0,'1 months');

Insert into Membership 
Values
(32,3000,'Gym & Fittness',0,'2 months');
Insert into Client
Values
(225,'Mohamed','Gamal','Ahmed','Zamalek','Male',31),
(223,'Shahd','Mohamed','Ahmed','Maadi','Female',38),
(235,'Youssef','Ashraf','Naser','Zamalek','Male',40),
(229,'Abdelrahman','Said','Ahmed','Helioples','Male',35),
(230,'Gamal','Adbelnaser','Hassan','New Cairo','male',45);

Insert into Client
Values 
(220,'Ahmed','mohamed','Ahmed','Nasr City','Male',32);

Insert into Client_telphnum
Values
(229,0102256),
(225,0109865),
(230,0115854),
(235,0125567),
(223,0102564);

Insert into Trainer
Values
(101,'Professional'),
(102,'Beginner'),
(103,'Good'),
(104,'Intermediate'),
(105,'Professional');

Insert into Activity
Values
(103,225,'From 10:00am To 11:30am'),
(105,223,'From 7:00pm To 9:00pm'),
(102,235,'From 10:00am To 12:30'),
(101,229,'From 10:00pm To 11:00pm'),
(104,230,'From 5:00pm To 6:00pm');






Insert into Emp_telephnum
Values
(201,01112225474),
(202,01111111112),
(203,01234552717),
(204,01516176171),
(205,01027163163);


Insert into Cleaner
Values
(201,'12 to 6'),
(202,'8 to 12'),
(203,'6 to 3'),
(204,'12 to 6'),
(205,'3 to 11');

Insert into Cleaner
Values
(206,'3 to 6');

insert into G_branch
values(10,'elwadi','el_doki');

insert into G_branch
values(11,'elwadi2','el_zamalek');

insert into G_branch
values(12,'elwadi3','madinty');

insert into G_branch
values (13,'elwadi4','el-maady');

insert into G_branch
values(14,'elwadi5','masr_elgdida');

Insert into Department
Values
(302,10,'Saftey'),
(304,13,'Saftey'),
(103,11,'Instruction'),
(104,10,'Instruction'),
(204,11,'Janitorial');

Insert into Room
Values
(100,1,5,201,10),
(110,1,7,203,11),
(210,2,3,201,10),
(120,1,9,202,12),
(220,2,17,205,14),
(230,2,20,204,13);


insert into Report
values (001,183,98,'A',229);

insert into Report
values  (002,188,102,'C',235);

insert into Report
values (003,170,95,'B',223);

insert into Report
values (004,174,88,'A',230);

insert into Report
values (005,181,90,'B',225);

insert into Security
values 
(301,'A'),
(302,'C'),
(303,'B'),
(304,'D'),
(305,'A');


insert into Branch_telephon_num
values(10,01283312751);

insert into Branch_telephon_num
values(11,01233331266);

insert into Branch_telephon_num
values(12,01244441266);

insert into Branch_telephon_num
values(13,01255555126);

insert into Branch_telephon_num
values(14,01234567899);

insert into Sponser
values(1,'hasida co.','nasr_city');

insert into Sponser
values(2,'elgin co.','naser_city');

insert into Sponser
values(3,'drake co.','masr_elgadida');

insert into Sponser
values(4,'iron co.','elmaady');

insert into Sponser
values(5,'furm co.','masr_elgadida');

insert into Equipment
values(50,'dumbles',500,'strenth all the body');

insert into Equipment
values(51,'cross trainer',30000,'strength the legs');

insert into Equipment
values(52,'adjustable whight bench',40000,'strength the back');

insert into Equipment
values(53,'bench press',30000,'strenth the pench');

insert into Equipment
values(54,'leg addiction machine',55000,'strength the legs');


insert into Sponser_telephon_num
values(1,0128445678);

insert into Sponser_telephon_num
values(2,0123377449);

insert into Sponser_telephon_num
values(3,0122219001);

insert into Sponser_telephon_num
values(4,0112323234);

insert into Sponser_telephon_num
values(5,0112424363);

insert into supplied_equipment
values(1,50,5);

insert into supplied_equipment
values(2,51,7);

insert into supplied_equipment
values(3,52,6);

insert into supplied_equipment
values(1,53,5);

insert into supplied_equipment
values(1,54,11);


insert into Employee
values(1,'moahmed', 'ali', 'osama','19/2/1990','alsalam' , 2000,200,'M' , 12, 5),
(2,'ali', 'ahmed', 'mohamed','2/2/1980','gesr elswaies' , 4500,500,'M' , 12, 5),
(3,'moahmed', 'ali', 'osama','3/9/1930','qebaa' , 10000,150,'M' , 9, 5),
(4,'ahmed', 'hossam', 'moataz','3/3/1980','helioples' , 7500,300,'M' , 9, 5),
(5,'islam', 'saeed', 'moazz','4/2/1970','alf maskan' , 20000,500,'M' , 5,null);



insert into repairman
values(1 ,'12:00:00')
insert into repairman
values(2 ,'6:00:00')
insert into repairman
values(3 ,'8:00:00')
insert into repairman
values(4,'4:00:00')
insert into repairman
values(5,'4:00:00')

insert into supplement
values('b211bjb2h',12 , 'cocao' ,'product with high proten an low suger','food',225)

insert into supplement
values('sh3h4hnn4',30 , 'protrn bar' ,'bar gives energy with no calories','food',225)

insert into supplement
values('fsjhg34ghh',100 , 'quick care tools' ,'tools helps you on any place easy and fast','care',225)

insert into supplement
values('nhdsg34h',3 , 'towels' ,'high quality towels','care',229)

insert into supplement
values('hge23hgr',500 , 'individual training kit' ,'a kit that can go anywhere to practise anywhere','sport supplies',229)



insert into Maintainence
values(1,50,'12:00:00' )
insert into Maintainence

values(2,51,'6:00:00')
insert into Maintainence
values(3,52,'8:00:00')
insert into Maintainence

values(4,53,'4:00:00')
insert into Maintainence

values(5,54,'4:00:00')








--Moatazzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz

SELECT Code , (Price-Discount) AS 'Total Price'
FROM Membership;

SELECT MAX(Salary) AS 'Max Salary', MIN(Salary) AS 'Min Salary', AVG(Salary) AS 'Avg Salary'
FROM Employee;

SELECT Client.ID,Client.Fname,Client.Lname,Report.T_code
FROM Client left outer join Report on Client.ID=Report.Client_ID;

SELECT DISTINCT COUNT(Trainer.Ssn) AS 'NUM of Trainer',Salary
FROM Employee JOIN Trainer ON Trainer.Ssn=Employee.Ssn
WHERE Salary >5000
GROUP BY Salary;

SELECT Client.ID,Client.Fname,Client.Lname
FROM Client RIGHT OUTER JOIN Membership
ON Client.M_code=Membership.Code
WHERE Gender='Female';

SELECT DISTINCT Code,Price
FROM Membership
WHERE Price IN (select DISTINCT MAX(Price)
                FROM Membership);

SELECT M_code
FROM Client JOIN Activity ON Activity.CID=Client.ID
WHERE TSsn IN (SELECT Trainer.Ssn
			   FROM Trainer JOIN Employee ON Trainer.Ssn=Employee.Ssn
			   WHERE Fname = 'Mostafa');

SELECT Client.ID, Client.Fname 
FROM Client JOIN Activity ON Activity.CID=Client.ID
WHERE TSsn IN(SELECT Trainer.Ssn
              FROM Trainer 
		      WHERE Trainer.Experience='Professional');


Create view Salary_Employee 
AS
Select Employee.Ssn,Employee.Fname,Employee.Lname,Employee.Salary
From Employee
WHERE Salary < 5000;

SELECT * FROM Salary_Employee;



--Yusseffffffffffffffffffffffffffffffffffffffffffffffffffffffff

Select Ssn , (Salary+Bouns) As'Net Salary'
from Employee;

Select Fname+' '+Lname AS 'Full name', Clean_shift , Branch_location  
from Cleaner,G_branch , Employee
where Employee.Ssn  in (select Essn
              from Department
			  where Dept_name='Janitorial')
and Cleaner.Ssn in (select Essn
              from Department)
and Branch_num in (select Gbranch_num
                     from Department
					 where Dept_name='Janitorial');

select Ssn,Room_number
from Cleaner left outer join Room
on Ssn=Cleaner_ssn;

SELECT emp.Fname + ' ' + emp.Lname AS 'Employee name', m.Fname + ' ' + m.Lname AS 'Manager name'
FROM Employee emp JOIN Employee m 
ON emp.Super_ssn = m.Ssn;

Select Salary , count(Cleaner.Ssn) AS 'No of Cleaners'
from  Employee join Cleaner
on Cleaner.Ssn = Employee.Ssn
group by Salary
Having Salary>4000;

Select Fname+' '+Lname AS 'Full name' , Cleaner.Ssn
from Employee,Cleaner
where Cleaner.Ssn=Employee.Ssn
order by Fname+Lname;

--mohamedNasseerrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr

--for equipment whose function is strength the leg display its equipment code and equipment function 
select  Equip_code,Equip_function,Equip_price  from Equipment
where Equip_function='strength the legs';

--display a list of equipments with prices more than the average price
select * from Equipment
where Equip_price>(select avg(Equip_price)from Equipment);

--retrieve the spon_name and spon_location of sponsers that supply all equipments except dumbles
select Equip_code,Spon_name,Spon_location 
from Sponser join supplied_equipment
on sponser.Spon_code=supplied_equipment.Spon_code
where supplied_equipment.Equip_code  not in(select Equipment.Equip_code 
                                        from Equipment
										where Equip_name='dumbles');

--for clients ,who bought more than 1 supplement display a list of their id and how many products they buy
--stored by the number of supplement in descending order
select ID,count(*) as 'no.of supplements'
from Client join supplement
on client.ID=supplement.Cid
group by ID
having count(*)>1
order by count(*) desc;

--select the fname,lname for clients who buy supplement if the client 
--didnt buy any supplement there will be null values in the pname
select Fname+''+Lname as fullname ,Pname
from supplement right outer join client 
on supplement.Cid=client.ID

--select the fullname,Gender,Progress_level for clients who are males and their progress level is A 
--if the client have no progress level put null valuse
select fname+''+lname as fullname,Gender,Progress_level
from Report join Client
on report.Client_ID=Client.ID
where Gender='Male' and Progress_level='A';

--display the fname,dept_name,branch_name who works on the g-branch whose name is elwadi
select distinct Fname , Dept_name ,Branch_name
from Employee e join Department d
on e.Ssn=d.Essn
join G_branch g on g.Branch_num=d.Gbranch_num
where g.Branch_num in(select distinct g.Branch_num
                        from Employee e join Department d
                        on e.Ssn=d.Essn
                        join G_branch g on g.Branch_num=d.Gbranch_num 
						and g.Branch_name='elwadi');


--select the ssn of the trainers who train client with Membership sub period 3 months
select distinct ssn 
from Client ,trainer join Activity
on Trainer.Ssn=Activity.TSsn
where  CID in(select distinct ID
               from Client
where M_code in (select distinct code
                from Membership
				where Membership.Sub_period='3 months'));



--Ziadddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd

select Fname +' '+initial+' '+Lname As 'FULL NAME',Salary As 'Original Salary',Salary+Salary*0.2 As'After pormotion' 
from Employee
where Salary < 6000;

select  count(Ssn)AS 'Number of Employees', work_hour As 'Work hours'
from Employee 
group by work_hour
having  work_hour>8 
order by work_hour desc;

select Fname +' '+initial+' '+Lname As 'Client Name', Height ,Progress_level as 'Level' 
From Client Join Report on Client.Id=Report.Client_ID
where Progress_level = 'A' or Progress_level ='B'


select Room_number,Capacity As 'Room number need expansion',Floor_num as 'Floor num'
from Room
where Capacity < all (select Capacity from Room where Capacity>8 ) 


select  Equip_code as 'Equip code' ,Equip_name  ,Equip_price  
from Equipment
where Equip_price > all(select Equip_price from Equipment where Equip_price < 35000);


--Waffffiffififififqqqqqqqqqqqqqhghfjhjklkjhkujgkhtdgdhgghjkj

select Pname as 'product name' , QR_code as 'code',Price as 'product price',Descriiption
from supplement
where Descriiption like'%low%';

select count(Pname) as'number of products with price more than 30$'
from supplement
where Price >30;

select Fname +' '+Lname as 'name', Employee.Ssn, work_hour
from Employee join repairman
on repairman.Ssn = Employee.Ssn
where Check_Time = '4:00:00';

select Ssn, Maintainence.Mequip_code
from repairman join Maintainence
on Maintainence.Rssn = repairman.Ssn
where Ssn in(select Rssn
from Maintainence
where Repair_Time = '12:00:00'
);
select fname+' '+ lname as 'employee name'
from Employee
where Salary = all(select Salary
from Employee
where Ssn = 301
);
 select Fname, Lname, supplement.Cid as 'client id'
 from Client left outer join supplement
 on Client.ID = supplement.Cid

