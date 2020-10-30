## using data from the dates 2007-02-01 and 2007-02-02
## data are in the working directory
## plot2.png drawing in the same directory

library(data.table)
library(dplyr)

df <- fread("household_power_consumption.txt", header = TRUE,sep=";", na.strings = "?")
df[,datetime := as.Date(paste(Date), format = "%d/%m/%Y")]

mydata <- filter(df, datetime >= as.Date("2007-02-01") & datetime < as.Date("2007-02-03"))
mydata[,datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot2.png", width = 480, height = 480,units = "px")
with(mydata, plot(datetime,Global_active_power,type="l",xlab="",ylab="Global active power (kilowatts)"))
dev.off()