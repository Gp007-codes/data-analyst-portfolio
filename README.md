📊 Zomato Data Analytics Portfolio
A data analytics project exploring restaurant data from Zomato using SQL, Microsoft Excel, Power BI, and Tableau. This repository brings together the SQL queries and dashboard files used to examine restaurant distribution, ratings, pricing, opening trends, and service availability.
📌 Project Overview
The goal of this project is to turn restaurant data into useful insights through data querying and interactive visualisation. The SQL script prepares and analyses data, while the Excel, Power BI, and Tableau files provide different ways to explore and present the results.
🧰 Tools & Technologies
- SQL (MySQL): Data querying, joins, aggregations, date analysis, calculated categories, and percentage calculations.
- Microsoft Excel: Spreadsheet-based analysis and dashboarding.
- Microsoft Power BI: Interactive business intelligence report.
- Tableau: Data visualisation and dashboard exploration.
📂 Repository Contents
File	Description
[`zomato-SQL.sql`](./zomato-SQL.sql)	SQL script for database setup and restaurant data analysis.
[`DASHBOARD-Excel.xlsx`](./DASHBOARD-Excel.xlsx)	Excel dashboard/workbook for exploring the data.
[`Zomato PowerBI.pbix`](./Zomato%20PowerBI.pbix)	Power BI report file.
[`Zomato -Tableau.twbx`](./Zomato%20-Tableau.twbx)	Packaged Tableau workbook.


🔎 Analysis Covered
The SQL script includes analysis and preparation tasks such as:
- Joining restaurant records with country information.
- Creating a calendar table from restaurant opening dates.
- Counting restaurants by country and city.
- Analysing restaurant openings by year, quarter, and month.
- Grouping restaurants by rating.
- Categorising restaurants by average cost for two.
- Calculating the share of restaurants that offer table booking.
- Calculating the share of restaurants that offer online delivery.
- Preparing grouped data for visualisations, including cuisine, city, and rating analysis.
These analyses can help explore restaurant distribution, customer-facing service options, price segments, ratings, and opening patterns.
📈 Project Files
1. SQL Analysis
Open [`zomato-SQL.sql`](./zomato-SQL.sql) to review the queries. The script creates and selects a database named zomato_db, uses joins and aggregate functions, derives calendar attributes, and prepares grouped results for analysis.
2. Excel Dashboard
Open [`DASHBOARD-Excel.xlsx`](./DASHBOARD-Excel.xlsx) in Microsoft Excel to explore the spreadsheet-based dashboard and workbook.
3. Power BI Report
Open [`Zomato PowerBI.pbix`](./Zomato%20PowerBI.pbix) with Microsoft Power BI Desktop to interact with the report.
4. Tableau Dashboard
Open [`Zomato -Tableau.twbx`](./Zomato%20-Tableau.twbx) with Tableau Desktop or a compatible Tableau viewer. The .twbx extension indicates a packaged Tableau workbook.
🚀 How to Use
SQL
1. Install or open a MySQL-compatible database environment.
2. Obtain the source Zomato dataset and ensure its table and column names match those referenced in the SQL script.
3. Open zomato-SQL.sql in your SQL editor.
4. Review the script and update file paths, table names, or date parsing as needed for your dataset.
5. Run the statements in order and review the resulting tables and query outputs.
Important: The SQL script expects source tables such as Zomato_Data and Zomato_DataC to be available. The dataset itself is not included among the files listed in this repository, so it must be supplied separately before all queries can run successfully.
Excel, Power BI, and Tableau
1. Download the relevant workbook from the repository.
2. Open it in the corresponding application.
3. If the application reports missing data sources, reconnect it to the appropriate dataset and refresh the data.
💡 Skills Demonstrated
- Writing SQL queries for business questions
- Joining related datasets
- Aggregating and grouping records
- Working with date and calendar attributes
- Creating price categories and percentage metrics
- Preparing data for visualisation
- Building dashboards and reports in Excel, Power BI, and Tableau
- Presenting data in formats suitable for business analysis
🎯 Project Purpose
This project demonstrates a practical analytics workflow: query and prepare data with SQL, then explore and communicate the results through spreadsheet and business intelligence tools. It is part of a portfolio showcasing data analysis and visualisation skills.
