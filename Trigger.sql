use RestaurantManager;
go

create trigger autoUpperCategories on Categories
after insert, update
as
begin
	update Categories
		set Category_name = UPPER(i.Category_name) from inserted i, Categories c where c.Category_id = i.Category_id
end;
go

create trigger autoUpperItems on Items
after insert, update
as
begin
	update Items
		set Item_name = UPPER(i.Item_name) from inserted i, Items c where c.Item_id = i.Item_id
end;
go

create trigger autoUpperRoles on Roles
after insert, update
as
begin
	update Roles
		set Role_name = UPPER(i.Role_name) from inserted i, Roles c where c.Role_id = i.Role_id
end;
go

create trigger autoUpperStaffs on Staffs
after insert, update
as
begin
	update Staffs
		set Staff_name = UPPER(i.Staff_name) from inserted i, Staffs c where c.Staff_id = i.Staff_id
	update Staffs
		set Staff_address = UPPER(i.Staff_address) from inserted i, Staffs c where c.Staff_id = i.Staff_id
	update Staffs
		set Staff_mail = UPPER(i.Staff_mail) from inserted i, Staffs c where c.Staff_id = i.Staff_id
end;
go

create trigger autoGenerationAccount on Staffs
after insert
as
begin
	declare @user char(32), @password char (32), @type smallint;
	select @user = replace(lower(i.Staff_name), ' ','') from inserted i, Staffs s where i.Staff_id = s.Staff_id
	select @password = replace(CONVERT(char(32), i.Staff_birth, 103), '/','') from inserted i, Staffs s where i.Staff_id = s.Staff_id
	select @type = i.Role_id from inserted i, Staffs s where i.Staff_id = s.Staff_id
	if exists (select * from Accounts where Account_name = @user)
		set @user = CONCAT (replace(@user, ' ',''), right(replace(@password, ' ', ''), 2))
	insert into Accounts(Account_name, Account_password, Account_type) values ( @user, @password, @type)
	update Staffs
		set Account_id = a.Account_id from Accounts a, Staffs s, inserted i where a.Account_name = @user and i.Staff_id = s.Staff_id
end
go

create trigger autoInserItemPriceOrder on Orderdetail
after insert, update
as
begin
	update Orderdetail
		set Item_price = Items.Item_price from Items, inserted, Orderdetail where inserted.Item_id = Items.Item_id and  Items.Item_id = Orderdetail.Item_id
end;
go

create or alter trigger autoUpdateQuantity on Orderdetail
after insert
as
begin
	if exists (select * from OrderDetail o, inserted i where o.Item_id = i.Item_id)
		update	OrderDetail
			set Item_quantity = o.Item_quantity + i.Item_quantity from OrderDetail o, inserted i where o.Item_id = i.Item_id;
	with temp as (select Order_id, Item_id, ROW_NUMBER() OVER (Partition by Order_id, Item_id Order by Order_id, Item_id) rownum from OrderDetail) 
	delete from temp where rownum > 1
end
go

create trigger autoChangeAcountType on Staffs
after update
as begin
	update Accounts
		set Account_type = i.Role_id from Staffs s, Accounts a, inserted i where i.Staff_id = s.Staff_id and a.Account_id = s.Account_id
end