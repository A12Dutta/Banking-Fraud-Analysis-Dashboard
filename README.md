# Banking-Fraud-Analysis

📌 Project Overview

This project involves an end-to-end analysis of 1,000 banking transactions to identify fraud patterns and operational risks. I developed an automated dashboard to track high-risk geolocations and device-based vulnerabilities to support real-time security decision-making.

🔍 Key Insights

Total Volume: Successfully processed $771,165.29 in transaction volume.

Mobile Risk: Identified a significantly higher fraud rate on Mobile devices (51.25%) compared to desktops.

Critical Locations: Blacklisted 5 specific geolocations that exhibited a 100% fraud rate.

Temporal Patterns: Detected a significant transaction surge at 11:00 AM, indicating potential bot-attack patterns.

🛠 Tools Used

SQL (MySQL): Used for initial data extraction and cleaning.

Google Sheets: Used for building the interactive dashboard and KPIs.

Data Visualization: Created conditional formatting watchlists and risk-based bar charts.

📂 Repository Structure

banking-fraud-analysis/
│
├── README.md
│
├── dashboard/
│   ├── Banking_Fraud_Analysis_Dashboard.pdf        
│   └── Banking_Fraud_Analysis_Dashboard.png        
│
├── report/
│   └── Banking_Fraud_Analysis_REPORT.pdf           
│
├── sql/
│   └── Banking_Analysis_Project.sql                
│
├── data/
│   ├── raw/
│   │   └── transaction_data_original.csv           
│   │
│   └── processed/
│       ├── device_fraud.csv
│       ├── geolocation.csv
│       ├── hourly_trends.csv
│       └── type_performance.csv
│
└── combined_dashboard_data/
    └── Banking_Fraud_Analysis_Dashboard.csv        
