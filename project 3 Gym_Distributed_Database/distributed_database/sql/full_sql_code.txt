CREATE DATABASE Gym;


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
-----------------------------------------------------more data to distinguish between servers----------------------------------------
Insert into Employee
Values
(106, 'Tamer', 'Hassan', 'ElSayed', '5/6/1992', 'New Cairo', 14000, 700, 'M', 10, 106),
(107, 'Mona', 'Omar', 'Said', '2/4/1991', 'Heliopolis', 12000, 400, 'F', 11, 106);

Insert into Trainer
Values
(106,'Intermediate'),
(107,'Professional');

Insert into Membership 
Values
(1001, 4500, 'Gym & Fittness & supplment', 10, '6 months'),
(1002, 5000, 'Gym', 5, '12 months');


Insert into Client
Values
(250, 'Ahmed', 'Fathy', 'Mohamed', 'Nasr City', 'Male', 1001),
(251, 'Rania', 'Hassan', 'Ali', 'Maadi', 'Female', 1002);

Insert into Activity
Values
(106,250,'From 7:00am To 9:00am'),
(107,251,'From 4:00am To 6:00am');



insert into supplement 
VALUES 
('a123bcd4e', 15, 'Whey Protein', 'High protein supplement for muscle growth', 'food', 250),
('f456gh78i', 10, 'Vitamin C', 'Immune boosting supplement with high vitamin C content', 'vitamin', 251);


-------------------------------------------------fragmentations-----------------------------------------------------------
----1)vertical_fragmentations:
/* Vertical Fragmentation: Employee Table */
SELECT Ssn, Fname, initial, Lname, Adress 
INTO VerticalFragmentEmpPersonalInfoTABLE
FROM Employee;

--Vertical Fragmentation: branch_table
SELECT Ssn, Branch_num, Super_ssn, Salary 
INTO VerticalFragmentEmpBranchInfoTABLE
FROM Employee,G_branch;

/* vertical Fragment 2: equipment_table */
SELECT Equip_code, Equip_name, Equip_price
INTO VerticalFragmentOtherInfo
FROM Equipment;



/* Testing Vertical Fragments */
SELECT * FROM VerticalFragmentEmpPersonalInfoTABLE;
SELECT * FROM VerticalFragmentEmpBranchInfoTABLE;
SELECT * FROM VerticalFragmentOtherInfo;


--2)horizontal_frgametation
/* Fragment 1: Male Clients */
SELECT ID, Fname, initial, Lname, Addresss, Gender, M_code
INTO Client_HORIZONTAL_Male
FROM Client
WHERE Gender = 'Male';

/* Fragment 2: Female Clients */
SELECT ID, Fname, initial, Lname, Addresss, Gender, M_code
INTO Client_HORIZONTAL_Female
FROM Client
WHERE Gender = 'Female';

/* Fragment 3: Morning Training Activities */
SELECT TSsn, CID, Train_time
INTO Activity_HORIZONTAL_Morning
FROM Activity
WHERE Train_time LIKE '%AM';

/* Fragment 4: Afternoon/Evening Training Activities */
SELECT TSsn, CID, Train_time
INTO Activity_HORIZONTAL_Evening
FROM Activity
WHERE Train_time LIKE '%PM';


/* Testing the Fragments */
SELECT * FROM Client_HORIZONTAL_Male;
SELECT * FROM Client_HORIZONTAL_Female;
SELECT * FROM Activity_HORIZONTAL_Morning;
SELECT * FROM Activity_HORIZONTAL_Evening;

--3)hybrid_frgmantation
--verticalFragment 1: Basic Supplement Details */
SELECT QR_code, Pname, Supp_Type
INTO Supplement_Basic
FROM supplement;

--verticalFragment 2: Pricing and Description */
SELECT QR_code, Price, Descriiption, Cid
INTO Supplement_Details
FROM supplement;

SELECT * FROM Supplement_Basic;
SELECT * FROM Supplement_Details;


/* horizontal_on_vertical Fragment 1: Vitamin Supplements */
SELECT QR_code, Pname, Supp_Type
INTO Supplement_Basic_food
FROM Supplement_Basic
WHERE Supp_Type = 'food';


/*horizontal_on_vertical Fragment 1: Protein Supplements */
SELECT QR_code, Pname, Supp_Type
INTO Supplement_Basic_care
FROM Supplement_Basic
WHERE Supp_Type = 'care';

/*horizontal_on_vertical Fragment 2: Affordable Supplements */
SELECT QR_code, Price, Descriiption, Cid
INTO Supplement_Details_Affordable
FROM Supplement_Details
WHERE Price < 100;

