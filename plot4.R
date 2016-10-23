## Exploratory Data Analysis: Course Project 1, Plot 4
## Submitted by: Ann Bessenbacher
## Date: 10/22/2016

## The overall goal of this script is to examine 
## how household energy usage varies over a 2-day period in February, 2007 
## by creating exploratory graphs using the base plotting system.
## The data comes from the UC Irvine Machine Learning Repository machine learning datasets.
## Specifically the "Individual household electric power consumption Data Set"
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## 1. Read in the data set.
## 2. Subset the data set to two days only: 2007-02-01 and 2007-02-02
## 3. Convert the Date field to a date class
## 4. Convert the Time field to a time class (POSIclt)
## 5. Open the png graphics device (this code opens the png device directly to create the graph
##    instead of writing to the screen and copying it to png in order to get the legend
##    to print correctly)
## 6. Set the screen graphics device up to print 4 graphs
## 7. Create the first plot for the screen of global active power over time
## 8. Add the second plot to the screen of voltage over time
## 9. Add the third plot to the screen of energy sub metering over time
## 10. Add the fourth and final plot to the screen of 
## 11. Close png graphic device


## load libraries to use
library(lubridate)

## clean local environment
rm(list=ls())

## 1. Read in the data set.
electricConsumption <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## 2. Subset the data set to two days only: 2007-02-01 and 2007-02-02
electricConsumption <- subset(electricConsumption, electricConsumption$Date %in% c("1/2/2007", "2/2/2007"))

## 3. Convert the Date field to class Date
electricConsumption$Date <- dmy(electricConsumption$Date)

## 4. Convert the time field to class POSIclt
datetime <- paste(as.Date(electricConsumption$Date), electricConsumption$Time)
electricConsumption$Datetime <- as.POSIXct(datetime)

## 5. Open the png graphics device (this code opens the png device directly to create the graph
##    instead of writing to the screen and copying it to png in order to get the legend
##    to print correctly)
png(file="plot4.png", height=480, width=480)

## 6. Set the screen graphics device up to print 4 graphs
par(mfrow=c(2,2))

## 7. Create the first plot for the screen of global active power over time
plot(electricConsumption$Global_active_power ~ electricConsumption$Datetime, type="l", xlab="", ylab = "Global Active Power")

## 8. Add the third plot to the screen of Voltage over time
plot(electricConsumption$Voltage ~ electricConsumption$Datetime, type="l", xlab="datetime", ylab = "Voltage")

## 9. Add the second plot to the screen of energy sub metering over time
plot(electricConsumption$Sub_metering_1 ~ electricConsumption$Datetime, type="l", xlab="", ylab = "Energy sub metering")
lines(electricConsumption$Sub_metering_2 ~ electricConsumption$Datetime, col="red")
lines(electricConsumption$Sub_metering_3 ~ electricConsumption$Datetime, col="blue")

legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 10. Add the fourth and final plot to the screen of Global Reactive Power over datetime
plot(electricConsumption$Global_reactive_power ~ electricConsumption$Datetime, type="l", xlab="datetime", ylab = "Global Reactive Power")

## 11. Close png graphic device
dev.off()
