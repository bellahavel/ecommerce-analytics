-- sql/schema.sql

-- Transaction-level table (revenue)
-- Note: DuckDB can infer types, but schema documents your model clearly.

CREATE TABLE IF NOT EXISTS revenue_txn (
  InvoiceNo   VARCHAR,
  StockCode   VARCHAR,
  Description VARCHAR,
  Quantity    BIGINT,
  InvoiceDate TIMESTAMP,
  UnitPrice   DOUBLE,
  CustomerID  DOUBLE,
  Country     VARCHAR,
  is_cancelled BOOLEAN,
  is_return    BOOLEAN,
  line_revenue DOUBLE,
  invoice_date DATE,
  invoice_month VARCHAR,
  invoice_year INTEGER
);

-- Customer-level summary table
CREATE TABLE IF NOT EXISTS customer_summary (
  CustomerID DOUBLE,
  total_orders BIGINT,
  total_revenue DOUBLE,
  first_purchase TIMESTAMP,
  last_purchase TIMESTAMP,
  recency_days BIGINT,
  cohort_month VARCHAR
);
