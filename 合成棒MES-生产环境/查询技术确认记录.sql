select *
from TT_WMS_RETURN t
where CUSTOMER_PASSED is not null
order by CREATE_DATE desc;