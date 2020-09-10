####
# plot1.R
####

# File already unzipped
# Sets working directory
setwd("/Users/edmondlau/R/datasciencecoursera/Exploratory Data Analysis/a1")

# Reads file
HHP <- read.csv("household_power_consumption.txt", 
                sep=";", na.strings = "?")

# Combine date and time, format it and add it to the data frame
dateTime <- paste(HHP$Date, HHP$Time)
dateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
HHP <- cbind(dateTime, HHP)

# Convert Date column to date class
HHP$Date <- as.Date(HHP$Date, format="%d/%m/%Y")

# Subset: first two days of Feb 2007
HHP2 <- subset(x = HHP, subset = Date == "2007-02-01" | Date == "2007-02-02")

# Plot Histogram
png("plot1.png", width = 480, height = 480)
hist(HHP2$Global_active_power, main="Global active power", col = "red",
     xlab = "Global active power (kilowatts)", ylab="Frequency")
dev.off()