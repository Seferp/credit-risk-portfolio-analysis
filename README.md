# Credit Risk & Portfolio Analysis

## Project Overview

This project analyzes credit card default risk using historical customer data from Taiwan. It combines Python, SQLite, SQL, and Power BI to transform raw data into an interactive credit risk dashboard.

The analysis focuses on credit limits, repayment behavior, monthly financial activity, and the distribution of default cases across customer segments.

**Dataset:** UCI Default of Credit Card Clients  
**Period:** April–September 2005  
**Observations:** 30,000 customers  
**Currency:** New Taiwan Dollar (NTD)

## Technologies Used

- **Python (Pandas)** — Data loading, initial exploration, and quality checks
- **SQLite / SQL** — Data transformation, segmentation, aggregation, and validation
- **Power BI / Power Query** — Data import and modeling
- **DAX** — KPI calculations, filter context management, and risk analysis
- **Git / GitHub** — Version control and project documentation

## Data Preparation

The original dataset contains 30,000 customers and information about credit limits, demographics, repayment status, monthly bill amounts, and payments.

Initial checks confirmed:
- No missing values
- No duplicate customer IDs
- 30,000 unique customers

The data was transformed into three analytical tables:

| Table | Records | Description |
|---|---:|---|
| `credit_clients` | 30,000 | Customer attributes, credit limits, default status, and segments |
| `repayment_history` | 180,000 | Monthly repayment status for each customer |
| `monthly_financials` | 180,000 | Monthly bill amounts and payment amounts |

A six-row month dimension (`DimMonth`) was created in Power BI.

The model uses one-to-many relationships, with single-direction filtering from dimensions to monthly fact tables.

## Key Performance Indicators

| KPI | Result |
|---|---:|
| Total Customers | 30,000 |
| Defaulted Customers | 6,636 |
| Overall Default Rate | 22.12% |
| Total Credit Limit | 5.02 billion NTD |
| Average Credit Limit | 167,484.32 NTD |
| Total Payments (6 months) | Approximately 950 million NTD |
| Total Bill Amount (6 months) | Approximately 8.10 billion NTD |

The six-month sum of bill amounts is not interpreted as outstanding debt or credit losses.

## Dashboard Pages

### 1. Credit Portfolio Overview

![Credit Portfolio Overview](screenshots/Credit%20Portfolio%20Overview.png)

This page presents portfolio KPIs and examines customer distribution, default rates, and default counts across credit limit segments.

### 2. Repayment & Risk Analysis

![Repayment and Risk Analysis](screenshots/Repayment%20%26%20Risk%20Analysis.png)

This page explores monthly financial activity, repayment delays, and observed default rates across repayment status groups.

### 3. Risk Insights & Recommendations

![Risk Insights and Recommendations](screenshots/Risk%20Insight%20%26%20Recommendations.png)

This page compares segment default rates, shares of total defaults, and relative default risk indices, supported by business insights and recommendations.

## Key Findings

**1. Higher observed default rates in lower credit limit segments**

The Very Low credit limit segment has a default rate of 31.79%, compared with 22.12% for the entire portfolio. It accounts for 36.77% of all default cases.

**2. Portfolio size affects the concentration of defaults**

The High credit limit segment represents 9,416 customers. Despite a default rate of 14.80%, it accounts for 21.01% of all default cases.

**3. Repayment delays are strongly associated with default outcomes**

In September 2005, customers in the 2+ Months Delay group had an observed default rate of 69.55%, compared with 13.83% in the No reported delay / Other group.

## Business Recommendations

- Prioritize further risk monitoring of segments with elevated observed default rates.
- Evaluate repayment delays as potential early-warning signals, subject to predictive validation.
- Monitor both default rates and absolute default counts when assessing portfolio risk concentration.

## DAX and Analytical Techniques

The project uses DAX functions including:

- `CALCULATE`
- `DIVIDE`
- `DISTINCTCOUNT`
- `REMOVEFILTERS`
- `KEEPFILTERS`
- `TREATAS`
- `SWITCH`

Analytical results were cross-checked against SQLite queries.

## Limitations

- The dataset is historical and reflects credit card customers in Taiwan in 2005.
- Observed associations do not establish causation.
- Certain repayment status and demographic codes are not fully documented.
- Repayment and bill amount fields should not be treated as a direct measure of loan recovery or loss.
- Recommendations are exploratory and would require further validation before operational use.

## Data Source

UCI Machine Learning Repository — Default of Credit Card Clients

https://archive.ics.uci.edu/dataset/350/default+of+credit+card+clients