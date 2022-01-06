#### Exploratory Data Analysis - Week 1 -Course Project 1
#### Purpose:  To examine how household energy usage varies over a 2-day period in February, 2007. 
#### Construct 4 plots using the Base plotting system.
#### Plot 1: Histogram - Global Active Power (kw by frequency)
#### Set Working Directory, Load and Read Data Source
setwd("N:/R Programming")
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
####
#### Set print Device to PNG with specified dimensions
png("plot1.png", width=480, height=480)
####
#### Call histogram 
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
####
#### Annotating the Min Title
title(main="Global Active Power")
#### Turn the print device off
dev.off()