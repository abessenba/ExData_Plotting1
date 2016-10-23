## Exploratory Data Analysis: Course Project 1, Plot 2
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
## 4. Convert the Time field to a time class (POSIXct)
## 5. Create a line plot of Global Active Power over time (plot 2) 
## 6. Copy plot from current graphic device (screen) to png
## 7. Close png graphic device


## load libraries to use
library(lubridate)

## clean local environment
rm(list=ls())

## 1. Read in the data set.
electricConsumption <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

## 2. Subset the data set to two days only: 2007-02-01 and 2007-02-02
electricConsumption <- subset(electricConsumption, electricConsumption$Date %in% c("1/2/2007", "2/2/2007"))

## 3. Convert the Date field to a date class
electricConsumption$Date <- dmy(electricConsumption$Date)

## 4. Convert the Time field to a time class (POSIXct)
datetime <- paste(as.Date(electricConsumption$Date), electricConsumption$Time)
electricConsumption$Datetime <- as.POSIXct(datetime)

## 5. Create a line plot of Global Active Power over time (plot 2)
plot(electricConsumption$Global_active_power ~ electricConsumption$Datetime, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

## 6. Copy plot from current graphic device (screen) to png
dev.copy(png, file = "plot2.png", height = 480, width = 480)

## 7. Close png graphic device
dev.off()
