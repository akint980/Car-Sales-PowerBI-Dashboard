# Project Requirement Document: Car Sales & Performance Analytics Platform

## 1. Background & Executive Summary
Our car dealership network sells various vehicle makes, models, and body styles across multiple dealer regions. To effectively track, monitor, and analyze sales performance, leadership requires a comprehensive, dynamic, and interactive BI Dashboard. This platform will empower management to make data-driven decisions, monitor real-time sales progress, and identify growth opportunities.

## 2. Business Objectives
* Provide real-time visibility into sales performance metrics and financial KPIs.
* Track year-to-date (YTD) and month-to-date (MTD) sales velocity against previous periods (PTYD)[cite: 1].
* Analyze pricing trends across vehicle manufacturers, body styles, and color profiles.
* Evaluate regional dealership performance geographically to optimize inventory distribution.

## 3. Scope & Data Sources
* **Data Domain:** Transactional records covering vehicle sales, customer demographics, dealership information, and technical specifications[cite: 1].
* **Key Attributes Tracked:** 
  * Transaction Identifier (`Car_id`) and Sale Timestamp (`Date`)[cite: 1]
  * Customer Demographics (`Customer Name`, `Gend`, `Annual Incor`)[cite: 1]
  * Dealership Details (`Dealer_Name`, `Dealer_Region`)[cite: 1]
  * Vehicle Specifications (`Company`, `Model`, `Engine`, `Transmission`, `Color`, `Body Sty...`)[cite: 1]
  * Financial Metrics (`Price ($)`)[cite: 1]

## 4. Deliverables
* A fully interactive Power BI Dashboard (`.pbix`).
* A structured Star Schema data model optimizing data relationships.
* Complete documentation, DAX measure reference guides, and data dictionaries.