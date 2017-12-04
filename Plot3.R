# Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

# download source file and unzip
source("initdownload.R")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
baltimoreNEI <- subset(NEI, fips == "24510")

# Aggregate using sum the Baltimore emissions data by year
aggTotalsBaltimore <- aggregate(baltimoreNEI[c("Emissions")], list(type = baltimoreNEI$type, year = baltimoreNEI$year), sum)

png("plot3.png",width=600,height=480,units="px")

library(ggplot2)

qplot(year, Emissions, data = aggTotalsBaltimore, color = type, geom= "line")+ ggtitle("Total PM2.5 Emissions in Baltimore County by Source Type") + xlab("Year") + ylab("PM2.5 Emissions")

dev.off()
