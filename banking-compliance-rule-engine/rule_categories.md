# Banking Compliance & Audit Rule Engine

This project simulates a rule-based compliance monitoring system used by banks to detect operational, regulatory, and risk-related exceptions from core banking data.

The framework contains **200+ SQL-based audit rules** designed to automatically identify potential violations of internal banking policies and regulatory guidelines.

These rules help compliance teams detect irregularities early and prevent regulatory penalties.

---

# Rule Categories

To ensure scalability and easier maintenance, rules were grouped into logical categories.

---

# 1. Loan & Credit Monitoring

Detects irregularities in loan disbursement, sanction limits, and credit exposure.

### Example Rules

* Drawing Power greater than Sanction Limit
* Outstanding Balance exceeding Drawing Power
* Loan closure using fresh loan disbursement
* Multiple loans sanctioned to same borrower from different branches
* Term loans where sanctioned amount not fully drawn
* Loan accounts where review/renewal not completed
* Sanction and disbursement done on the same day
* Loan accounts disbursed during last days of month and reversed next month

---

# 2. NPA & Asset Quality Monitoring

Detects inconsistencies in asset classification and delinquency management.

### Example Rules

* Account categorized as NPA more than once during audit period
* Accounts where withdrawal permitted after NPA classification
* Loans sanctioned to borrowers with existing SMA accounts
* Accounts turning irregular due to non-renewal
* Borrower accounts where guarantor account is NPA
* Accounts where interest servicing done through another loan

---

# 3. Collateral & Security Monitoring

Ensures loan security and collateral compliance.

### Example Rules

* Missing collateral security for eligible loans
* Security value less than sanctioned loan amount
* Valuation of immovable property older than 3 years
* Insurance cover lower than security value
* Gold loan LTV violations
* Missing CERSAI registration

---

# 4. Transaction Monitoring

Identifies unusual or suspicious financial transactions.

### Example Rules

* Large transactions reversed within a few days
* Funds transferred in and out in similar amounts
* Cash deposit followed by immediate withdrawal
* Transactions in dormant accounts
* Repeated debit and credit transactions with identical value

---

# 5. KYC & Customer Compliance

Ensures regulatory compliance related to customer information.

### Example Rules

* Accounts without PAN or mobile number
* Accounts without beneficial owner details
* Multiple customer IDs with same PAN / Aadhaar
* Accounts opened and closed within short period
* KYC documents not updated for MSME accounts

---

# 6. Branch Operations Monitoring

Ensures branch level operational compliance.

### Example Rules

* Clearing zones not closed daily
* Suspense accounts not zero-balanced
* Voucher registers not updated
* ATM cash shortage accounts not reconciled
* Delay in EOD process

---

# 7. Cash & Fraud Risk Monitoring

Detects cash-related anomalies and fraud indicators.

### Example Rules

* Cash transactions above regulatory threshold
* Structuring or smurfing of deposits
* Cash transactions through suspense accounts
* Counterfeit notes reported in branch
* Cash withdrawal in new accounts without authorization

---

# 8. Deposit & Account Monitoring

Tracks irregularities in deposit accounts.

### Example Rules

* Term deposits with abnormal tenure
* Fixed deposit repayment to different customer ID
* Accounts with frequent cheque returns
* Accounts opened through welcome kits but not activated
* Salary accounts not converted after salary credit stopped

---

# 9. Staff & Internal Control Monitoring

Detects internal control violations by bank staff.

### Example Rules

* Transactions performed during staff leave period
* Staff holding both ATM card and PIN
* Staff acting as guarantor for borrower loans
* Staff accounts showing abnormal transactions

---

# Key Outcome

The rule engine enables banks to:

• Automatically identify regulatory breaches
• Monitor operational compliance
• Detect potential fraud patterns
• Improve internal audit efficiency

This approach reduces manual audit effort and helps banks maintain compliance with regulatory guidelines.
