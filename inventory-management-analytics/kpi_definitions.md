# KPI Definitions – Inventory Management Analytics Framework

This document defines the key performance indicators (KPIs) used in the Inventory Management Analytics Framework. These metrics help monitor inventory health, service performance, operational efficiency, and financial returns.

---

# 1. Inventory Health KPIs

## Total Stock Value

**Definition**

Total monetary value of inventory currently held in stock.

**Formula**

Total Stock Value = Σ (Unit Cost × Quantity on Hand)

**Business Insight**

Helps measure the total working capital locked in inventory.

---

## Total Units in Inventory

**Definition**

Total number of units currently available in inventory.

**Formula**

Total Units = Σ Quantity on Hand

**Business Insight**

Provides visibility into total inventory volume across warehouses or locations.

---

## Inventory Turnover Days (Days Inventory Outstanding)

**Definition**

Average number of days inventory remains in stock before being sold.

**Formula**

Inventory Turnover Days = (Average Inventory / Cost of Goods Sold) × 365

**Business Insight**

Lower values indicate faster-moving inventory and better inventory efficiency.

---

## Dead Stock SKUs

**Definition**

Number of SKUs that have not recorded any sales during a defined time period.

**Example Rule**

Dead Stock SKUs = SKUs with zero sales in the last 90 days.

**Business Insight**

Identifies slow-moving or non-moving products that lock up capital and warehouse space.

---

# 2. Service Level KPIs

## Stockout Rate

**Definition**

Percentage of SKUs that experienced stockouts during a given time period.

**Formula**

Stockout Rate = (Stockout SKUs / Total Active SKUs) × 100

**Business Insight**

Indicates how frequently customers are unable to purchase products due to inventory shortages.

---

## Demand Fill Rate (Service Level)

**Definition**

Percentage of customer demand that is fulfilled immediately from available inventory.

**Formula**

Fill Rate = (Units Shipped / Units Ordered) × 100

**Business Insight**

Measures customer service level and order fulfillment efficiency.

---

## Missed Out Sales (Stockout Sales Loss)

**Definition**

Estimated revenue lost due to inventory stockouts.

**Formula**

Missed Sales = Expected Demand – Actual Sales during stockout period

**Business Insight**

Quantifies the revenue impact caused by poor inventory availability.

---

# 3. Financial Efficiency KPIs

## GMROII (Gross Margin Return on Inventory Investment)

**Definition**

Measures the profit generated for every unit of currency invested in inventory.

**Formula**

GMROII = Gross Margin / Average Inventory Cost

**Business Insight**

Higher GMROII indicates more profitable inventory investment.

---

# 4. Operational KPIs

## Shrinkage Rate

**Definition**

Percentage of inventory lost due to theft, damage, spoilage, or administrative errors.

**Formula**

Shrinkage Rate = (Inventory Loss / Total Inventory Value) × 100

**Business Insight**

Indicates the effectiveness of inventory control and warehouse management.

---

## Outbound OTDR (On-Time Delivery Rate)

**Definition**

Percentage of outbound orders delivered on or before the committed delivery time.

**Formula**

OTDR = (Orders Delivered On Time / Total Orders Shipped) × 100

**Business Insight**

Measures distribution performance and reliability of order fulfillment.

---

# Summary

The above KPIs collectively measure:

- Inventory health
- Service level performance
- Financial efficiency
- Operational reliability

These metrics help organizations reduce stockouts, minimize excess inventory, improve service levels, and optimize working capital.
