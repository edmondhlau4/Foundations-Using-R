####
# plot5.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Format data
baltimore <- NEI[which(NEI$fips == "24510"), ]
baltimore <- baltimore[which(baltimore$type == "ON-ROAD"), ]

# Aggregate sums over years
data <- aggregate(x = baltimore$Emissions, 
                  by = list(baltimore$year), FUN = sum)
names(data) <- c("Year", "PM2.5 Emissions")

# Plot data
png("plot5.png")
plot(data, type = "l", lwd = 3, 
     main = "PM2.5 Emissions from motor vehicles in Baltimore 1999 - 2008",
     cex.main = 0.9)
dev.off()