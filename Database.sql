create database RestaurantManager;
go
use RestaurantManager;
go
set dateformat dmy;

create table Categories(
	Category_id smallint IDENTITY(1,1) Primary key,
	Category_name nchar(32) not null,
	Category_status bit default 1,
);
go

create table Items(
	Item_id smallint identity(1,1) Primary key,
	Item_name char(64) not null,
	Item_price float,
	Item_describe char(256),
	Category_id smallint references Categories(Category_id)
	on update cascade
	on delete no action,
	Item_status bit default 1,
);
go

create table Tables(
	Table_id smallint IDENTITY(1,1) Primary key,
	Table_chairs tinyint,
	Table_status bit default 0,
);
go

create table Roles(
	Role_id smallint IDENTITY (1,1)Primary key,
	Role_name char(64) not null,
	Role_status bit default 1,
);
go

alter table Accounts alter column Account =
go

create table Accounts(
	Account_id smallint IDENTITY (1,1) Primary key,
	Account_name char(32) unique,
	Account_password char(32),
	Account_type smallint references Roles(Role_id) on update cascade on delete cascade,
	Account_status bit default 0,
);
go

create table Staffs(
	Staff_id smallint IDENTITY (1,1)Primary key,
	Staff_name char(64) not null,
	Staff_gender bit default 1,
	Staff_birth date not null,
	Staff_phonenumber char(10) constraint Check_Phone check (Staff_Phonenumber like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]') not null,
	Staff_address char(64),
	Staff_mail char(64),
	Role_id smallint references Roles(Role_id) on update cascade on delete no action not null,
	Account_id smallint unique references Accounts(Account_id) on delete cascade,
	Staff_status bit default 0,
);
go

create table PaymentTypes(
	Payment_id tinyint IDENTITY(1,1) Primary key,
	Payment_name char(64),
	Payment_status bit default 1,
);
go

create table Orders(
	Order_id int IDENTITY (1000000001,1) primary key ,
	Order_date date default cast(getdate() as date),
	Table_id smallint references Tables(Table_id) on update cascade on delete no action,
	Staff_id smallint references Staffs(Staff_id) on update cascade on delete no action,
	Payment_id tinyint references PaymentTypes(Payment_id) on update cascade on delete no action,
	Order_status bit default 0,
);
go

create table OrderDetail(
	Order_id int references Orders(Order_id)on update cascade on delete no action,
	Item_id smallint references Items(Item_id) on update cascade on delete set null,
	Item_price float,
	Item_quantity tinyint,
);
go