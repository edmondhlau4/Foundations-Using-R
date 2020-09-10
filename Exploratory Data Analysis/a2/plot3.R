####
# plot3.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data
subset <- NEI[which(NEI$fips == "24510"), ]
data <- aggregate(x = subset$Emissions, by = list(subset$year, subset$type), FUN = sum)
names(data) <- c("Year", "Type", "PM2.5Emissions")

# Plot data
require("ggplot2")
png("plot3.png")
ggplot(data = data,
       aes(x = Year, y = PM2.5Emissions, colour = Type)) +
  geom_line(lwd = 2) +
  ggtitle("PM 2.5 Emissions in Baltimore City 1999 - 2008 by type")
dev.off()