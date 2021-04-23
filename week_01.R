### Download files

getwd()
setwd()

# relative paths or absolute paths

#checking for a creating direcories
if (!file.exists("data")) {
    dir.create("data")
}

# getting file from the internet

fileurl <- "https://opendata.arcgis.com/datasets/7055dbb02f0c4f14ab7ea3eb5ebfda42_0.csv?outSR=%7B%22latestWkid%22%3A3857%2C%22wkid%22%3A102100%7D"
download.file(fileurl, destfile = "data/cameras.csv", method = "curl")
list.files("data")

dateDowloaded <- date()
dateDowloaded

df <- read.csv("data/cameras.csv")
df

# xlsx
library(openxlsx)
write.xlsx(df, file = "data/cameras.xlsx")

library(xlsx)
camera_xlsx <- xlsx::read.xlsx("data/cameras.xlsx", sheetIndex = T, header = T)
head(camera_xlsx)

colIndex <- 1:3
rowIndex <- 1:10
camera_xlsx_resumo <- xlsx::read.xlsx("data/cameras.xlsx", sheetIndex = T,
                                      colIndex = colIndex, rowIndex = rowIndex)
camera_xlsx_resumo

# JSON
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
head(jsonData)

myjson <- toJSON(iris, pretty = T)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)

# data.table

library(data.table)
df <- data.frame(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(df, 3)

df <- data.table(x=rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(df, 3)
tables()

df[, list(mean(x), sum(z), max(y))]
df[,table(y)]

df[, w:=z^2]
df

df2 <- df
df[, y:=2]
head(df)
head(df2)

df[, m:={tmp <- (x+z); log2(tmp+5)}]
head(df)

df[,a:=x>0]
head(df)

set.seed(123)
df_letters <- data.table(x=sample(letters[1:3], 1E5, T))
df_letters[, .N, by=x]

df1 <- data.table(x=c('a', 'b','c', 'df1'), y=1:4)
df2 <- data.table(x=c('a', 'b', 'df2'), y=5:7)
setkey(df1, x); setkey(df2, x)
merge(df1, df2)
?merge()

