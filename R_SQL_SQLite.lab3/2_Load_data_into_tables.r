# Now let's load these datasets into four separate tables.
# Load the RSQLite package first:
install.packages("RSQLite")
library("RSQLite")

# Connect to the database
# Load the RSQLite database interface package and establish a connection.
conn <- dbConnect(RSQLite::SQLite(),"FinalDB_lab4.sqlite")
