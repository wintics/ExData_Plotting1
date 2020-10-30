## using data from the dates 2007-02-01 and 2007-02-02
## data are in the working directory
## plot4.png drawing in the same directory

library(data.table)
library(dplyr)

df <- fread("household_power_consumption.txt", header = TRUE,sep=";", na.strings = "?")
df[,datetime := as.Date(paste(Date), format = "%d/%m/%Y")]

mydata <- filter(df, datetime >= as.Date("2007-02-01") & datetime < as.Date("2007-02-03"))
mydata[,datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

png("plot4.png", width = 480, height = 480,units = "px")
par(mfcol=c(2,2),mar=c(5,5,4,2))

with (mydata, {
    ## active power
    plot(datetime,Global_active_power,type="l",xlab="",ylab="Global active power")
    ## sub metering
    plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    lines(datetime,Sub_metering_1, col="black")
    lines(datetime,Sub_metering_2, col="red")
    lines(datetime,Sub_metering_3, col="blue")
    legend("topright",col=c("black","red","blue"),lty=1,lwd=1,bty = "n",cex=0.8,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    ## voltage
    plot(datetime,Voltage,type="l",ylab="Voltage")
    ## reactive power
    plot(datetime,Global_reactive_power,type="l",ylab="Global reactive power")
})
dev.off()