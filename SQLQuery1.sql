select * from SuplierTiresOKpneu where ExternalStore > 4 and Size = 1956515

Update SuplierTiresOKpneu
set OnStore = 10
where ExternalStore > 4 and Size = 1956515

select * from Items

select * from WorkItems

select * from SuplierTiresOKpneu where EAN = 'PZ052'

declare @x int
begin
Exec InsertItemsFaktura PZ052,bla,500,170,1,@x out
print @x
end