
select * from customer limit 10;

select churn, count(*) as totalcount
from customer group by churn;

select round(count(case when churn='Yes' then 1 end)*100.0/count(*),2) as churnrate from customer;

select contract, round(count(case when churn='Yes' then 1 end)*100/count(*),2) as churnrate
from customer group by contract order by churnrate desc;

select churn, avg(tenure) from customer group by churn;

select churn, avg(monthlycharges) from customer group by churn;

with customer_segment as(
select customerid, tenure, 
case when tenure <= 12 then 'New'
when tenure <=36 then 'Growing'
else 'Loyal'
end as segment,
churn from customer
)

select segment, count(*) as customers from customer_segment group by segment;

select (round(sum(monthlycharges)),2)from customer where churn = 'Yes';

select gender,count(churn), 
count(gender) * 100.0/(select count(*) from customer) as percentage
from customer
group by gender;

select contract, count(churn), 
count(contract) * 100.0/(select count(*) from customer) 
from customer
group by contract;

select internetservice, count(churn),
count(internetservice)*100.0/(select count(*) from customer)
from customer
group by internetservice;

select internetservice, round(count(case when churn='Yes' then 1 end)*100.0/count(*),2) as churnrate from customer
group by internetservice
order by churnrate desc;


