

# Loading Libraries -------------------------------------------------------

library(bigrquery)
library(dplyr)
library(dbplyr)
library(DBI)


# Making the connection to BigQuery ---------------------------------------

con <- dbConnect(
  bigrquery::bigquery(),
  project = "ga4-test-379815",
  dataset = "totalsearch",
  billing = "ga4-test-379815"
)


# Listing available tables ------------------------------------------------

dbListTables(con)


# Reading table "keywords_paused" -----------------------------------------

keywords_df <- dplyr::tbl(con, "keywords_paused")

dplyr::glimpse(keywords_df)


# Using SQL to read tables ------------------------------------------------

sql <- "SELECT DISTINCT keyword 
        FROM ga4-test-379815.totalsearch.keywords_paused
        WHERE pause_bid = TRUE"

paused_only_keywords_df <- dbGetQuery(con, sql)
