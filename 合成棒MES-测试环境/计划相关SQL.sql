-- 计划状态(0-已关闭 2-已排程)
select * from TT_DL;
select * from TT_PO;
select * from TT_PP;

select count(*) from TT_PP;

-- 查询计划数量
select * from TT_PP;

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
select * from TT_DL_SCC;
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

-- 创建索引
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

-- 慢sql优化
select * from ( select ttdl0_.* from TT_DL ttdl0_, TM_MAT tmmat1_ where ttdl0_.PRODUCT_ID=tmmat1_.TM_MAT_ID and (ttdl0_.DL_NO like '%6004441242_0012%' or tmmat1_.CODE like '%6004441242_0012%' or ttdl0_.TT_DL_ID in (select ttdlpar2_.TT_DL_ID from TT_DL_PAR ttdlpar2_ where ttdlpar2_.DEFAULT_VALUE like '%6004441242_0012%') or ttdl0_.TT_DL_ID in (select ttdlii3_.TT_DL_ID from TT_DL_II ttdlii3_ where ttdlii3_.II_DATA like '%6004441242_0012%')) and ttdl0_.CREATE_DATE>=to_timestamp('03/08/2024 00:00:00.000', 'mm/dd/yyyy hh24:mi:ss.ff3') and ttdl0_.CREATE_DATE<=to_timestamp('05/08/2024 23:59:59.000', 'mm/dd/yyyy hh24:mi:ss.ff3') order by ttdl0_.PP_NO desc, ttdl0_.SEQ ) where rownum <= 10;



