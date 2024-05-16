-- 查询SQL
select * from TT_DL where PP_NO = '6920007681_0002';
select * from TT_DL;
select * from TT_PO;
select * from TT_PP;
select * from TT_DL_II;
select * from TT_DL_PAR;
select * from TM_MAT;
select * from TM_II;
select * from TM_WORK;
select* from TM_PROC;

-- 添加索引
create index ix_TT_PP_TM_ORG_ID on TT_PP (TM_ORG_ID);
create index ix_TT_PP_PRODUCT_ID on TT_PP (PRODUCT_ID);
create index ix_TT_PP_TM_WORK_ID on TT_PP (TM_WORK_ID);
create index ix_TT_PP_TT_PO_ID on TT_PP (TT_PO_ID);

-- 添加索引
create index ix_TT_PO_PRODUCT_ID on TT_PO (PRODUCT_ID);
create index ix_TT_PO_TM_ORG_ID on TT_PO (TM_ORG_ID);
create index ix_TT_PO_TM_WORK_ID on TT_PO (TM_WORK_ID);

-- 添加索引
create index ix_TT_DL_CREATE_BY on TT_DL (CREATE_BY);
create index ix_TT_DL_TM_ORG_ID on TT_DL (TM_ORG_ID);
create index ix_TT_DL_TT_PO_ID on TT_DL (TT_PO_ID);
create index ix_TT_DL_TT_PP_ID on TT_DL (TT_PP_ID);
create index ix_TT_DL_PRODUCT_ID on TT_DL (PRODUCT_ID);
create index ix_TT_DL_WORK_ID on TT_DL (TM_WORK_ID);
create index ix_TT_DL_WC_ID on TT_DL (TM_WC_ID);
create index ix_TT_DL_TM_PROC_ID on TT_DL (TM_PROC_ID);

-- 创建TT_RM_LOT索引
create index HTMES.ix_TT_RM_LOT_TM_ORG_ID on "HTMES".TT_RM_LOT (TM_ORG_ID);
create index HTMES.ix_TT_RM_LOT_TT_DL_ID on "HTMES".TT_RM_LOT (TT_DL_ID);
create index HTMES.ix_TT_RM_LOT_TT_PO_ID on "HTMES".TT_RM_LOT (TT_PO_ID);
create index HTMES.ix_TT_RM_LOT_TT_PP_ID on "HTMES".TT_RM_LOT (TT_PP_ID);
create index HTMES.ix_TT_RM_LOT_PRODUCT_ID on "HTMES".TT_RM_LOT (PRODUCT_ID);
create index HTMES.ix_TT_RM_LOT_TM_WORK_ID on "HTMES".TT_RM_LOT (TM_WORK_ID);
create index HTMES.ix_TT_RM_LOT_TM_PROC_ID on "HTMES".TT_RM_LOT (TM_PROC_ID);
create index HTMES.ix_TT_RM_LOT_TM_MAT_ID on "HTMES".TT_RM_LOT (MAT_ID);

-- 收集统计信息
BEGIN
   DBMS_STATS.gather_table_stats(ownname => 'HTMES',
                   estimate_percent => 30,
                   degree => 4,
                                  tabname=>'TM_',
                                  CASCADE => true,
                   no_invalidate => false
                                 );
END;


