# dbt Parcel & Financial Analytics Pipeline

![SQL](https://img.shields.io/badge/Tool-SQL-blue)
![BigQuery](https://img.shields.io/badge/Platform-Google%20BigQuery-red)
![dbt](https://img.shields.io/badge/Tool-dbt-orange)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

This project builds a **dbt-based analytics pipeline on Google BigQuery**, transforming raw parcel, sales, and product data into **operational and financial KPIs** at the parcel level.

---

## 📊 What I Did
- Cleaned and standardized raw parcel, sales, and product data  
- Built staging models following dbt best practices  
- Aggregated parcel-level operational metrics  
- Calculated revenue, purchase cost, product margin, and operational margin  
- Implemented delivery time and delay indicators  
- Added data quality tests (`unique`, `not_null`)  

---

## 🛠 Tools & Methods
**Tools:** dbt, Google BigQuery, SQL  

**Techniques:**
- LEFT JOINs across multiple datasets  
- Aggregations (`SUM`, `COUNT DISTINCT`)  
- Conditional logic with `CASE`  
- Time calculations using `DATE_DIFF` and `EXTRACT`  
- Revenue, cost, and margin calculations  
- Modular dbt modeling (staging → core → financials)  

---

## 📈 Key Insights
- Parcel-level aggregation provides clear operational visibility  
- Delivery and transport metrics highlight delay patterns  
- Financial metrics enable margin and profitability analysis  
- Operational margin helps identify cost drivers  
- KPIs are ready for reporting and dashboarding  

---

## 🧾 Conclusion
This project demonstrates how raw logistics and sales data can be transformed into **reliable operational and financial insights** using dbt, SQL, and BigQuery, enabling data-driven decision-making at the parcel level.

---

## 🔖 Tags
`#dbt` `#SQL` `#BigQuery` `#AnalyticsEngineering`  
`#ParcelAnalytics` `#FinancialAnalytics` `#Revenue` `#Margin`  
`#KPI` `#DataEngineering` `#OperationalAnalytics`



