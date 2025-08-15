-- 1) General Validation

	-- 1 Are there any duplicate records in any table?
    
    
    -- customer_info
select customer_id, gender, age, under_30, senior_citizen, partner, dependents, number_of_dependents, married, count(*)
from customer_info
group by customer_id, gender, age, under_30, senior_citizen, partner, dependents, number_of_dependents, married
having count(*) > 1;




-- location_data
select customer_id, country, state, city, zip_code, total_population, latitude, longitude, count(*)
from location_data
group by customer_id, country, state, city, zip_code, total_population, latitude, longitude
having count(*) > 1;




-- online_services
select customer_id, phone_service, internet_service, online_security, online_backup, device_protection, premium_tech_support, streaming_tv, streaming_movies, streaming_music, internet_type, count(*)
from online_services
group by customer_id, phone_service, internet_service, online_security, online_backup, device_protection, premium_tech_support, streaming_tv, streaming_movies, streaming_music, internet_type
having count(*) > 1;





-- payment_info
select customer_id, contract, paperless_billing, payment_method, monthly_charges, avg_monthly_long_distance_charges, total_charges, total_refunds, total_extra_data_charges, total_long_distance_charges, total_revenue, count(*)
from payment_info
group by customer_id, contract, paperless_billing, payment_method, monthly_charges, avg_monthly_long_distance_charges, total_charges, total_refunds, total_extra_data_charges, total_long_distance_charges, total_revenue
having count(*) > 1;



ALTER TABLE payment_info
CHANGE `monthly_ charges` monthly_charges DOUBLE;





-- service_options
select customer_id, tenure, internet_service, phone_service, multiple_lines, avg_monthly_gb_download, unlimited_data, offer, referred_a_friend, number_of_referrals, count(*)
from service_options
group by customer_id, tenure, internet_service, phone_service, multiple_lines, avg_monthly_gb_download, unlimited_data, offer, referred_a_friend, number_of_referrals
having count(*) > 1;





-- status_analysis
select customer_id, satisfaction_score, cltv, customer_status, churn_score, churn_label, churn_value, churn_category, churn_reason, count(*)
from status_analysis
group by customer_id, satisfaction_score, cltv, customer_status, churn_score, churn_label, churn_value, churn_category, churn_reason
having count(*) > 1;

    










-- 2) Are there any NULL values in the database?

-- customer_info
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(gender) as gender_not_null,
    count(age) as age_not_null,
    count(under_30) as under_30_not_null,
    count(senior_citizen) as senior_citizen_not_null,
    count(partner) as partner_not_null,
    count(dependents) as dependents_not_null,
    count(number_of_dependents) as number_of_dependents_not_null,
    count(married) as married_not_null
from customer_info;

-- location_data
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(country) as country_not_null,
    count(state) as state_not_null,
    count(city) as city_not_null,
    count(zip_code) as zip_code_not_null,
    count(total_population) as total_population_not_null,
    count(latitude) as latitude_not_null,
    count(longitude) as longitude_not_null
from location_data;

-- online_services
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(phone_service) as phone_service_not_null,
    count(internet_service) as internet_service_not_null,
    count(online_security) as online_security_not_null,
    count(online_backup) as online_backup_not_null,
    count(device_protection) as device_protection_not_null,
    count(premium_tech_support) as premium_tech_support_not_null,
    count(streaming_tv) as streaming_tv_not_null,
    count(streaming_movies) as streaming_movies_not_null,
    count(streaming_music) as streaming_music_not_null,
    count(internet_type) as internet_type_not_null
from online_services;

-- payment_info
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(contract) as contract_not_null,
    count(paperless_billing) as paperless_billing_not_null,
    count(payment_method) as payment_method_not_null,
    count(monthly_charges) as monthly_charges_not_null,
    count(avg_monthly_long_distance_charges) as avg_monthly_long_distance_charges_not_null,
    count(total_charges) as total_charges_not_null,
    count(total_refunds) as total_refunds_not_null,
    count(total_extra_data_charges) as total_extra_data_charges_not_null,
    count(total_long_distance_charges) as total_long_distance_charges_not_null,
    count(total_revenue) as total_revenue_not_null
from payment_info;

-- service_options
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(tenure) as tenure_not_null,
    count(internet_service) as internet_service_not_null,
    count(phone_service) as phone_service_not_null,
    count(multiple_lines) as multiple_lines_not_null,
    count(avg_monthly_gb_download) as avg_monthly_gb_download_not_null,
    count(unlimited_data) as unlimited_data_not_null,
    count(offer) as offer_not_null,
    count(referred_a_friend) as referred_a_friend_not_null,
    count(number_of_referrals) as number_of_referrals_not_null
from service_options;

-- status_analysis
select 
    count(*) as total_rows,
    count(customer_id) as customer_id_not_null,
    count(satisfaction_score) as satisfaction_score_not_null,
    count(cltv) as cltv_not_null,
    count(customer_status) as customer_status_not_null,
    count(churn_score) as churn_score_not_null,
    count(churn_label) as churn_label_not_null,
    count(churn_value) as churn_value_not_null,
    count(churn_category) as churn_category_not_null,
    count(churn_reason) as churn_reason_not_null
