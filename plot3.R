## Exploratory Data Analysis: Course Project 1, Plot 3
## Submitted by: Ann Bessenbacher
## Date: 10/22/2016

## The overall goal of this script is to examine 
## how household energy usage varies over a 2-day period in February, 2007. 
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
## 6. Create a line plot of Energy Sub Metering over time and add additional
##    sub metering lines (plot 3) 
## 7. Close png graphic device


## load libraries to use
library(lubridate)

## clean local environment
rm(list=ls())

## read in the data
electricConsumption <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## Subset the data
electricConsumption <- subset(electricConsumption, electricConsumption$Date %in% c("1/2/2007", "2/2/2007"))

## convert the Date field to class Date
electricConsumption$Date <- dmy(electricConsumption$Date)

## convert the time field to class POSIXct
datetime <- paste(as.Date(electricConsumption$Date), electricConsumption$Time)
electricConsumption$Datetime <- as.POSIXct(datetime)

## 5. Open the png graphics device (this code opens the png device directly to create the graph
##    instead of writing to the screen and copying it to png in order to get the legend
##    to print correctly)
png(file="plot3.png", height=480, width=480)

## 6. Create a line plot of Energy Sub Metering over time and add additional
##    sub metering lines (plot 3) 
plot(electricConsumption$Sub_metering_1 ~ electricConsumption$Datetime, type="l", xlab="", ylab = "Energy sub metering")
lines(electricConsumption$Sub_metering_2 ~ electricConsumption$Datetime, col="red")
lines(electricConsumption$Sub_metering_3 ~ electricConsumption$Datetime, col="blue")

legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 7. Close png graphic device
dev.off()
