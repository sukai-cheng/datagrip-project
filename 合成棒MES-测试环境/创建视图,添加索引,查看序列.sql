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



-- 查询序列值
select SEQ_TC_CODE_TYPE_ID.nextval from DUAL;