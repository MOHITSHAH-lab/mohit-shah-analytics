# Inventory Management Analytics Dashboard – Design Outline

This document explains the dashboard structure, KPIs, charts, filters, and reports used in the Inventory Management Analytics Framework.

The goal of this dashboard is to help organizations monitor inventory health, reduce stockouts, minimize dead stock, and improve operational performance.

---

# 1. Dashboard Filters

Users should be able to filter inventory performance using the following dimensions.

| Filter | Example Values |
|------|------|
| Branch | Mumbai North Branch, Mumbai South Branch |
| Channel | Retail, Wholesale, E-commerce, D2C |
| Product Category | Home Care, Snacks |
| Product | Dettol, Kellogg’s |
| SKU | Dettol Handwash 200ml, Kellogg’s 100g Pack |
| Region | Gujarat, Pune |
| Period | 01-01-2025 to 31-03-2025 |

These filters allow decision-makers to drill down into inventory issues across locations, products, and time periods.

---

# 2. Dashboard KPI Cards

## Total Stock Value

**Meaning**

Total monetary value of inventory currently held in warehouses.

**Why it matters**

- Helps in inventory planning  
- Indicates working capital locked in inventory

**Formula**

Total Stock Value = Quantity × Unit Cost

---

## Total Units in Inventory

**Meaning**

Total quantity of items available across warehouses.

**Why it matters**

- Helps track inventory volume
- Supports demand planning
- Prevents stock shortages

**Formula**

Total Units = SUM(Units)

---

## Inventory Turnover Days (Days Inventory Outstanding)

**Meaning**

Average number of days it takes to sell inventory.

**Why it matters**

Lower turnover days = fast moving inventory  
Higher turnover days = slow moving inventory and higher holding cost

**Formula**

Inventory Turnover Days = (Average Inventory / Cost of Goods Sold) × 365

COGS = Opening Inventory + Purchases − Closing Inventory

Average Inventory = (Opening Inventory + Closing Inventory) / 2

---

## Stockout Rate

**Meaning**

Measures how often products are unavailable when customers want to buy them.

**Why it matters**

- Identifies lost sales opportunities
- Improves customer satisfaction

**Formula**

Stockout Rate = (Stockout Days / Total Days) × 100

Stockout Days = Days where stock = 0

---

## Missed Sales Due to Stockouts (SOS)

**Meaning**

Estimated revenue lost due to inventory stockouts.

**Why it matters**

- Quantifies lost revenue
- Helps prioritize high-value SKUs

**Formula**

Average Daily Sales Revenue = Total Revenue / In-stock Days

Missed Sales = Avg Daily Sales Revenue × Stockout Days

---

## Dead Stock SKUs

**Meaning**

Products that have remained unsold for a long time.

**Why it matters**

- Locks working capital
- Occupies warehouse space

**Rule**

SKU with no sales for more than 180 days.

---

## Shrinkage Rate

**Meaning**

Inventory loss due to theft, damage, or operational errors.

**Formula**

Shrinkage Rate = ((Recorded Inventory − Actual Inventory) / Recorded Inventory) × 100

---

## Demand Fill Rate (Service Level)

**Meaning**

Percentage of customer demand fulfilled immediately from available stock.

**Formula**

Fill Rate = Delivered Quantity / Ordered Quantity × 100

---

## GMROII (Gross Margin Return on Inventory Investment)

**Meaning**

Measures how profitable inventory investment is.

**Formula**

GMROII = Gross Margin / Average Inventory

---

## Outbound OTDR (On-Time Delivery Rate)

**Meaning**

Measures how often orders are delivered on time.

**Formula**

If Actual Delivery Date ≤ Promised Delivery Date → On Time

OTDR = (On-time Deliveries / Total Deliveries) × 100

---

# 3. Dashboard Charts

## Inventory Value Trend

Shows how inventory value changes over time.

**Chart Type**

Line Chart

**Formula**

Inventory Value = Closing Quantity × Unit Cost

---

## Demand vs Supply Trend

Shows unmet demand where orders exceed available supply.

**Formula**

Unmet Demand = (Ordered Quantity − Delivered Quantity) / Ordered Quantity

**Chart Type**

Drill-down Pareto Chart  
Category → Product → SKU

---

## Stockout Impact (SOS Trend)

Shows revenue lost due to stockouts for top revenue SKUs.

**Chart Type**

Bar Chart

**Formula**

Missed Sales = Average Daily Revenue × Stockout Days

---

## Reorder Point vs Current Stock

Shows whether top SKUs are close to stockout risk.

**Formula**

Reorder Point = (Average Daily Demand × Lead Time) + Safety Stock

**Chart Type**

Combo Chart (Bar + Line)

---

## Inventory vs Sales Correlation

Shows the relationship between inventory levels and sales.

**Chart Type**

Scatter or Line Chart

---

# 4. Operational Reports

## Inventory Ageing Report

Shows how long products have been in stock.

**Key Calculations**

Age in Days = Today − Receipt Date

Expiry Risk Rules

- Days to Expiry < 30 → High Risk
- Days to Expiry 30–90 → Moderate Risk
- Days in Stock > 120 → Old Inventory

---

## Inventory Classification Reports

### ABC Analysis (Value Based)

A → Top 70–80% revenue  
B → Next 15–25% revenue  
C → Remaining SKUs

---

### XYZ Analysis (Demand Variability)

X → CV 0–10 (Stable demand)  
Y → CV 11–30 (Moderate variability)  
Z → CV > 30 (Highly unpredictable)

---

### FSN Analysis (Movement Based)

F → Fast moving items  
S → Slow moving items  
N → Non moving items

---

# 5. Advanced Inventory Planning

## Economic Order Quantity (EOQ)

Determines optimal order quantity to minimize inventory cost.

EOQ Formula

EOQ = √((2 × D × S) / H)

D = Annual Demand  
S = Ordering Cost  
H = Holding Cost

---

## Order Cycle Time

Measures delivery efficiency.

Order Cycle Time = Delivery Date − Order Date

Used to identify slow supply chain processes.

---

# Expected Business Impact

Using this dashboard, companies can:

- Reduce excess inventory
- Improve product availability
- Minimize lost sales due to stockouts
- Improve supply chain efficiency
- Optimize working capital
