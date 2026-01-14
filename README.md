# Marketing Dashboard
![Dashboard Overview](screenshots/overview%20page.png)
> **More visuals:** View the full set of dashboard screenshots in the [`screenshots`](./screenshots) directory.
## Problem
The marketing teams lacked a single, reliable view of the end-to-end funnel across enquiries, leads, visits, and registrations. Data existed across multiple systems, each using different definitions, date logic, and dimensions, which made it difficult to answer questions like:
- Where are leads dropping off in the funnel?
- Which campuses and programs are driving demand versus conversions?
- How long does it take to move from lead to visit and registration?
- How are performance trends changing over time (MoM / YoY)?

The goal was to build a self-service dashboard that unified these metrics into a consistent, decision-ready view while remaining flexible for different stakeholders.

## Data
This project integrates and models data from multiple internal sources, including:
- CRM, excel/sharepoint files, APIs

To comply with data privacy and confidentiality policies:

- All identifiers (company name, campus, program) have been blocked off.
- All absolute values have been randomized or altered
- Dates and fiscal references have been generalized

The published version preserves the original data structure, modeling logic, and analytical intent, but not the raw operational data.

## Results
The final output is a multi-page Power BI dashboard that provides:
- Funnel visibility
Clear progression from enquiry → lead → visit → registration, with stage-level breakdowns and conversion indicators.
- Trend analysis
Month-over-month and year-over-year views to surface seasonality and performance shifts.
- Performance comparison
Side-by-side views by campus and program (anonymized) to highlight relative strengths and gaps.
- Operational insights
Metrics such as lead-to-visit days and lead-to-registration days to support process improvements.
- Self-service exploration
Interactive filters and drill-downs designed for non-technical stakeholders.

This dashboard enabled stakeholders to move away from manual reporting and focus on identifying bottlenecks, prioritizing follow-ups, and aligning marketing efforts with actual enrollment outcomes.

## Tools & Techniques
- Power BI
- Power Query (data transformation and normalization)
- DAX (time intelligence, funnel metrics, performance indicators)
- Dimensional modeling (conformed date, campus, and program dimensions)

## Notes on Confidentiality
This repository is intended solely as a portfolio case study.
All screenshots, metrics, and labels have been anonymized or modified to protect proprietary and sensitive information while demonstrating analytical and technical capability.
