####
# plot6.R
####

# Read RDS
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset data and select "ON-ROAD"
subset <- NEI[which(NEI$fips == "24510" | NEI$fips == "06037"), ]
names(subset)[1] <- "City"
subset$City[subset$City == "24510"] <- "Baltimore"
subset$City[subset$City == "06037"] <- "Los Angeles County"
subset$City <- factor(subset$City)
subset <- subset[which(subset$type == "ON-ROAD"), ]

data <- aggregate(x = subset$Emissions, 
                  by = list(subset$year, subset$City), FUN = sum)
names(data) <- c("Year", "City", "PM2.5Emissions")

# Gives change over time
data$PM2.5Emissions[1:4] <- data$PM2.5Emissions[1:4] / data$PM2.5Emissions[1]
data$PM2.5Emissions[5:8] <- data$PM2.5Emissions[5:8] / data$PM2.5Emissions[5]

# Plot data
require("ggplot2")
png("plot6.png")
ggplot(data = data,
       aes(x = Year, y = PM2.5Emissions, colour = City)) +
  geom_line(lwd = 2) +
  ggtitle("PM 2.5 Emissions in Baltimore City and Los Angeles County 1999 - 2008") +
  theme(legend.position = 'bottom')
dev.off()