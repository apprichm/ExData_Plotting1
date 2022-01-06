#### Exploratory Data Analysis - Week 1 -Course Project 1
#### Purpose:  To examine how household energy usage varies over a 2-day period in February, 2007. 
#### Construct 4 plots using the Base plotting system.
#### Plot 2: X, Y Plot - Global Active Power (kw by date/time)
#### Set Working Directory, Load and Read Data Source
setwd("N:/R Programming")
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")
####
#### Transforming the Date and Time Variables to the Correct Class
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
####
#### Set print Device to PNG with specified dimensions
png("plot2.png", width=480, height=480)
####
#### Call plot 
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
####
#### Annotating the Main Title
title(main="Global Active Power Vs Time")
####
#### Turn the print Device off
dev.off()