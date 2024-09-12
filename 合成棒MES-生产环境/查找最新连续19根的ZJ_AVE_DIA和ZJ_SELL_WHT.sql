select xx.DL_NO dlNo,xx.CODE tmCode,xx.II_DATA tmValue
from (select DL_NO, TT_PP_ID, b.CODE, II_DATA, PICKING_SOURCE, AEND_DATE
      from (select *
            from (select n.DL_NO, t.TT_PP_ID, II_DATA, PICKING_SOURCE, t.TM_II_ID, AEND_DATE
                  from TT_CDI t,
                       TT_DL n
                  where
                      t.TM_II_ID in (select TM_II_ID from TM_II where CODE in ('CJ_GBBH', 'ZJ_AVE_DIA', 'ZJ_SELL_WHT'))
                    and t.TT_PP_ID = n.TT_PP_ID
                    and n.DL_STATUS = 4
                    and n.CREATE_DATE >= to_date('2024', 'yyyy')
                  order by AEND_DATE desc)) a,
           (select TM_II_ID, code from TM_II where CODE in ('CJ_GBBH', 'ZJ_AVE_DIA', 'ZJ_SELL_WHT')) b
      where a.TM_II_ID = b.tm_ii_id) xx,
     (select *
      from (select DL_NO,
                   TT_PP_ID,
                   b.CODE,
                   II_DATA,
                   PICKING_SOURCE,
                   AEND_DATE,
                   ROW_NUMBER() OVER (partition by CODE,ii_data ORDER BY aend_date DESC) r1
            from (select *
                  from (select n.DL_NO, t.TT_PP_ID, II_DATA, PICKING_SOURCE, t.TM_II_ID, AEND_DATE
                        from TT_CDI t,
                             TT_DL n
                        where t.TM_II_ID in
                              (select TM_II_ID from TM_II where CODE in ('CJ_GBBH', 'ZJ_AVE_DIA', 'ZJ_SELL_WHT'))
                          and t.TT_PP_ID = n.TT_PP_ID
                          and II_DATA is not null
                          and n.DL_STATUS = 4
                          and n.CREATE_DATE >= to_date('2024', 'yyyy')
                        order by AEND_DATE desc)) a,
                 (select TM_II_ID, code
                  from TM_II
                  where CODE in ('CJ_GBBH')) b
            where a.TM_II_ID = b.tm_ii_id
            order by AEND_DATE desc)
      where r1 = 1
        and rownum <= 19) yy
where xx.dl_no = yy.dl_no
  and xx.tt_pp_id = yy.tt_pp_id
order by xx.code, xx.aend_date desc;