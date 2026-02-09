🛒 Retail Sales Performance Project
This project involves a deep dive into global transactional data, uncovering operational drivers and high-value revenue streams for a retail database. By integrating Python, SQL, and Power BI, the analysis transforms raw sales records into strategic insights for inventory and staffing.


📊 Project Vital Signs

Total Revenue: $8,911,425.90.


Transaction Volume: 18,536 unique invoices.


Average Order Value (AOV): $480.76.


Peak Activity: Daily transactions peak at 12:00 PM.

🛠️ Technical Workflow
1. Python Exploratory Data Analysis (EDA)
Methodology focused on cleaning and feature engineering within VS Code:


Data Preparation: Handled 18,536 rows of sales data using the pandas library.


Data Cleaning: Verified the dataset for null values to ensure the $8.91M total was accurate.


Feature Engineering: Extracted an "hour" column to identify the daily peak at 12:00 PM.


Standardization: Converted column names to snake_case for PostgreSQL compatibility.

2. SQL Business Intelligence
Structured queries were used to identify "Whales" and volume drivers:


Top 10 Whales: Identified elite customers, led by Customer ID 14646 with a lifetime value of $280,206.


Market Share: The United Kingdom dominates the market with 82.01% of total revenue.


Volume Drivers: "Paper Craft, Little Birdie" is the top product by quantity sold with 80,995 units.

3. Power BI Interactive Dashboard
A visual overview was created to track trends and distribution:


Revenue Trends: Visualized the climb from $0.57M in January to a $1.16M peak in November.


Operational Heatmap: Hourly distribution confirms 12:00 PM as the primary bottleneck for warehouse staffing.

💡 Strategic Business Recommendations

Workforce Alignment: Schedule maximum staffing during the 12:00 PM and 3:00 PM surges to maintain service levels.


Inventory Stockpiling: Prioritize high-volume stock by late September to prepare for the Q4 holiday rush where revenue nearly doubles.


High-Value Protection: Classify "Value Leaders" like the Regency Cakestand ($143K revenue) as "Class A" inventory for dedicated monitoring.


Loyalty Tiering: Implement loyalty programs for the 1,494 one-time buyers to stabilize revenue during slower months.