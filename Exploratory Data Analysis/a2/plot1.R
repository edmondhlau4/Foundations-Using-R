####
# plot1.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Format data
data <- aggregate(x = NEI$Emissions, by = list(NEI$year), FUN = sum)
names(data) <- c("Year", "PM2.5 Emissions")

# Plot
png("plot1.png")
plot(data, type = "l", lwd = 3, 
     main = "Sum of PM2.5 Emissions in the USA 1999 - 2008")
dev.off()