-- 创建索引
create index ix_TT_CDI_CREATE_DATE on TT_DL(to_char(CREATE_DATE),'yyyy');

-- 整合数据
select m.NAME_CN procName,
       t.DL_NO   dlNo,
       c.II_DATA articlesNo,
       a.CODE    materialNo,
       a.NAME_CN materialDesc,
       DL_STATUS dlStatus
from TT_DL t
         left join TM_MAT a on t.PRODUCT_ID = a.TM_MAT_ID
         left join TM_PROC m on t.TM_PROC_ID = m.TM_PROC_ID
         left join TT_CDI_V c on c.PP_NO = t.PP_NO
where round(sysdate - TO_DATE(to_char(t.CREATE_DATE, 'yyyy-MM-dd'), 'yyyy-MM-dd')) < 180
  and substr(t.DL_NO, 0, 3) != '691'
  and (t.DL_STATUS = 2 or t.DL_STATUS = 3)
order by m.NAME_CN;

-- 创建视图
CREATE OR REPLACE VIEW TT_CDI_V
AS
SELECT T.PP_NO,
       T.II_DATA
FROM TT_CDI T
         INNER JOIN TM_II T2
                    ON T.TM_II_ID = T2.TM_II_ID
where T2.TM_II_ID = 1442
  and round(sysdate - TO_DATE(to_char(t.CREATE_DATE, 'yyyy-MM-dd'), 'yyyy-MM-dd')) < 180;


-- 查询序列值
select SEQ_TC_CODE_TYPE_ID.nextval from DUAL;

BEGIN
   DBMS_STATS.gather_table_stats(ownname => 'HTMES',
                   estimate_percent => 30,
                   degree => 4,
                                  tabname=>'TT_RM_LOT',
                                  CASCADE => true,
                   no_invalidate => false
                                 );
END;
/