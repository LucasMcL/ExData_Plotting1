# This R script reads in the household power consumption dataset and
# creates a plot of sub metering from 1/2/2007 to 2/2/2007

library(dplyr)

# Define column classes, read in data, and subset for certain dates
colClasses <- c("character", "character", "numeric", "numeric",
                "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colClasses, na.strings = "?")
row.index <- 66637:69516
data <- data[row.index, ]

# Create date and time variable of class POSIXct
data <- mutate(data, Date_and_time_as_char = paste(Date, Time))
data <- mutate(data, Date_and_time = as.POSIXct(data$Date_and_time_as_char, 
               format = "%d/%m/%Y %H:%M:%S"))

# Open png graphics device, plot, then close device
png("ExData_Plotting1/plot3.png")
with(data, plot(Date_and_time, Sub_metering_1, type = "n", 
        ylab = "Energy Sub Metering", xlab = ""))
with(data, lines(Date_and_time, Sub_metering_1))
with(data, lines(Date_and_time, Sub_metering_2, col = "red"))
with(data, lines(Date_and_time, Sub_metering_3, col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1,
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()