# 01) 

library(xlsx)

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl, destfile = "data/idaho_housing.csv", method = "curl")
list.files("data")

idaho_housing <- read.csv("data/idaho_housing.csv")
head(idaho_housing)

str(idaho_housing$VAL)

nrow(idaho_housing[ which(idaho_housing$VAL==24), ])

# 02) 
str(idaho_housing$FES)
#Each tidy data table contains information about only one type of observation. 

# 03) 
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx "
download.file(fileurl, destfile = "data/gas_aquisition.xlsx", method = "curl")
list.files("data")

colIndex <- 18:23
rowIndex <- 7:15
dat <- xlsx::read.xlsx("data/gas_aquisition.xlsx", sheetIndex = T,
                       colIndex = colIndex, rowIndex = rowIndex)
ga_resumo


    