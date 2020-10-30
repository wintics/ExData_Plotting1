## using only data from the dates 2007-02-01 and 2007-02-02
## data are in the working directory
## plot1.png drawing in the same directory


library(data.table)
library(dplyr)

df <- fread("household_power_consumption.txt", header = TRUE,sep=";", na.strings = "?")
df[,DateTime := as.Date(paste(Date), format = "%d/%m/%Y")]
mydata <- filter(df, DateTime >= as.Date("2007-02-01") & DateTime < as.Date("2007-02-03"))

png("plot1.png", width = 480, height = 480,units = "px")
hist(mydata$Global_active_power,main="Global Active Power", xlab="Global active power (in kilowatt) ", col="red")
dev.off()