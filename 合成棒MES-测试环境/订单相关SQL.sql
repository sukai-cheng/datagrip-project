-- 订单状态(0-已关闭 2-已拆分)
-- 查询订单数量
select count(*) from TT_PO;
-- 根据订单号查询订单
select * from TT_PO t where ORDER_NO = '6004441174';

select * from TM_MAT where CODE = '8000312413';

select * from TM_BOM;




