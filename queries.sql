### Demographic Analysis:

-- 1. What is the churn rate for different age groups (e.g., under 30, 30-50, over 50)?


select 
    case 
        when ci.age < 30 then 'Under 30'
        when ci.age between 30 and 50 then '30-50'
        when ci.age > 50 then 'Over 50'
        else 'Unknown'
    end as age_group,
    (count(case when sa.churn_label = 'Yes' then 1 end) * 1.0 / count(*)) as churn_rate
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
group by 
    age_group;

select * from status_analysis;





-- 2. How does churn rate vary by marital status (married vs. single)?

select 
    case 
        when ci.married = 'Yes' then 'Married'
        when ci.married = 'No' then 'Single'
        else 'Unknown'
    end as marital_status,
    (count(case when sa.churn_label = 'Yes' then 1 end) * 1.0 / count(*)) as churn_rate
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
group by 
    marital_status;
    
    
    

 
### Location Analysis:

-- 4. How does the geographical distribution of customers impact their likelihood to churn?

select 
    ld.state,
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    location_data ld on ci.customer_id = ld.customer_id
group by 
    ld.state
order by 
    churned_customers desc;
    
    
    
    
    
-- 5. Does living in a densely populated area correlate with increased customer churn?

select 
    case 
        when ld.total_population < 100000 then 'Small Population'
        when ld.total_population between 100000 and 1000000 then 'Medium Population'
        when ld.total_population > 1000000 then 'Large Population'
        else 'Unknown'
    end as population_group,
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    location_data ld on ci.customer_id = ld.customer_id
group by 
    population_group
order by 
    churned_customers desc;
    
    
    
    
    
    
    
    
### Service Usage Analysis:
-- 6. What are the most common reasons for churn among customers with internet service vs. those without?


select 
    oi.internet_service, 
    sa.churn_reason, 
    count(*) as churn_count
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    online_services oi on ci.customer_id = oi.customer_id
where 
    sa.churn_label = 'Yes'
group by 
    oi.internet_service, sa.churn_reason
order by 
    churn_count desc;







-- 7. How does the presence of additional services (e.g., device protection, streaming) influence customer retention?

 select 
    oi.device_protection, 
    oi.streaming_tv, 
    oi.streaming_movies, 
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    online_services oi on ci.customer_id = oi.customer_id
group by 
    oi.device_protection, oi.streaming_tv, oi.streaming_movies
order by 
    retained_customers desc;







### Payment and Contract Analysis:
-- 8. Does the type of contract (e.g., month-to-month vs. yearly) have a noticeable impact on customer loyalty?

select 
    pi.contract, 
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    payment_info pi on ci.customer_id = pi.customer_id
group by 
    pi.contract
order by 
    churned_customers desc;







-- 9. What patterns emerge among customers who opt for paperless billing versus those who don’t?

select 
    pi.paperless_billing, 
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    payment_info pi on ci.customer_id = pi.customer_id
group by 
    pi.paperless_billing
order by 
    churned_customers desc;







### Customer Behavior Analysis:
-- 10. Are customers who frequently change plans or services more likely to churn?

select 
    oi.internet_service, 
    oi.phone_service,
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers,
    count(*) as total_changes
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    online_services oi on ci.customer_id = oi.customer_id
group by 
    oi.internet_service, oi.phone_service
order by 
    total_changes desc;






-- 11. How does the number of referrals a customer has made correlate with their likelihood to stay or leave?

select 
    service_options.number_of_referrals, 
    count(case when sa.churn_label = 'Yes' then 1 end) as churned_customers,
    count(case when sa.churn_label = 'No' then 1 end) as retained_customers
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    service_options on ci.customer_id = service_options.customer_id
group by 
    service_options.number_of_referrals
order by 
    service_options.number_of_referrals desc;
    
    
    
    
    

### Satisfaction and Revenue Analysis:

-- 12. How does customer satisfaction score vary across different service types and customer demographics?


select 
    oi.internet_service, 
    oi.phone_service, 
    ci.gender, 
    case
        when ci.age < 30 then 'Under 30'
        when ci.age between 30 and 50 then '30-50'
        when ci.age > 50 then 'Over 50'
    end as age_group,
    avg(sa.satisfaction_score) as avg_satisfaction_score
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    online_services oi on ci.customer_id = oi.customer_id
group by 
    oi.internet_service, oi.phone_service, ci.gender, age_group
order by 
    avg_satisfaction_score desc;







-- 13. Do higher-value customers (those with higher monthly charges) tend to stay longer than lower-value ones?

select 
    pi.monthly_charges, 
    avg(service_options.tenure) as avg_tenure
from 
    customer_info ci
join 
    payment_info pi on ci.customer_id = pi.customer_id
join 
    service_options on ci.customer_id = service_options.customer_id
group by 
    pi.monthly_charges
order by 
    pi.monthly_charges desc;








-- Additional

-- 14. What is the average monthly charge for customers who have stayed beyond a certain tenure 
-- (e.g., 12 months) compared to those who have churned?


with tenure_customers as (
    select 
        pi.customer_id,
        pi.monthly_charges,
        so.tenure,
        sa.churn_label
    from 
        customer_info ci
    join 
        payment_info pi on ci.customer_id = pi.customer_id
    join 
        service_options so on ci.customer_id = so.customer_id
    join 
        status_analysis sa on ci.customer_id = sa.customer_id
    where 
        so.tenure > 12
)
select 
    churn_label,
    avg(monthly_charges) as avg_monthly_charge
from 
    tenure_customers
group by 
    churn_label;





-- 15. How do the average satisfaction scores differ for customers based on the type of service
--  they have (e.g., internet, phone)?

with service_satisfaction as (
    select 
        oi.internet_service,
        oi.phone_service,
        sa.satisfaction_score
    from 
        customer_info ci
    join 
        status_analysis sa on ci.customer_id = sa.customer_id
    join 
        online_services oi on ci.customer_id = oi.customer_id
)
select 
    internet_service,
    phone_service,
    avg(satisfaction_score) as avg_satisfaction_score
from 
    service_satisfaction
group by 
    internet_service, phone_service;




-- 16. What is the average monthly charge of customers who have churned,
--  compared to those who have stayed, based on their total charges?

select 
    sa.churn_label,
    avg(pi.monthly_charges) as avg_monthly_charge
from 
    customer_info ci
join 
    status_analysis sa on ci.customer_id = sa.customer_id
join 
    payment_info pi on ci.customer_id = pi.customer_id
where 
    sa.churn_label IN (select distinct churn_label from status_analysis where churn_label = 'Yes')
group by 
    sa.churn_label;






-- 17. How does the average tenure of customers 
-- differ between those with paperless billing and those without?

select 
    pi.paperless_billing,
    avg(so.tenure) as avg_tenure
from 
    customer_info ci
join 
    service_options so on ci.customer_id = so.customer_id
join 
    payment_info pi on ci.customer_id = pi.customer_id
where 
    pi.paperless_billing = (select distinct paperless_billing from payment_info where paperless_billing = 'Yes')
group by 
    pi.paperless_billing;
