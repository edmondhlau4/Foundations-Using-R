####
# plot2.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data
subset <- NEI[which(NEI$fips == "24510"), ]
data <- aggregate(x = subset$Emissions, by = list(subset$year), FUN = sum)
names(data) <- c("Year", "PM2.5 Emissions")

# Plot data
png("plot2.png")
plot(data, type = "l", lwd = 3, 
     main = "PM2.5 Emissions in Baltimore City 1999 - 2008")
dev.off()