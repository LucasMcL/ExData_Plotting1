# This R script reads in the household power consumption dataset and
# creates a histrogram of global active power from 1/2/2007 to 2/2/2007

# Define column classes, read in data, and subset for certain dates
colClasses <- c("character", "character", "numeric", "numeric",
                "numeric", "numeric", "numeric", "numeric", "numeric")
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = colClasses, na.strings = "?")
row.index <- 66637:69516
data <- data[row.index, ]

# Open png graphics device, create histrogram, then close device
png("ExData_Plotting1/plot1.png")
with(data, hist(Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))
dev.off()