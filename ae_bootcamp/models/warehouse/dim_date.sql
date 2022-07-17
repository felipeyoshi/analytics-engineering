with date_range as (
    select to_date('20500101','YYYYMMDD') last_date
),

date_array as (
    select 
        dateadd(day, -1*seq4(), date_range.last_date ) as date_id
    from date_range, table(generator(rowcount => (50*365) )) 
 ) 

select 
    date(date_id) as id,
    date_id       as full_date,
    year(date_id) as year,
    month(date_id) as month,
    day(date_id) as day,
    week(date_id) as week,
    quarter(date_id) as quarter,
    monthname(date_id) as month_name,
    dayname(date_id) as day_name,
    case
        when dayname(date_id) in('Sun', 'Sat') then False
        else True
    end as weekday
from date_array 
order by 1 desc