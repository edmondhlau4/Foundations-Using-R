####
# plot2.R
####

# File already unzipped
# Sets working directory
setwd("/Users/edmondlau/R/datasciencecoursera/Exploratory Data Analysis/a1")

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


# Plot time series 
png("plot2.png", width = 480, height = 480)
plot(HHP2$dateTime, HHP2$Global_active_power, type = "l", xlab=" ", 
     ylab="Global active power (kilowatts)")
dev.off()