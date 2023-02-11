create database if not exists testing_system;

use testing_system;
-- create a table 1
create table Department (
    DepartmentID  tinyint primary key auto_increment,
    DepartmentName varchar(50) not null unique
);
-- create a table 2
create table `Position` (
    PositionID  	tinyint primary key auto_increment,
    PositionName    enum('Dev','Test','Scrum Master','PM')
);
-- create a table 3
create table `Account` (
    AccountID 		int primary key auto_increment,
    Email           varchar(50) not null unique,
    Username        varchar(50) not null unique,
    FullName        varchar(100) not null,
    DepartmentID 	tinyint not null,
    PositionID 		tinyint not null,
    constraint account_department_fk FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    constraint account_position_fk foreign key (PositionID) references `Position`(PositionID),
    CreateDate 		date
);
-- create a table 4
create table `Group`(
    GroupID       	tinyint primary key auto_increment,
    GroupName		varchar(50) not null,
    CreatorID 		int not null,
    CreateDate 		date not null,
    constraint group_account_fk foreign key (CreatorID) references `Account`(AccountID)
);
-- create a table 5
create table GroupAccount(
    GroupID 		tinyint not null,
    constraint GroupAccount_Group_fk FOREIGN KEY(GroupID) REFERENCES `Group`(GroupID),
    AccountID 		int not null,
    constraint GroupAccount_Account_fk FOREIGN KEY(AccountID) REFERENCES `Account`(AccountID),
    JoinDate 		date not null
);
-- create a table 6
create table TypeQuestion(
    TypeID      	tinyint primary key auto_increment,
    TypeName    	enum('Essay','Multiple-Choice')
);
-- create a table 7
create table CategoryQuestion(
    CategoryID 		tinyint primary key auto_increment,
    CategoryName 	varchar(50) not null
);
-- create a table 8
create table Question (
    QuestionID 		int primary key auto_increment,
    Content 		varchar(100) not null,
    CategoryID 		tinyint not null,
    constraint Question_CategoryQuestion_fk FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    CreatorID		int not null,
    constraint Question_Account_fk FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
    TypeID 			tinyint not null,
    constraint Question_TypeQuestion_fk FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    CreateDate 		date not null
);
-- create a table 9
create table Answer(
    AnswerID 		int primary key auto_increment,
    Content 		varchar(50) not null,
    QuestionID 		int not null,
	constraint Answer_Question_fk FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    isCorrect 		boolean not null
);
-- create a table 10
create table Exam (
    ExamID 			int primary key auto_increment,
    `Code` 			tinyint not null,
    Title 			varchar(50) not null,
    CategoryID 		tinyint not null,
	constraint Exam_CategoryQuestion_fk FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    Duration 		date not null,
    CreatorID 		int not null,
    constraint Exam_Account_fk FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID),
    CreateDate 		date not null
);
-- create a table 11
Create table ExamQuestion (
    ExamID 			int not null,
    constraint ExamQuestion_Exam_fk FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    QuestionID 		int not null,
    constraint ExamQuestion_Question_fk FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);