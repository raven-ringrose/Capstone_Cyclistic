# 🚴‍♀️ Capstone: Cyclistic by Raven Ringrose
### Comparing Cyclistic Member and Casual Rider Usage — A Q1 Data Analysis

---

## 🧭 Overview
This project analyzes Q1 2025 data from the fictional **Cyclistic** bike-share program to identify differences in behavior between **casual riders** and **annual members**.  
The goal: uncover insights that support **data-driven membership conversion strategies**.

---

## 📁 Data Pipeline Overview

```mermaid
flowchart TD
    A[Raw Data<br>2019_Q1_Cleaned + 2020_Q2_Cleaned] --> B[BigQuery Dataset]
    B --> C[create_trips_clean.sql<br>Normalize + Merge Tables]
    C --> D[trips_clean Table<br>Cleaned, Unified Schema]
    D --> E[data_validation.sql<br>Quality & Consistency Checks]
    E --> F[Analysis & Visualization<br>Looker Studio + R (ggplot2)]
    F --> G[Final Report<br>Capstone_Cyclistic_by_Raven_Ringrose.pdf]
```
---

## 🧰 Tools Used
- **BigQuery** — SQL queries for data cleaning, aggregation, and exploration  
- **Looker Studio** — dashboard creation and visual analytics  
- **Google Sheets** — data validation and organization  
- **R (ggplot2)** — additional data visualization  

---

## 📊 Key Questions
- How do ride habits differ between casual and member riders?  
- What time of day, day of week, or month shows the most activity for each group?  
- How do ride duration and frequency vary by user type?

---

## 🧹 Data Preparation
- Removed duplicates and nulls  
- Standardized datetime and ride length fields  
- Created calculated fields for **ride duration** and **day of week**  
- Joined 3 months of Q1 data into a unified dataset  

---

## 📈 Dashboard Highlights
![Dashboard Screenshot](visuals/dashboard_screenshot.png)  
- Casual riders accounted for **8.6%** of total rides  
- Members ride more frequently on weekdays (commuting)  
- Casual riders favor weekends and longer leisure trips  

---

## 🧠 Insights
1. **Casual riders** use Cyclistic mainly for recreation and weekends.  
2. **Members** use it consistently for daily commuting.  
3. Conversion opportunities lie in weekend users — promoting annual membership as a *flexible, cost-saving option*.

---

## 📎 Files
- [`Capstone_Cyclistic_by_Raven_Ringrose.pdf`](Capstone_Cyclistic_by_Raven_Ringrose.pdf) — Full presentation deck  
- [`sql/cyclistic_queries.sql`](sql/cyclistic_queries.sql) — BigQuery SQL scripts  

---

## 🌐 Author
**Christine “Raven” Ringrose**  
📧 raven.ringrose@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com/in/YOURPROFILE) | [GitHub](https://github.com/raven-ringrose)
