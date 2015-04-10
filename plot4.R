# This R script reads in the household power consumption dataset and
# creates multiple plots with data from 1/2/2007 to 2/2/2007

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

#Open png graphics device
png("ExData_Plotting1/plot4.png")
par(mfcol = c(2,2))

# Create top-left graph
with(data, {
        plot(Date_and_time, Global_active_power, type = "n", xlab = "", ylab = "Global Active Power")
        lines(Date_and_time, Global_active_power)
        })
# Create bottom-left graph
with(data, {
        plot(Date_and_time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(Date_and_time, Sub_metering_1)
        lines(Date_and_time, Sub_metering_2, col = "red")
        lines(Date_and_time, Sub_metering_3, col = "blue")
        })
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Create top-right graph
with(data, {
        plot(Date_and_time, Voltage, type = "n", xlab = "datetime")
        lines(Date_and_time, Voltage)
        })
#Create bottom-right graph
with(data, {
        plot(Date_and_time, Global_reactive_power, type = "n", xlab = "datetime")
        lines(Date_and_time, Global_reactive_power)
})

dev.off()