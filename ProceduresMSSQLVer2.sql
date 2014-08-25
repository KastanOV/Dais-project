create procedure AttendanceArrival @p_id int
as

begin
	insert into EmployeeAttendance values (getdate(), null,null,0,@p_id);
end

go

create procedure [dbo].[AttendanceExit] @p_id int
as
	declare @v_arrival datetime;
	declare @v_emp_exp float;
	declare @v_EmployeesInWork int;
	declare @v_payments int;
	declare @v_worktime float;
	declare @v_exp_updater float;
	declare @v_wage money;
	
begin
	--najdi prichod 
	select @v_arrival = Arrival from Employeeattendance
	where @p_id = Employees_id and "Exit" is null;
	
	--najdi experience
	select @v_emp_exp = Experience from Employees
	where @p_id = id;
	
	--najdi trzbu
	select @v_payments = sum(Payment) from Contract
	where CustomerArrival between @v_arrival and getdate() and CustomerExit between @v_arrival and getdate();

	--Spocitej odpracovany cas
	set @v_worktime = convert(float,datediff(minute, @v_arrival, getdate())) / 60.0;
	
	--Prepocitej na Experienc koeficient
	if @v_payments is not null
		set @v_exp_updater = @v_payments/@v_worktime;
	else
		set @v_exp_updater = 1;
	--print convert(varchar,@v_exp_updater);
	
	set @v_emp_exp = (@v_emp_exp/100) + 1;
	set @v_exp_updater = (@v_exp_updater/100) + 1; 
	
	--Vyber nizsi Experiance koeficient
	if @v_exp_updater < @v_emp_exp
		set @v_wage = 50 * @v_exp_updater * @v_worktime;
	else
		set @v_wage = 50 * @v_emp_exp * @v_worktime;
	
	--print 'Odpracovaný cas ' + convert(varchar(20),@v_worktime) + ' Vyplata ' + convert(varchar(20), @v_wage);

	update EmployeeAttendance 
	set "Exit" = getdate(), Wage = @v_wage
	where @p_id = Employees_id and "Exit" is null ;

end

go

create procedure [dbo].[ContractArrival] @p_CustomerID int, @p_EmployeesID int,  @p_GarageNumber smallint
as
	declare @ResultCounter int;
	declare @v_result int;
	
begin

	select @v_result = count(*) from Contract
	where GarageNumber = @p_GarageNumber and CustomerExit is null;

	if @v_result = 0
		begin try
			insert into Contract (Customers_id, Employees_id, CustomerArrival, GarageNumber)
			values (@p_CustomerID, @p_EmployeesID, getdate(), @p_GarageNumber);
			
		--set @p_result = 1;
		end try
		begin catch
		
			--set @p_result = 0;
		end catch;
	--else 
		--set @p_result = 0; 
end

go

create procedure [dbo].[ContractExit] @p_GarageNumber smallint, @p_Payment int, @p_VAT bit
as
	declare @v_result int;
begin
	select @v_result = count(*) from Contract
	where GarageNumber = @p_GarageNumber and CustomerExit is null;

	if @v_result > 0
		begin try
			update Contract
			set CustomerExit = getdate(), Payment = @p_Payment , VAT = @p_VAT
			where GarageNumber = @p_GarageNumber and CustomerExit is null;
			
		end try
		begin catch
		end catch 
end

go

create procedure [dbo].[EmployeeDetail] @p_ID int, @p_wage money output, @p_Worktime float output
as
	declare	@v_start datetime;
	declare @v_end datetime;
	declare @v_WorkTime float = 0.0;
	declare @v_Wage money = 0.0;
	declare @v_WageC money;
begin
	
	Declare c CURSOR for select Arrival, "Exit", Wage from EmployeeAttendance
							where Employees_id = @p_ID and Paid = 0;
	open c
	FETCH FROM c INTO @v_start, @v_end, @v_WageC
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @v_WorkTime = @v_WorkTime + convert(float,DATEDIFF(minute, @v_start, @v_end));
		set @v_Wage = @v_Wage + @v_WageC;
		
		FETCH FROM c INTO @v_start, @v_end, @v_WageC
	END;
	CLOSE c;
	DEALLOCATE c;
	set @p_Worktime = @v_WorkTime / 60.0;
	set @p_wage = @v_Wage;
