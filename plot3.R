download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip")
#Unzip the training dataset
library(downloader)
unzip("exdata_data_household_power_consumption.zip")

x<-read.table("household_power_consumption.txt", header = TRUE, sep=";")
x$Time<-strftime(strptime(x$Time, format="%H:%M:%S"), format="%H:%M:%S")
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-subset(x, as.Date("2007-02-01")<=Date)
x<-subset(x, Date<=as.Date("2007-02-02"))

png(filename = "plot3.png")

#plot3
plot(as.POSIXct(paste(x$Date,x$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
     as.numeric(as.character(x$Sub_metering_1)), type="n", xlab="",
     ylab="Energy sub metering")
lines(as.POSIXct(paste(x$Date,x$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(x$Sub_metering_1)))
lines(as.POSIXct(paste(x$Date,x$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(x$Sub_metering_2)), col="Red")
lines(as.POSIXct(paste(x$Date,x$Time, sep=" "), format="%Y-%m-%d %H:%M:%S"), 
      as.numeric(as.character(x$Sub_metering_3)), col="Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black", "red", "blue"))
dev.off()
