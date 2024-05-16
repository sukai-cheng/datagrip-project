select * from HTMES.TT_DL where DL_NO = '6004563405_0009_003';
select * from HTMES.TT_DL;


BEGIN
   DBMS_STATS.gather_table_stats(ownname => 'HTMES',
                   estimate_percent => 30,
                   degree => 4,
                                  tabname=>'TT_DL',
                                  CASCADE => true,
                   no_invalidate => false
                                 );
END;
/