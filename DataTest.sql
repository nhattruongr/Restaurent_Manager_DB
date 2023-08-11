set dateformat dmy;

insert into Categories (Category_name) values ('Starter');
insert into Categories (Category_name) values ('Salad');
insert into Categories (Category_name) values ('Main Courses');
insert into Categories (Category_name) values ('Deserts');
insert into Categories (Category_name) values ('Drinks');

insert into Items (Item_name, Item_price, Category_id) values ('Tomato Soup', 9.99, 1);
insert into Items (Item_name, Item_price, Category_id) values ('Chicken Soup', 9.99, 1);
insert into Items (Item_name, Item_price, Category_id) values ('Crispy Corn', 9.99, 1);

insert into Items (Item_name, Item_price, Category_id) values ('Guacamole Salad', 9.99, 2);
insert into Items (Item_name, Item_price, Category_id) values ('Chicken Salad', 9.99, 2);

insert into Items (Item_name, Item_price, Category_id) values ('Grilled Fish And Potatoes', 14.99, 3);
insert into Items (Item_name, Item_price, Category_id) values ('Chicken And Rice', 12.49, 3);
insert into Items (Item_name, Item_price, Category_id) values ('Turkey And Ham Pie', 13.99, 3);

insert into Items (Item_name, Item_price, Category_id) values ('Fruit And Cream', 4.99, 4);
insert into Items (Item_name, Item_price, Category_id) values ('Ice Cream', 2.99, 4);
insert into Items (Item_name, Item_price, Category_id) values ('Chocolate Cake', 7.49, 4);
insert into Items (Item_name, Item_price, Category_id) values ('Strawberry Cake', 7.49, 4);
insert into Items (Item_name, Item_price, Category_id) values ('Apple Pie', 9.99, 4);

insert into Items (Item_name, Item_price, Category_id) values ('Mineral Water', 1.99, 5);
insert into Items (Item_name, Item_price, Category_id) values ('Fresh Fruit Juice', 4.49, 5);
insert into Items (Item_name, Item_price, Category_id) values ('Turkey And Ham Pie', 4.49, 5);
insert into Items (Item_name, Item_price, Category_id) values ('Tea', 4.49, 5);
insert into Items (Item_name, Item_price, Category_id) values ('Wines', 14.49, 5);

insert into Roles (Role_name) values ('Owner');
insert into Roles (Role_name) values ('Manager');
insert into Roles (Role_name) values ('Waiter/Casher');

insert into Accounts (Account_name, Account_password, Account_type) values ('father', 'father' ,1)
insert into Staffs (Staff_name, Staff_phonenumber, Staff_birth, Role_id) values ('Pham Tuan Anh', '0852485844', '23/09/1998', 2)
insert into Staffs (Staff_name, Staff_phonenumber, Staff_birth, Role_id) values ('Nguyen Tuan Anh', '0852485832', '23/09/1996', 3)

insert tables (Table_chairs) values (2);
insert tables (Table_chairs) values (2);
insert tables (Table_chairs) values (2);
insert tables (Table_chairs) values (2);
insert tables (Table_chairs) values (4);
insert tables (Table_chairs) values (4);
insert tables (Table_chairs) values (8);

insert PaymentTypes (Payment_name) values ('Cash');
insert PaymentTypes (Payment_name) values ('Banking');
insert PaymentTypes (Payment_name) values ('Bitcoin');

insert into Orders (Order_date, Table_id, Staff_id, Payment_id) values ('15/07/2023', 1, 2, 2);
insert into Orders (Order_date, Table_id, Staff_id, Payment_id) values ('15/07/2023', 2, 1, 2);
insert into Orders (Order_date, Table_id, Staff_id, Payment_id) values ('15/07/2023', 3, 1, 3);
insert into Orders (Order_date, Table_id, Staff_id, Payment_id) values ('15/07/2023', 4, 1, 1);

insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000001, 2, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000001, 15, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000001, 10, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000001, 17, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000001, 13, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 1, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 1, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 4, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 6, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 10, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000002, 11, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000003, 3, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000003, 13, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000003, 12, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000003, 11, 2);
insert into OrderDetail(Order_id, Item_id, Item_quantity) values (1000000003, 17, 2);
