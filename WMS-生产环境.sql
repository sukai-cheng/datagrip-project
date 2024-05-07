-- 查看标记
select *
from dbo.InventoryFlag if2
where InventoryId = '65A0A63C-22A1-4214-B59C-20DCA9160662';

-- 根据批次编号查询库存编号
select *
from dbo.Inventory i
where Lot = 'SXB3W0124D22032';
