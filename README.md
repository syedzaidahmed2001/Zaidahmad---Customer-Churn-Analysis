
Customer Churn Analysis Project

Purpose

The purpose of this project is to analyze and predict customer churn based on various demographic, service, and payment characteristics. By diving deep into customer data, the goal is to uncover insights that help businesses identify the factors leading to customer churn and create effective strategies to enhance customer retention. 

This analysis leverages SQL queries to explore customer behavior, demographic trends, service usage, and payment patterns to understand what influences churn. Data cleaning processes have also been applied to ensure the dataset is ready for analysis, making the results more accurate and actionable.

Data Cleaning Process

Before diving into the analysis, comprehensive data cleaning was conducted to ensure the dataset's quality. The following steps were taken:

1. Missing Data Handling
   - Filled missing values in key columns (e.g., `monthly_charges`, `total_charges`) using imputation techniques such as mean, median, or mode based on the column's              distribution.
   - Ensured no missing values remained in critical fields to avoid skewed analysis results.

2. Outlier Detection and Removal
   - Applied statistical methods (Z-scores, IQR) to identify outliers in columns like `total_charges` and `monthly_charges`.
   - Removed or corrected extreme outlier values based on context and business rules to maintain data integrity.

3. Duplicate Data Removal
   - Checked for duplicate records and removed them to ensure no repetition of customer data, preventing skewed analysis.

4. Data Type Consistency
   - Ensured that columns had the appropriate data types (e.g., `total_charges` as numeric, `gender` as categorical) for consistent analysis.
   - Converted categorical variables (e.g., `gender`, `contract`) into numerical formats to facilitate querying and analysis.

5. Data Transformation
   - Applied necessary transformations, including encoding categorical columns and aggregating values where needed to prepare the dataset for SQL-based analysis.

With the data cleaned and ready for exploration, the following analyses were conducted to uncover insights into the factors contributing to customer churn.

Key Sections of Analysis

1. Demographic Analysis
   - Identified churn rates across different age groups (e.g., under 30, 30-50, over 50) and marital status (married vs. single) to examine how demographic factors influence churn.
   - Key Insight: Younger customers and single customers tend to have higher churn rates, highlighting the need for tailored retention strategies for these segments.

2. Location Analysis
   - Analyzed churn behavior across different geographical locations, including state-level insights and urban versus rural analysis.
   - Key Insight: Urban areas, particularly those with high population densities, show higher churn rates, possibly due to more competitive service offerings in these            regions.

3. Service Usage Analysis
   - Explored the relationship between churn rates and service usage patterns (e.g., internet service types, additional services like streaming, device protection).
   - Key Insight: Customers who use additional services (such as device protection and streaming) are less likely to churn, suggesting that value-added services help retain      customers.

4. Payment and Contract Analysis
   - Investigated the relationship between different contract types (month-to-month vs. long-term) and churn rates, as well as billing methods (e.g., paperless billing).
   - Key Insight: Month-to-month contracts have a higher churn rate, whereas customers with long-term contracts tend to stay longer.

5. Customer Behavior Analysis
   - Analyzed plan changes, referrals, and their correlation with churn. Identified the impact of customer behavior like frequent plan changes and referrals on retention.
   - Key Insight: Customers who refer others or make fewer changes to their plans are more likely to stay loyal.

6. Satisfaction and Revenue Analysis
   - Evaluated the impact of customer satisfaction scores and average monthly charges on churn.
   - Key Insight: Higher customer satisfaction scores and larger spending (monthly charges) are associated with lower churn rates, indicating that value-driven customers         are more likely to stay.
 

Key Insights:

- Demographics: Younger and single customers have a higher likelihood of churn.
- Service Usage: Customers using value-added services, like streaming and device protection, are more likely to stay.
- Contracts: Month-to-month contracts show higher churn rates compared to long-term contracts.
- Behavior: Customers with higher referral counts and fewer plan changes tend to stay loyal.
- Satisfaction & Revenue: Higher satisfaction and higher monthly charges correlate with customer retention.
- Geography: Urban areas with high population densities tend to exhibit higher churn, possibly due to the competitive nature of the market.

These insights suggest that businesses should focus on improving service offerings, understanding customer preferences, and implementing targeted retention programs for high-risk segments.


Conclusion

The analysis reveals that customer churn is influenced by factors such as age, marital status, location, service usage, contract type, and customer satisfaction. Younger customers, those on month-to-month contracts, and those in densely populated areas show higher churn rates. Offering additional services and promoting long-term contracts can help improve retention. Customers who opt for paperless billing, refer friends, and have higher satisfaction scores are less likely to churn. By focusing on these areas, businesses can reduce churn and enhance customer loyalty.



"In this project, I analyzed various factors affecting customer churn, such as age, marital status, service usage, payment methods, and satisfaction. I found that younger customers and those on monthly contracts were more likely to churn, while offering additional services and high customer satisfaction helped retain customers. Based on these findings, I recommend improving customer satisfaction, providing bundled services, and offering more flexible contract options to reduce churn."


"I used a relational database for this project. The data is structured across multiple tables, such as customer information, payment details, service usage, and churn analysis. I performed SQL queries to analyze relationships between these tables and derive insights on customer behavior and churn patterns."

Next Steps

- Predictive Model Development: Build machine learning models to predict churn and proactively implement retention strategies.
- Targeted Marketing: Use demographic and behavioral insights to create personalized marketing campaigns.
- Loyalty Programs: Develop loyalty programs for high-value customers and those with frequent referrals to reduce churn.

Technologies Used

- SQL for data manipulation and analysis
- Data Cleaning: Missing data imputation, outlier detection and removal, duplicate removal, data transformation
- Data Exploration and Statistical Analysis to identify trends, patterns, and churn predictors
- Churn Prediction Models (future work)


 
 