/*horizontal_on_vertical Fragment 2: Expensive Supplements */
SELECT QR_code, Price, Descriiption, Cid
INTO Supplement_Details_Expensive
FROM Supplement_Details
WHERE Price >= 100;

---testing the hybrid frgamnets
SELECT * FROM Supplement_Basic_food;
SELECT * FROM Supplement_Basic_care;
SELECT * FROM Supplement_Details_Affordable;
SELECT * FROM Supplement_Details_Expensive;


---------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------set operators------------------------------------------------------------
---------------query1-------------------------------------------------
SELECT * 
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Employee] 
WHERE Gender = 'F' 
Except
SELECT * 
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Employee] -
WHERE  Work_Hour > 6;
-----query2-------------------------------------------------------------
SELECT Ssn,Salary,Bouns,Fname + ' ' + Lname AS 'Name'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Employee]
WHERE Salary > 3000
UNION ALL
SELECT Ssn,Salary,Bouns,Fname + ' ' + Lname AS 'Name'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Employee]
WHERE Bouns >1000;
-----------query3--------------------------------------------------------
SELECT * 
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Employee] 
WHERE Salary > 2000 
INTERSECT
SELECT * 
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Employee] 
WHERE Adress LIKE '%Nasr City%';

------------------------query4--------------------------------------------

SELECT Code, Price, Feature, Sub_period
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Membership] 
WHERE Price > 2000
UNION
SELECT Code, Price, Feature, Sub_period
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Membership] 
WHERE Feature LIKE '%Gym & Fittness%';

---------------------------------query5-------------------------------------------
SELECT ID,Addresss, Fname + ' ' + Lname AS 'Name'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Client]
WHERE Gender = 'Male'

Except

SELECT ID,Addresss, Fname + ' ' + Lname AS 'Name'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Client]
WHERE Addresss LIKE '%Z%';
----------------------------------query6----------------------------------------------
SELECT Code, Price, Feature, Discount, Sub_period
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Membership] 
WHERE Sub_period = '3 months'
INTERSECT
SELECT Code, Price, Feature, Discount, Sub_period
FROM [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Membership] 
WHERE Price <5000

--------------------------------join queries-----------------------------------------------------
---------------------------------query1(outer)------------------------------------------------------------
SELECT Client.Fname + ' ' + Client.Lname AS FullName, 
       Client.Gender, 
       Report.Progress_level
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Client] AS Client
FULL OUTER JOIN   [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Report] AS Report
ON Client.ID = Report.Client_ID
WHERE Client.Gender = 'Male' 
  AND Report.Progress_level = 'A' ;

-----------------------------------query2(outer)-------------------------------------------------------------
SELECT Cleaner.Ssn, 
       Room.Room_number
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Cleaner] AS Cleaner
FULL OUTER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Room] AS Room
ON Cleaner.Ssn = Room.Cleaner_ssn;

------------------------------------query3(inner)------------------------------------------------------------
SELECT Employee.Salary, 
       COUNT(Cleaner.Ssn) AS 'No of Cleaners'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Employee] AS Employee
INNER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Cleaner] AS Cleaner
ON Cleaner.Ssn = Employee.Ssn
GROUP BY Employee.Salary
HAVING Employee.Salary > 4000;

------------------------------------query4(inner)----------------------------------------------------------
SELECT Client.ID AS ClientID, 
       Client.Fname + ' ' + Client.Lname AS 'Name', 
       Supplement.Pname AS 'Product Name'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Client] AS Client
INNER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Supplement] AS Supplement
ON Client.ID = Supplement.CID;

-------------------------------------query5(inner)---------------------------------------------------------
SELECT Client.ID, 
       COUNT(*) AS 'No of Supplements'
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Client] AS Client
INNER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[Supplement] AS Supplement
ON Client.ID = Supplement.CID
GROUP BY Client.ID
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

--------------------------------------query6(inner)--------------------------------------------------------

SELECT DISTINCT e.Fname, 
                d.Dept_name, 
                g.Branch_name
FROM [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Employee] AS e
INNER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS].[Gym].[dbo].[Department] AS d
ON e.Ssn = d.Essn
INNER JOIN [DESKTOP-6R5MU0A\SQLEXPRESS2].[Gym2].[dbo].[G_branch] AS g
ON g.Branch_num = d.Gbranch_num
WHERE g.Branch_name = 'elwadi';