from status_analysis;












-- 3) Are there empty strings in text fields?



-- customer_info
select 
    count(*) as total_rows,
    count(case when customer_id = '' then 1 end) as customer_id_empty,
    count(case when gender = '' then 1 end) as gender_empty,
    count(case when under_30 = '' then 1 end) as under_30_empty,
    count(case when senior_citizen = '' then 1 end) as senior_citizen_empty,
    count(case when partner = '' then 1 end) as partner_empty,
    count(case when dependents = '' then 1 end) as dependents_empty,
    count(case when married = '' then 1 end) as married_empty
from customer_info;

-- location_data
select 
    count(*) as total_rows,
    count(case when country = '' then 1 end) as country_empty,
    count(case when state = '' then 1 end) as state_empty,
    count(case when city = '' then 1 end) as city_empty,
    count(case when zip_code = '' then 1 end) as zip_code_empty
from location_data;

-- online_services
select 
    count(*) as total_rows,
    count(case when phone_service = '' then 1 end) as phone_service_empty,
    count(case when internet_service = '' then 1 end) as internet_service_empty,
    count(case when online_security = '' then 1 end) as online_security_empty,
    count(case when online_backup = '' then 1 end) as online_backup_empty,
    count(case when device_protection = '' then 1 end) as device_protection_empty,
    count(case when premium_tech_support = '' then 1 end) as premium_tech_support_empty,
    count(case when streaming_tv = '' then 1 end) as streaming_tv_empty,
    count(case when streaming_movies = '' then 1 end) as streaming_movies_empty,
    count(case when streaming_music = '' then 1 end) as streaming_music_empty,
    count(case when internet_type = '' then 1 end) as internet_type_empty
from online_services;

-- payment_info
select 
    count(*) as total_rows,
    count(case when contract = '' then 1 end) as contract_empty,
    count(case when paperless_billing = '' then 1 end) as paperless_billing_empty,
    count(case when payment_method = '' then 1 end) as payment_method_empty
from payment_info;

-- service_options
select 
    count(*) as total_rows,
    count(case when internet_service = '' then 1 end) as internet_service_empty,
    count(case when phone_service = '' then 1 end) as phone_service_empty,
    count(case when multiple_lines = '' then 1 end) as multiple_lines_empty,
    count(case when unlimited_data = '' then 1 end) as unlimited_data_empty,
    count(case when offer = '' then 1 end) as offer_empty,
    count(case when referred_a_friend = '' then 1 end) as referred_a_friend_empty
from service_options;

-- status_analysis
select 
    count(*) as total_rows,
    count(case when customer_status = '' then 1 end) as customer_status_empty,
    count(case when churn_label = '' then 1 end) as churn_label_empty,
    count(case when churn_category = '' then 1 end) as churn_category_empty,
    count(case when churn_reason = '' then 1 end) as churn_reason_empty
from status_analysis;










-- 4)Are numeric fields set to invalid or negative values?



-- customer_info
select 
    count(*) as total_rows,
    count(case when age < 0 then 1 end) as age_negative,
    count(case when number_of_dependents < 0 then 1 end) as number_of_dependents_negative
from customer_info;

-- location_data
select 
    count(*) as total_rows,
    count(case when total_population < 0 then 1 end) as total_population_negative,
    count(case when latitude < -90 or latitude > 90 then 1 end) as latitude_invalid,
    count(case when longitude < -180 or longitude > 180 then 1 end) as longitude_invalid
from location_data;

-- online_services
select 
    count(*) as total_rows
from online_services;

-- payment_info
select 
    count(*) as total_rows,
    count(case when monthly_charges < 0 then 1 end) as monthly_charges_negative,
    count(case when avg_monthly_long_distance_charges < 0 then 1 end) as avg_monthly_long_distance_charges_negative,
    count(case when total_charges < 0 then 1 end) as total_charges_negative,
    count(case when total_refunds < 0 then 1 end) as total_refunds_negative,
    count(case when total_extra_data_charges < 0 then 1 end) as total_extra_data_charges_negative,
    count(case when total_long_distance_charges < 0 then 1 end) as total_long_distance_charges_negative,
    count(case when total_revenue < 0 then 1 end) as total_revenue_negative
from payment_info;

-- service_options
select 
    count(*) as total_rows,
    count(case when avg_monthly_gb_download < 0 then 1 end) as avg_monthly_gb_download_negative,
    count(case when number_of_referrals < 0 then 1 end) as number_of_referrals_negative
from service_options;

-- status_analysis
select 
    count(*) as total_rows,
    count(case when satisfaction_score < 0 or satisfaction_score > 100 then 1 end) as satisfaction_score_invalid,
    count(case when cltv < 0 then 1 end) as cltv_negative,
    count(case when churn_score < 0 or churn_score > 100 then 1 end) as churn_score_invalid,
    count(case when churn_value < 0 then 1 end) as churn_value_negative
from status_analysis;












 

 




 
