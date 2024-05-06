-- 刷新统计信息
BEGIN
   DBMS_STATS.gather_table_stats(ownname => 'HTMES',
                   estimate_percent => 30,
                   degree => 4,
                                  tabname=>'TM_MAT',
                                  CASCADE => true,
                   no_invalidate => false
                                 );
END;
/