----------------------------------------------------------------------------------------------------------------
----------------------------------------------registered servers quires-----------------------------------------
--select the fullname,Gender,Progress_level for clients who are males and their progress level is A 
select fname+''+lname as fullname,Gender,Progress_level
from Report join Client
on report.Client_ID=Client.ID
where Gender='Male' and Progress_level='A';
---------------------------------------------------
SELECT Client.ID,Client.Fname,Client.Lname
FROM Client RIGHT OUTER JOIN Membership
ON Client.M_code=Membership.Code
WHERE Gender='Female';
----------------------------------------------------
Select Salary , count(Cleaner.Ssn) AS 'No of Cleaners'
from  Employee join Cleaner
on Cleaner.Ssn = Employee.Ssn
group by Salary
Having Salary>4000;
-----------------------------------------------------
Select Fname+' '+Lname AS 'Full name' , Cleaner.Ssn
from Employee,Cleaner
where Cleaner.Ssn=Employee.Ssn
order by Fname+Lname;
--------------------------------------------------------
select Ssn, Maintainence.Mequip_code
from repairman join Maintainence
on Maintainence.Rssn = repairman.Ssn
where Ssn in(select Rssn
from Maintainence
where Repair_Time = '12:00:00'
);
-------------------------------------------------------------
select count(Pname) as'number of products with price more than 30$'
from supplement
where Price >30;
-------------------------------------------TRANSACTIONS----------------------------------------------------
---------------------------------------------success transaction-------------------------------------------
Begin tran
begin try
Insert Employee Values(5000,'MAXIMOS','Q','SAMY','1/2/2001','NOUBA',8000,900,'M',3,204)
PRINT 'Successfully Transaction!'
commit
end try
begin catch
PRINT 'Error on Transaction!'
--PRINT error_message();
DECLARE @msg NVARCHAR(2048) = error_message();
THROW 51000, @msg, 1;
rollback tran
end catch

SELECT * FROM Employee;
--------------------------------------------fail--------------------------------------
Begin tran
begin try
Insert Employee Values(5000,'MAXIMOS','Q',12344,'1/2/2001','NOUBA',8000,900,'M',3,204)
PRINT 'Successfully Transaction!'
commit
end try
begin catch
PRINT 'Error on Transaction!'
--PRINT error_message();
DECLARE @msg NVARCHAR(2048) = error_message();
THROW 51000, @msg, 1;
rollback tran
end catch

---------------------------success----------------------------------------
BEGIN TRANSACTION;
BEGIN TRY
    -- Valid update
    UPDATE Employee
    SET Salary = Salary + 500
    WHERE Ssn = 201;


    PRINT 'Transaction Successfully Committed!';
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Error during Transaction!';

    -- Capture and print the error message
    DECLARE @ErrorMessage NVARCHAR(2048) = ERROR_MESSAGE();
    PRINT @ErrorMessage;

    -- Rollback the transaction
    ROLLBACK TRANSACTION;
END CATCH;

SELECT * FROM Employee;
-----------------------------fail-----------------------
BEGIN TRANSACTION;
BEGIN TRY
    -- Valid update
    UPDATE Employee
    SET Salary = Salary + 'Ahmed'
    WHERE Ssn = 201;


    PRINT 'Transaction Successfully Committed!';
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Error during Transaction!';

    -- Capture and print the error message
    DECLARE @ErrorMessage NVARCHAR(2048) = ERROR_MESSAGE();
    PRINT @ErrorMessage;

    -- Rollback the transaction
    ROLLBACK TRANSACTION;
END CATCH;


----------------------------------success------------------------------
BEGIN TRANSACTION;
BEGIN TRY
    -- Valid delete: Deletes a specific employee
    DELETE FROM supplement
    WHERE QR_code = 'b211bjb2h';

    PRINT 'Transaction Successfully Committed!';
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Error during Transaction!';

    -- Capture and print the error message
    DECLARE @ErrorMessage NVARCHAR(2048) = ERROR_MESSAGE();
    PRINT @ErrorMessage;

    -- Rollback the transaction
    ROLLBACK TRANSACTION;
END CATCH;

SELECT * FROM supplement;
-----------------------------------fail--------------------------------
BEGIN TRANSACTION;
BEGIN TRY
    -- Valid delete: Deletes a specific employee
    DELETE FROM supplement
    WHERE QR_code = 12123;

    PRINT 'Transaction Successfully Committed!';
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    PRINT 'Error during Transaction!';

    -- Capture and print the error message
    DECLARE @ErrorMessage NVARCHAR(2048) = ERROR_MESSAGE();
    PRINT @ErrorMessage;

    -- Rollback the transaction
    ROLLBACK TRANSACTION;
END CATCH;


