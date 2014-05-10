library("data.table")
#Read data from source
#dataUrl  <-  "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#dataZippedFilename <- "household_power_consumption.zip"
#download.file(dataUrl,method="curl",mode="b",destfile=dataZippedFilename)
#unzip(zipfile=dataZippedFilename)
dataFilename <- "household_power_consumption.txt"
#Read only date column
dataDate <- fread(dataFilename,sep=";",
                  na.strings=c("?"),
                  header=TRUE,
                  select=c("Date"))
#Convert to date data type
dataDate$Date  <- dmy(dataDate$Date)
#Date is sampled over a period so it must be sorted by date
rowsRead <- which(dataDate$Date %within% new_interval(ymd("20070201"),ymd("20070202")))
data <- fread(dataFilename,sep=";",
              na.strings=c("?"),
              header=FALSE,
              skip=rowsRead[1],
              nrows=length(rowsRead))

setnames(data,1:ncol(data),colnames(fread(dataFilename,nrows=0,header=TRUE)))
#Convert date,time str to datetime
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
#Assign column name to data
