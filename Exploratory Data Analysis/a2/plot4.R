####
# plot4.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Search for Comb ... Coal and formats
sectors <- grep(x = SCC$EI.Sector, pattern = "Comb.*Coal")
subsetSCC <- SCC$SCC[sectors]
subsetNEI <- NEI[which(NEI$SCC %in% subsetSCC), ]

# Aggregate sums over years
data <- aggregate(x = subsetNEI$Emissions, by = list(subsetNEI$year), FUN = sum)
names(data) <- c("Year", "PM2.5 Emissions")

# Plot Data
png("plot4.png")
plot(data, type = "l", lwd = 3, 
     main = "Sum of PM2.5 Emissions from coal combustion 1999 - 2008")
dev.off()