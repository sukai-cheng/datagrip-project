select * from TI_RM_LOT where LOT_NO = '60046323250008';

select * from TT_RM_LOT where RM_LOT_NO = '60041168050007';

select * from TT_CDI where PP_NO = '6920007704_0042';
select DCS_NO,CODE,NAME_CN,II_DATA from TT_CDI a left join TM_II b on a.TM_II_ID = b.TM_II_ID  where (CODE = 'SCS_KMFDS' or CODE = 'SCS_KCUTS');
select DCS_NO,CODE,NAME_CN,II_DATA from TT_CDI a left join TM_II b on a.TM_II_ID = b.TM_II_ID  where PP_NO = '6004442333_0017' and (CODE = 'SCS_KMFDS' or CODE = 'SCS_KCUTS');
select DCS_NO,CODE,NAME_CN,II_DATA from TT_CDI a left join TM_II b on a.TM_II_ID = b.TM_II_ID  where PP_NO = '6004317368_0009' and (CODE = 'SCS_KMFDS' or CODE = 'SCS_KCUTS');

select PRODUCT_SN from TT_PP where PP_NO = '6920007704_0042';

select * from TI_RM_LOT order by CREATE_DATE desc ;

select * from TT_PP where PP_NO = '6004442333_0017';

select * from TT_DL where PP_NO = '6004632328_0006';

select * from TM_II where CODE = '';

select * from TI_RM_LOT c where c.TRANS_STATUS in ('0') order by UPDATE_DATE desc ;
select * from TI_RM_LOT c where c.TT_RM_REQ_ID = 181057;
select * from TI_RM_LOT c where c.LOT_NO = '69200077120001';
select * from TI_RM_LOT c where c.LOT_NO = '60045003670016';
select * from TT_RM_LOT c where PP_NO = '6920007712_0001';
select * from TI_RM_REQ c where MAT_CODE = '8000312413' ;
select * from TT_RM_REQ c where c.TI_LOT_NO = '69200077120001';
select c.LGORT,MAT_ID from TT_RM_REQ c where TT_RM_REQ_ID = '181057';
select * from TM_MAT where TM_MAT_ID = 9853;
select * from TS_SETTING where NAME = 'LGORT_QUALIFIED';
select * from TI_RM_LOT c where c.TI_RM_LOT_ID = '180584' order by CREATE_DATE desc ;

select b.CODE, a.II_DATA from TT_CDI a left join TM_II b on a.TM_II_ID = b.TM_II_ID where PP_NO = '6920007705_0004' and (b.CODE = 'SCS_KMFDS' or b.CODE = 'SCS_KCUTS');
select b.CODE, a.II_DATA from TT_CDI a left join TM_II b on a.TM_II_ID = b.TM_II_ID where PP_NO = '6920007705_0004' and b.CODE = 'SCS_AIM_LAMDAC';
select * from TM_II where CODE = 'CUSTOMER_KNOW';

select * from TT_DL_PAR t where TT_DL_PAR_ID = 26500190;
