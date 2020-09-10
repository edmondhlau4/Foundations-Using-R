####
# plot4.R
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

# Plot 4 graphs: Golbal active power, voltage, energy sub metering, global reactive power
png("plot4.png",  width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(HHP2$dateTime, HHP2$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")
plot(HHP2$dateTime, HHP2$Voltage, type="l", xlab="dateTime", ylab="Voltage")
plot(HHP2$dateTime, HHP2$Sub_metering_1, type="n", ylim=c(0,40),ylab="Energy sub metering", xlab="")
lines(HHP2$dateTime, HHP2$Sub_metering_1, type="l", col="black")
lines(HHP2$dateTime, HHP2$Sub_metering_2, type="l", col="red")
lines(HHP2$dateTime, HHP2$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.75, lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))
plot(HHP2$dateTime, HHP2$Global_reactive_power, type="l", xlab="dateTime", ylab="Global Reactive Power (Kilowatts)")
dev.off()