create database if not exists FresherTrainingManagement;
use FresherTrainingManagement;
create table Trainee(
TraineeID int primary key auto_increment,
Full_Name varchar(50) not null,
Birth_Date date not null,
Gender enum('male','female','unknow') not null,
ET_IQ int check(ET_IQ >=0 and ET_IQ <=20),
ET_Gmath int check(ET_Gmath >=0 and ET_Gmath <=20),
ET_English int check(ET_English >=0 and ET_English <=50),
Training_Class varchar(50),
Evaluation_Notes varchar(100)
);
alter table Trainee
add VTI_Account varchar(50) not null unique
;
create table Ex2(
ID int primary key auto_increment,
`Name` varchar(50) not null,
`Code` char(5) not null,
ModifiedDate date not null
);
create table Ex3(
ID int primary key auto_increment,
`Name` varchar(50) not null,
BirthDate date not null,
Gender bit, 
IsdeletedFlag bit not null
);

