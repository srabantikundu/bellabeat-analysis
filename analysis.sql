-- Queries for data validations

select sum(count) total
from 
(
SELECT count(distinct Id) count
from `bellabeat`.`daily_activity` 
group by ID
) total;

select sum(count) total
from 
(
SELECT count(distinct Id) count
from `bellabeat`.`sleep_day` 
group by ID
) total;

select sum(count) total
from 
(
SELECT count(distinct Id) count
from `bellabeat`.`weight_loginfo` 
group by ID
) total;


--
SELECT id, SUM(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) as total_activity_minutes
FROM bellabeat.daily_activity da 
group by id;

--
select id, SUM(TotalMinutesAsleep) as total_sleep_minutes
from bellabeat.sleep_day sl
group by id;

--
select da.id, da.total_activity_minutes, sl.total_sleep_minutes
from 
(
SELECT id, SUM(VeryActiveMinutes + FairlyActiveMinutes + LightlyActiveMinutes) as total_activity_minutes
FROM bellabeat.daily_activity  
group by id
) da 
left join
(
select id, SUM(TotalMinutesAsleep) as total_sleep_minutes
from bellabeat.sleep_day 
group by id
) sl on da.id=sl.id;


--

SELECT da.id, SUM(da.VeryActiveMinutes + da.FairlyActiveMinutes + da.LightlyActiveMinutes) as total_activity_minutes , SUM(sl.TotalMinutesAsleep)
FROM bellabeat.daily_activity da left join bellabeat.sleep_day sl
on sl.id = da.id
group by da.id;