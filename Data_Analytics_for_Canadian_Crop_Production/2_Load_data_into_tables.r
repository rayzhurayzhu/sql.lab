install.packages("https://cran.r-project.org/src/contrib/Archive/RSQLite/RSQLite_0.10.0.tar.gz", repos = NULL, type = "source", dependencies = TRUE)
library("RSQLite")

# Create Tables
conn <- dbConnect(RSQLite::SQLite(),"FinalDB.sqlite")
# ---------------------------------------------------------------
# 1. CROP_DATA
# ---------------------------------------------------------------
df1 <- dbExecute(conn,
                 "CREATE TABLE CROP_DATA (
                                  CD_ID INTEGER NOT NULL,
                                  YEAR DATE NOT NULL,
                                  CROP_TYPE VARCHAR(20) NOT NULL,
                                  GEO VARCHAR(20) NOT NULL,
                                  SEEDED_AREA INTEGER NOT NULL,
                                  HARVESTED_AREA INTEGER NOT NULL,
                                  PRODUCTION INTEGER NOT NULL,
                                  AVG_YIELD INTEGER NOT NULL,
                                  PRIMARY KEY (CD_ID)
                                  )"
)

if (df1 == -1){
    cat ("An error has occurred.\n")
    msg <- odbcGetErrMsg(conn)
    print (msg)
} else {
    cat ("Table was created successfully.\n")
}

# ---------------------------------------------------------------
# 2. FARM_PRICES
# ---------------------------------------------------------------
df2 <- dbExecute(conn,
                 "CREATE TABLE FARM_PRICES (
                                  CD_ID INTEGER NOT NULL,
                                  DATE DATE NOT NULL,
                                  CROP_TYPE VARCHAR(20) NOT NULL,
                                  GEO VARCHAR(20) NOT NULL,
                                  PRICE_PRERMT DECIMAL(10,2) NOT NULL,
                                  PRIMARY KEY (CD_ID)
                                  )"
)

if (df2 == -1){
    cat ("An error has occurred.\n")
    msg <- odbcGetErrMsg(conn)
    print (msg)
} else {
    cat ("Table was created successfully.\n")
}

# ---------------------------------------------------------------
# 3. DAILY_FX
# ---------------------------------------------------------------
df3 <- dbExecute(conn,
                 "CREATE TABLE DAILY_FX (
                                  DFX_ID INTEGER NOT NULL,
                                  DATE DATE NOT NULL,
                                  FXUSDCAD DECIMAL(10,4) NOT NULL,
                                  PRIMARY KEY (DFX_ID)
                                  )"
)

if (df3 == -1){
    cat ("An error has occurred.\n")
    msg <- odbcGetErrMsg(conn)
    print (msg)
} else {
    cat ("Table was created successfully.\n")
}

# ---------------------------------------------------------------
# 4. MONTHLY_FX
# ---------------------------------------------------------------
df4 <- dbExecute(conn,
                 "CREATE TABLE MONTHLY_FX (
                                  DFX_ID INTEGER NOT NULL,
                                  DATE DATE NOT NULL,
                                  FXUSDCAD DECIMAL(12,8) NOT NULL,
                                  PRIMARY KEY (DFX_ID)
                                  )"
)

if (df4 == -1){
    cat ("An error has occurred.\n")
    msg <- odbcGetErrMsg(conn)
    print (msg)
} else {
    cat ("Table was created successfully.\n")
}

dbListTables(conn)

