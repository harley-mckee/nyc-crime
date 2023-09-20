select 	
	BORO_NM as borough, 
	strftime('%H',CMPLNT_FR_TM) as hour, 
	count(*) as total_crimes
from 
	nypd_crimes
where 
	hour is not null
group by 
	borough, 
	hour
order by 
	hour;
