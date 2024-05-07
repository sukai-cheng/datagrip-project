-- 查看标记
select *
from dbo.InventoryFlag if2
where InventoryId = '18EA17F1-EA36-4B2E-BF43-0E9FA9FAAF32';

-- 根据批次编号查询库存编号
select *
from dbo.Inventory i
where Lot = '60044885620019';