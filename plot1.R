download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "exdata_data_household_power_consumption.zip")
#Unzip the training dataset
library(downloader)
unzip("exdata_data_household_power_consumption.zip")

x<-read.table("household_power_consumption.txt", header = TRUE, sep=";")
x$Time<-strftime(strptime(x$Time, format="%H:%M:%S"), format="%H:%M:%S")
x$Date<-as.Date(x$Date, format="%d/%m/%Y")
x<-subset(x, as.Date("2007-02-01")<=Date)
x<-subset(x, Date<=as.Date("2007-02-02"))

png(filename = "plot1.png")

#plot1
hist(as.numeric(as.character(x$Global_active_power)), main="Global Active Power"
     , col="Red", xlab="Global Active Power (kilowatts)")

dev.off()