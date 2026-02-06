-- sql/queries.sql

-- 1) Monthly KPIs (gross, returns, net, AOV)
-- Note: in your cleaned pipeline, cancelled invoices were removed, and UnitPrice > 0.
-- returns may be 0 if they were removed with cancelled invoices.

SELECT
  invoice_month,
  COUNT(DISTINCT InvoiceNo) AS orders,
  SUM(CASE WHEN line_revenue > 0 THEN line_revenue ELSE 0 END) AS gross_revenue,
  SUM(CASE WHEN line_revenue < 0 THEN line_revenue ELSE 0 END) AS returns,
  SUM(line_revenue) AS net_revenue,
  SUM(line_revenue) / COUNT(DISTINCT InvoiceNo) AS aov
FROM revenue_txn
GROUP BY 1
ORDER BY 1;


-- 2) Customer summary (customer_txn must exclude NULL CustomerID)
SELECT
  CustomerID,
  COUNT(DISTINCT InvoiceNo) AS total_orders,
  SUM(line_revenue) AS total_revenue,
  MIN(InvoiceDate) AS first_purchase,
  MAX(InvoiceDate) AS last_purchase,
  DATE_DIFF('day', MAX(InvoiceDate), (SELECT MAX(InvoiceDate) FROM customer_txn)) * -1 AS recency_days
FROM customer_txn
WHERE CustomerID IS NOT NULL
GROUP BY 1
ORDER BY total_revenue DESC;


-- 3) Cohort base: cohort month = month of first purchase
WITH first_purchase AS (
  SELECT
    CustomerID,
    STRFTIME(MIN(InvoiceDate), '%Y-%m') AS cohort_month
  FROM customer_txn
  WHERE CustomerID IS NOT NULL
  GROUP BY 1
),
tx AS (
  SELECT
    t.CustomerID,
    f.cohort_month,
    STRFTIME(t.InvoiceDate, '%Y-%m') AS invoice_month
  FROM customer_txn t
  JOIN first_purchase f USING (CustomerID)
),
indexed AS (
  SELECT
    cohort_month,
    invoice_month,
    DATE_DIFF('month',
      CAST(cohort_month || '-01' AS DATE),
      CAST(invoice_month || '-01' AS DATE)
    ) AS cohort_index,
    CustomerID
  FROM tx
)
SELECT
  cohort_month,
  cohort_index,
  COUNT(DISTINCT CustomerID) AS customers
FROM indexed
GROUP BY 1, 2
ORDER BY 1, 2;

-- NOTE:
-- The SQL queries in this file reproduce the same analytics
-- developed in pandas notebooks, including monthly KPIs
-- and cohort retention analysis.
--
-- This demonstrates consistency between Python-based
-- analysis and SQL-based production workflows.
