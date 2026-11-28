# Q1. How many records are in the farm prices dataset?
dbGetQuery(conn, "SELECT COUNT(*) AS RECORDS FROM FARM_PRICES")

# Q2. Which geographies are included in the farm prices dataset?
dbGetQuery(conn, "SELECT DISTINCT GEO FROM FARM_PRICES")

# Q3. How many hectares of Rye were harvested in Canada in 1968?
dbGetQuery(conn, "SELECT SUM(HARVESTED_AREA) AS HARVESTED_HECTARES
                  FROM CROP_DATA
                  WHERE CROP_TYPE = 'Rye' AND GEO = 'Canada'
                    AND strftime('%Y', YEAR) = '1968'")

# Q4. First 6 rows of the farm prices table for Rye
dbGetQuery(conn, "SELECT * FROM FARM_PRICES WHERE CROP_TYPE = 'Rye' LIMIT 6")

# Q5. Which provinces grew Barley? ('Canada' is the national total, not a province)
dbGetQuery(conn, "SELECT DISTINCT GEO AS PROVINCE
                  FROM CROP_DATA
                  WHERE CROP_TYPE = 'Barley' AND GEO <> 'Canada'")

# Q6. First and last dates for the farm prices data
dbGetQuery(conn, "SELECT MIN(DATE) AS FIRST_DATE, MAX(DATE) AS LAST_DATE FROM FARM_PRICES")

# Q7. Which crops have ever reached a farm price >= $350 per metric tonne?
dbGetQuery(conn, "SELECT DISTINCT CROP_TYPE FROM FARM_PRICES WHERE PRICE_PRERMT >= 350")

# Q8. Rank crops harvested in Saskatchewan in 2000 by average yield
dbGetQuery(conn, "SELECT CROP_TYPE, AVG_YIELD
                  FROM CROP_DATA
                  WHERE GEO = 'Saskatchewan' AND strftime('%Y', YEAR) = '2000'
                  ORDER BY AVG_YIELD DESC")

# Q9. Rank crops and geographies by average yield (kg per hectare) since 2000
dbGetQuery(conn, "SELECT CROP_TYPE, GEO, AVG(AVG_YIELD) AS AVG_YIELD_KG_PER_HA
                  FROM CROP_DATA
                  WHERE strftime('%Y', YEAR) >= '2000'
                  GROUP BY CROP_TYPE, GEO
                  ORDER BY AVG_YIELD_KG_PER_HA DESC")

# Q10. Subquery: wheat harvested in Canada in the most recent year of the data
dbGetQuery(conn, "SELECT strftime('%Y', YEAR) AS YEAR, HARVESTED_AREA AS HARVESTED_HECTARES
                  FROM CROP_DATA
                  WHERE CROP_TYPE = 'Wheat' AND GEO = 'Canada'
                    AND YEAR = (SELECT MAX(YEAR) FROM CROP_DATA)")

# Q11. Implicit inner join: monthly Canola price in Saskatchewan in CAD and USD,
#      most recent 6 months. FXUSDCAD = CAD per 1 USD, so USD = CAD / FXUSDCAD.
dbGetQuery(conn, "SELECT F.DATE,
                         F.PRICE_PRERMT AS PRICE_CAD_PER_TONNE,
                         ROUND(F.PRICE_PRERMT / M.FXUSDCAD, 2) AS PRICE_USD_PER_TONNE
                  FROM FARM_PRICES F, MONTHLY_FX M
                  WHERE F.DATE = M.DATE
                    AND F.CROP_TYPE = 'Canola' AND F.GEO = 'Saskatchewan'
                  ORDER BY F.DATE DESC
                  LIMIT 6")
