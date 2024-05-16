-- 工艺路径
select *
from TM_PPR
where PPR_VERSION = '8000312413_20240408_004';

-- todo 根据产品工艺路径查询相关工序
select *
from TT_DL
where PP_NO = '6004441174_0002';
select *
from TT_DL_SCC
where TT_DL_ID = 1709401;

INSERT INTO HTMES.TT_DL_SCC (TT_DL_SCC_ID, TT_DL_ID, SCC_TYPE, SC_ITEM, TM_II_ID, TM_EQUIP_ID, TS_USER_ID, MEMO,
                             ENABLED, CREATE_DATE, CREATE_BY, UPDATE_BY, UPDATE_DATE, DELETE_FLG, DELETE_DATE,
                             DELETE_BY, VERSION, PASS_FLAG)
VALUES (SEQ_TT_DL_SCC_ID.nextval, 1709401, '2', '3', 1399, null, null, null, null,
        TIMESTAMP '2024-03-11 23:41:13.946000', 'anonymous', 'anonymous', TIMESTAMP '2024-03-11 23:41:13.946000', null,
        null, null, 0, '1');

-- 查询班组
select *
from TT_DL_SHIFT a
where a.TT_DL_ID = 1709401;
-- 查询检验项
select SC_ITEM, a.*
from TT_DL_SCC a
where TT_DL_ID = 1709401;
-- 查询工装设备
select *
from TT_DL_EQUIP a
where TT_DL_ID = 1709401;
-- 查询检验项
select *
from TT_DL_PAR
where TT_DL_ID = 1709401;

select *
from TI_PRODUCTPROCSTATE
where PP_NO = '6004441174_0002';

select II_PICKING_SOURCE
from TT_DL_II
where TT_DL_ID = 1709401;

-- 02工艺参数 03接口 04计算 05产成品
select *
from TT_DL_II c
where c.TT_DL_ID = 1709401
  and II_PICKING_SOURCE = '04';

select *
from TT_CDI
where PP_NO = '6004441174_0002';

select *
from TT_RM_REQ
where PP_NO = '6004441174_0002';
select *
from TI_RM_REQ
where DL_NO = '6004441174_0002_0001';
select *
from TM_MAT_PROPERTY;
select *
from TM_MAT
where TM_MAT_ID = 9853;
select *
from TT_DL
where DL_NO = '6004441174_0002_002';

select *
from TT_DL_PAR
where TT_DL_ID = 1709402;
select *
from TT_DL_II
where TT_DL_ID = 1709402;
select *
from TT_DL_SCC
where TT_DL_ID = 1709402;

select *
from TT_DL_PAR
where TT_DL_ID = 1713511;

select *
from TT_DL
where TT_DL_ID = '1709408';
select *
from TM_PROC
where TM_PROC_ID = 401;

-- oracle查询锁表
select sess.sid, sess.serial#, lo.oracle_username, lo.os_user_name, ao.object_name, lo.locked_mode
from v$locked_object lo,
     dba_objects ao,
     v$session sess
where ao.object_id = lo.object_id
  and lo.session_id = sess.sid;

--释放资源
alter system kill session '367,26697';

select c.*
from tt_dl a
         left join TM_PROC b on a.TM_PROC_ID = b.TM_PROC_ID
         left join TT_DL_PAR c on a.TT_DL_ID = c.TT_DL_ID
         left join TM_PAR d on c.TM_PAR_ID = d.TM_PAR_ID
where b.CODE = 'PKTEST'
  and a.DL_STATUS = '2'
  and d.CODE = 'ZBHJ_XBBH';

select * from TT_DL where PP_NO = '6004441174_0002';

select * from TT_DL_PAR where TT_DL_ID = '1709409' and PICKING_ITEM = 'ZBHJ_XBBH';

select * from TT_CDI;
select b.code, a.II_DATA
from TT_CDI a
         left join TM_II b on a.TM_II_ID = b.TM_II_ID
where CODE = 'ZBHJ_XBBH';

select ORIGINAL_PLAN_NO 原计划编号, PLAN_NO 计划编号 from TI_ASSEMBLE_RECORD;

select * from TT_PO t where ORDER_NO = '6004441174';

select * from TT_PP t where t.TT_PO_ID = '25317';

select * from TT_DL t where PP_NO = '6004441174_0031';

select * from TT_PP t where t.TT_PO_ID = '25317';

select * from TT_DL where TT_PP_ID = 170121;

select * from TI_ASSEMBLE_RECORD;

select * from TT_DL_PAR where TT_DL_ID = 1709415 or TT_DL_ID = 1709416 or TT_DL_ID = 1709417 or TT_DL_ID = 1709418 or TT_DL_ID = 1709419;
select * from TT_DL_SCC where TT_DL_ID = 1709415 or TT_DL_ID = 1709416 or TT_DL_ID = 1709417 or TT_DL_ID = 1709418 or TT_DL_ID = 1709419;
select * from TT_DL_II where TT_DL_ID = 1709415 or TT_DL_ID = 1709416 or TT_DL_ID = 1709417 or TT_DL_ID = 1709418 or TT_DL_ID = 1709419;