end 

go


create procedure [dbo].[NewOrder] @p_CustomerID int, @p_EmployeesID int, @p_EAN varchar(14), @p_ProductCount int, @p_price money
as
	declare @v_id int;
begin
	begin transaction first
	begin try
	insert into "Order" (Customers_id,Employees_id, "DATETIME","status") Values (@p_CustomerID, @p_EmployeesID, Getdate(), 'n');
	select @v_id = max(id) from "Order";
	
	insert into OrderSuplierTiresOKPneu values (@p_EAN, @v_id, @p_ProductCount, @p_price);
	commit;
	end try
	begin catch;
		rollback;
	end catch;

end 

go


create procedure [dbo].[UpdateTires] @p_EAN varchar(15), @p_NewPrice money, @p_ExternalStore int
as
	declare @v_price money;
	declare @v_ExternalStore int;
begin
	--begin try
	select @v_price = Price, @v_ExternalStore = ExternalStore from SuplierTiresOKpneu
	where EAN = @p_EAN;

	if @v_price != @p_NewPrice or  @v_ExternalStore != @p_ExternalStore
		update SuplierTiresOKpneu
		set price = @p_NewPrice, ExternalStore = @p_ExternalStore
		where EAN = @p_EAN;
	--end try
	--begin catch
	--print 'Somethin wrong'
	--end catch
end

go

create trigger WriteToPriceHistory on SuplierTiresOKpneu after update
as
	declare @v_oldPrice money;
	declare @v_EAN varchar(14);
	declare @v_OnExternalStore int;
begin
	select @v_oldPrice = price, @v_EAN = EAN, @v_OnExternalStore = ExternalStore from DELETED;

	insert into Pricehistory values ( @v_oldPrice, getdate(),@v_EAN, @v_OnExternalStore); 
end
go

CREATE PROCEDURE [dbo].[InsertItemsFaktura] @EAN VARCHAR (15), @Name VARCHAR(20), @PricePerItem INT, @COUNT INT, @Contract_id INT, @Info int output
AS
	declare @v_Counter int, @v_CountOnInternalStore int
	declare @v_id int
BEGIN
	--Najdi v tabulce ITEMS polozky ktere maji stejny EAN jako nove vlozena pneumatika
	--a contract ID se shoduje s danou zakazkou na ktere se pracuje
	-- pokud není dany EAN v seznamu entic bude treba vytvorit novou polozku jinak se pouze prepocitaji hodnoty
	select @v_Counter = count(*) from Items where EAN = @EAN and @Contract_id = Contract_id
	if @v_Counter > 0
	begin
		select @v_id = id from Items where EAN = @EAN 
		-- Pokud pneumatiky nejsou na lokalním sklade nelze je prodat
		select @v_CountOnInternalStore = OnStore from SuplierTiresOKpneu where EAN = @EAN
		if @v_CountOnInternalStore < @COUNT
		begin
			set @Info = -1
			return
		end
		else 
		
		begin try
		begin transaction
			update SuplierTiresOKpneu
			set OnStore = OnStore - @COUNT
			where EAN = @EAN

			update Items
			set "COUNT" = "COUNT" + @COUNT
			where id = @v_id

			commit
		end try
		begin catch
			set @Info = -1
			rollback
		end catch
	end		 
	else
	begin
		select @v_CountOnInternalStore = OnStore from SuplierTiresOKpneu where EAN = @EAN
		if @v_CountOnInternalStore < @COUNT
		begin
			set @Info = -1
			return
		end
		begin try
		begin transaction
			INSERT INTO Items VALUES (@EAN, @Name, @PricePerItem, @COUNT, @Contract_id)

			update SuplierTiresOKpneu
			set OnStore = OnStore - @COUNT
			where EAN = @EAN

			commit
		end try
		begin catch
			set @Info = -1
			rollback 
		end catch
	end
END

go