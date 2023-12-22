	create database Assignment_Day1;
    use Assignment_Day1;
    
    create table Department (
		DepartmentID int primary key auto_increment,
        DepartmentName varchar(50)
    );
    
    create table Positionn(
		PositionID int primary key auto_increment,
        PositionName enum('Dev', 'Test', 'Secrum master', 'PM')
    );
    
    create table Accountt(
		AccountID int primary key auto_increment,
        Email varchar(50),
        Username varchar(50),
        FullName varchar(100),
        DepartmentID int, foreign key(DepartmentID) references Department(DepartmentID),
        PositionID int, foreign key(PositionID) references Positionn(PositionID),
		CreateDate timestamp
    );
    
    create table Groupp(
		GroupID int primary key auto_increment,
        GroupName varchar(100),
        CreatorID int,
        CreateDate timestamp
    );
    
    create table GroupAccount(
		GroupID int, foreign key(GroupID) references Groupp(GroupID),
        AccountID int, foreign key(AccountID) references Accountt(AccountID),
        JoinDate timestamp
    );
    
    create table TypeQuestion(
		TypeID int primary key auto_increment,
        TypeName enum('Essay', 'Multiple-Choice')
    );
    
    create table CategoryQuestion(
		CategoryID int primary key auto_increment,
        CategoryName enum('Java', '.NET', 'SQL', 'Postman', 'Ruby')
    );
    
    create table Question(
		QuestionID int primary key auto_increment,
        Content varchar(100),
        CategoryID int, foreign key(CategoryID) references CategoryQuestion(CategoryID),
		TypeID int, foreign key(TypeID) references TypeQuestion(TypeID),
        CreatorID int,
        CreateDate timestamp
    );
    
    create table Answer(
		AnswerID int primary key auto_increment,
        Content varchar(100),
        QuestionID int, foreign key(QuestionID) references Question(QuestionID),
        isCorrect bool
    );
    
    create table Exam(
		ExamID int primary key auto_increment,
        ECode varchar(10),
        Title varchar(100),
        CategoryID int,
        CreatorID int,
        CreateDate timestamp
    );
    
    create table ExamQuestion(
		ExamID int, foreign key(ExamID) references Exam(ExamID),
        QuestionID int, foreign key(QuestionID) references Question(QuestionID)
    );
    
    