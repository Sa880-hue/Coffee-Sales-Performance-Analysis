# Coffee Shop Performance Analysis & Forecasting

A comprehensive project analyzing sales performance of a coffee shop chain using **Excel**, **SQL**, and **Python (ML)**. The aim is to uncover actionable insights, automate dashboards, and build a forecasting model using machine learning.

---

## Project Overview

This project analyzes transactional data to:

- Understand business performance
- Build a visual dashboard
- Forecast monthly revenue
- Recommend strategies based on data insights

---
## Dataset Description

| Column               | Description                            |
|----------------------|----------------------------------------|
| transaction_id       | Unique ID of each sale                 |
| transaction_date     | Date of transaction                    |
| year_month           | Extracted year and month (e.g., 2023-01)|
| weekday              | Day of week                            |
| hour                 | Hour extracted from time               |
| store_location       | Store name (e.g., Hell’s Kitchen)      |
| product_category     | Type of item sold (e.g., Coffee)       |
| unit_price           | Price per item                         |
| transaction_qty      | Quantity sold                          |
| revenue              | Calculated revenue = qty × price       |
| profit               | Calculated profit                      |

---
## Technologies Used

| Tool / Language | Purpose                      |
|------------------|------------------------------|
| Microsoft Excel  | Dashboard, Pivot Charts      |
| SQL (MySQL)      | Querying, Filtering, Joins   |
| Python (scikit-learn, pandas, matplotlib) | ML Modeling, Data Analysis |
| Google Colab     | Jupyter-style ML Notebook    |

---

## How to Connect SQL with Excel

> You can directly execute MySQL queries and refresh Pivot Tables from Excel using the built-in **Data > Get Data > From MySQL Database** connector.

### Steps:

1. **Enable MySQL Connector**
   - Install: [MySQL for Excel Add-In](https://dev.mysql.com/downloads/windows/excel/)
   - Ensure MySQL server is running (e.g., via XAMPP or phpMyAdmin)

2. **Open Excel**
   - Go to `Data > Get Data > From Database > From MySQL Database`

3. **Enter Server Details**
   - Server: `localhost`
   - Port: `3306`
   - Database: `your_database_name` (e.g., coffeefactory)

4. **Choose Table/View or Paste SQL Query**
   - You can import full tables or click **Advanced options** to run a custom SQL query.

5. **Load as Table or Pivot Table**
   - Choose how to load the data (Table, Pivot Table, or Power Query)

6. **Refresh Easily**
   - Once connected, just click "Refresh All" to pull live updates.

---

## Excel Dashboard Features

- 🔹 Monthly Revenue & Profit Trends
- 🔹 Daily and Hourly Sales Charts
- 🔹 Top Product & Store Category KPIs
- 🔹 MoM Growth Tracker
- 🔹 Filter by Store, Date, Category (Slicers)
- 🔹 Dynamic Insights (via Excel Formulas)

---
## Installation Instructions (for ML)
Clone this repo:
git clone https://github.com/Sa880-hue/Coffee-Sales-Performance-Analysis.git

Install dependencies:
pip install pandas numpy matplotlib seaborn scikit-learn openpyxl

**Open the Colab/Jupyter notebook:**
ML_Model/TheUrbanCafe_Forecasting.ipynb

📊 Key Insights (From EDA + SQL + Excel)
 - Hell’s Kitchen is the highest-grossing store (₹2.32L)
- Coffee is the most sold product category (₹3.4L)
- Weekday sales dominate (72% vs. 28% on weekends)
- Peak sales time: 11 AM – 1 PM
- May recorded 22% revenue jump from April
