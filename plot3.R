## Exploratory Data Analysis Project
## Assignment: Course Project 1 Plot3
## 

## Set working Directory to where your data files are
#setwd("C:/Users/padmaana/Desktop/Coursera/Exploratory Data Analysis")


## Read Data for 2007-02-01 and 2007-02-02
# Number of lines to skip
no_lines_skip = grep("1/2/2007", readLines("household_power_consumption.txt"))
no_lines_skip = no_lines_skip[1] - 1
# Read data              
data <- read.table("household_power_consumption.txt", skip= no_lines_skip,sep = ";", nrows = 2881)
# Name the Column Heading
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Convert Date & Time from CHAR to Date and Time format
# Convert Date & Time fields into date_time POSIXIt
date_time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
# Combine it as column to the data table
data <- cbind(data, date_time)

## Line Graph
png("plot3.png", width=480, height=480)

#Plot
plot(data$date_time, data$Sub_metering_1, ylab="Sub Metering", xlab = " ", type ="n" )
    lines(data$date_time, data$Sub_metering_1, type = "l")
    lines(data$date_time, data$Sub_metering_2, col = "red", type = "l")
    lines(data$date_time, data$Sub_metering_3, col = "blue", type = "l")

    legend("topright", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1, lty= 1)
       
dev.off()


