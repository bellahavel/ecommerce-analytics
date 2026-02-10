# Contributing

Thanks for your interest in improving this project. This repo is designed as a
portfolio analytics project, so changes should keep the workflow simple and
reproducible.

## How To Contribute

1. Open an issue describing the change.
2. Keep changes small and focused.
3. Add or update documentation if behavior changes.

## Project Assumptions

- Cancelled invoices (InvoiceNo starting with `C`) are excluded from revenue KPIs.
- Returns (negative quantities) are retained and reflected as negative revenue.
- Customer-level analysis excludes rows with missing `CustomerID`.

## Style

- Prefer clear, descriptive names.
- Keep notebooks ordered and numbered.
- Avoid adding large binary/data files to git.
