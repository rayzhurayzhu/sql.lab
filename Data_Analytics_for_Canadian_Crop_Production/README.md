# Canadian Agricultural Market Analysis: Crop Production, Farm Prices & Currency Trends

## Project Background

I selected this project out of an interest in Canada's agricultural industry and its role in the global commodity supply chain. Agricultural commodities such as grains are essential raw materials for industries including brewing and distilling, making production levels and market prices important factors in sourcing decisions.

This project explores Canada's agricultural market through three dimensions: historical crop production, farm product prices, and CAD/USD exchange rate movements. By examining these datasets together, I aim to better understand changes in agricultural supply, commodity price volatility, and the broader currency environment affecting Canadian agricultural markets.

## Business Questions

- How has Canadian crop production evolved over time?
- Which crop types and regions demonstrate the most significant production fluctuations?
- How have farm product prices changed over time, and which commodities exhibit greater price volatility?
- How have CAD/USD exchange rates fluctuated over the observed period?
- What relationships or patterns can be observed between agricultural production, farm prices, and currency movements?

## Data Sources

This project uses three preprocessed datasets sourced from Canadian government institutions:

1. **Canadian Principal Crops** – Historical agricultural production data, including crop types, production measures, and provincial and territorial breakdowns (1908–2020).
   - [Statistics Canada – Table 32-10-0359-01](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210035901)

2. **Farm Product Prices** – Monthly average farm product prices for Canadian crops and livestock, broken down by province and territory (1980–2020 or later).
   - [Statistics Canada – Table 32-10-0077-01](https://www150.statcan.gc.ca/t1/tbl1/en/tv.action?pid=3210007701)

3. **Daily Average Exchange Rates** – USD/CAD exchange rate data from the Bank of Canada, including a prepared monthly average dataset.
   - [Bank of Canada – Daily Average Exchange Rates](https://www.bankofcanada.ca/rates/exchange/daily-exchange-rates)

## Technical Approach

Using R, SQLite, and SQL, this project covers the following workflow:

- Explore and understand the structure and characteristics of real-world datasets.
- Assess data types and design appropriate SQLite database tables.
- Load and manage multiple datasets in a relational database.
- Retrieve, filter, aggregate, and analyze historical data using SQL within R.
- Examine production trends, commodity price movements, and exchange rate fluctuations.

## Tools & Technologies

R | SQL | SQLite | RSQLite | Jupyter Notebook
