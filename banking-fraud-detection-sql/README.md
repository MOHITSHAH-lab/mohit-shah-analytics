# Banking Fraud Detection using SQL

## Project Overview

This project demonstrates how SQL can be used to detect potential fraud patterns in banking transaction data.

The framework uses **rule-based anomaly detection techniques** inspired by real banking compliance and audit monitoring systems.

The objective is to automatically identify suspicious accounts and transactions that may indicate fraud, misuse of funds, or regulatory violations.

---

# Business Problem

Banks process millions of transactions daily. Manual monitoring of all transactions is impossible.

Fraud detection systems must automatically identify patterns such as:

* Suspicious fund movements
* Rapid transaction reversals
* Structuring of deposits
* Dormant account misuse
* Loan misuse patterns

This project simulates how **rule-based monitoring systems detect such risks using SQL logic.**

---

# Fraud Detection Categories

The project detects multiple fraud patterns.

### 1️⃣ Rapid Transaction Reversal

Suspicious pattern where a large transaction is reversed within a short time period.

Example scenario:

Customer transfers ₹500,000 and reverses it within 24 hours.

Possible indication:

* Fraud attempt
* Temporary fund manipulation

---

### 2️⃣ Circular Fund Movement

Money moves between accounts and returns to the original account.

Example pattern:

A → B → C → A

Possible indication:

* Money laundering
* Layering of funds

---

### 3️⃣ Dormant Account Activity

Transactions occurring in accounts inactive for a long period.

Possible indication:

* Account takeover
* Identity fraud

---

### 4️⃣ Structuring of Cash Deposits

Multiple deposits slightly below regulatory reporting threshold.

Example pattern:

₹49,000 deposits multiple times when reporting limit is ₹50,000.

Possible indication:

* Avoiding regulatory reporting

---

### 5️⃣ Suspicious Loan Usage

Loan disbursed but funds immediately transferred elsewhere.

Possible indication:

* Loan diversion
* Financial misreporting

---

# Analytical Approach

The fraud detection framework follows a rule-based detection approach.

Workflow:

1. Import transaction dataset
2. Apply SQL logic to detect suspicious patterns
3. Flag transactions violating defined conditions
4. Generate fraud risk indicators

---

# Example Fraud Indicators

Examples of fraud flags generated:

* Rapid transaction reversal detected
* Dormant account suddenly active
* Circular money flow detected
* Repeated near-threshold deposits
* Loan diversion detected

---

# Tools Used

* SQL
* Transaction data analysis
* Rule-based anomaly detection

---

# Outcome

The project demonstrates how SQL-based rule engines can be used to detect fraud risks and monitor banking transaction behavior.

Such techniques are commonly used in banking compliance, AML monitoring, and financial crime analytics.
