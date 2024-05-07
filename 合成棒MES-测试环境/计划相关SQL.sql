-- 计划状态(0-已关闭 2-已排程)

-- 查询计划数量
select count(*)
from TT_PP;

-- 根据订单号查询计划
select * from TT_PP where ORDER_NO = '6004441174';
select * from TT_PP where TT_PP_ID = '170054';

-- 根据订单号查询派工单
select * from TT_DL where ORDER_NO = '6004441174';

select * from HTMES.TT_DL where TT_PP_ID = '170054';

-- todo 删除派工单号很慢
delete from HTMES.TT_DL a where a.TT_DL_ID = 1709387;

-- 根据派工单号查询工艺参数
select * from HTMES.TT_DL_PAR a where a.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where TT_PP_ID = '170054');

-- 删除工艺参数
delete from TT_DL_PAR a where a.TT_DL_ID = '1709377';
-- 批量删除
delete from HTMES.TT_DL_PAR a where a.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where TT_PP_ID = '170054');

-- 根据派工单号查询检验项
select * from TT_DL_II c where c.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where ORDER_NO = '6004441175');

-- 删除检验项
delete from HTMES.TT_DL_II c where c.TT_DL_ID = '1709376';
-- 批量删除
delete from HTMES.TT_DL_II a where a.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where TT_PP_ID = '170054');

-- 根据派工单号查询校验项
select * from TT_DL_SCC c where c.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where ORDER_NO = '6004441175');
-- 删除校验记录
delete from HTMES.TT_DL_SCC c where c.TT_DL_ID = '1709377';
-- 批量删除
delete from HTMES.TT_DL_SCC a where a.TT_DL_ID in (select TT_DL_ID from HTMES.TT_DL where TT_PP_ID = '170054');

-- 工单领料/退料计划
select * from TT_RM_REQ where ORDER_NO = 6004441174;

-- 查询完工数据项信息
select * from TT_CDI where TT_PP_ID = '170054';

-- 创建索引
select * from TT_PO;
create index HTMES.ix_TT_PO_TM_ORG_ID on "HTMES".TT_PO (TM_ORG_ID);
create index HTMES.ix_TT_PO_PRODUCT_ID on "HTMES".TT_PO (PRODUCT_ID);
create index HTMES.ix_TT_PO_TM_WORK_ID on "HTMES".TT_PO (TM_WORK_ID);

select * from TT_PP;
create index HTMES.ix_TT_PP_TM_ORG_ID on "HTMES".TT_PP (TM_ORG_ID);
create index HTMES.ix_TT_PP_PRODUCT_ID on "HTMES".TT_PP (PRODUCT_ID);
create index HTMES.ix_TT_PP_TM_WORK_ID on "HTMES".TT_PP (TM_WORK_ID);
create index HTMES.ix_TT_PP_TT_PO_ID on "HTMES".TT_PP (TT_PO_ID);

BEGIN
    DBMS_STATS.gather_table_stats(ownname => 'HTMES',
                                  estimate_percent => 30,
                                  degree => 4,
                                  tabname=>'TT_PO',
                                  CASCADE => true,
                                  no_invalidate => false
    );
END;
/



