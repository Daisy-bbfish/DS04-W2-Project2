# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# download source file and unzip
source("initdownload.R")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Gather the subset of the NEI data which corresponds to vehicles
sub3 <- subset(NEI, fips == "24510" & type=="ON-ROAD")
baltmot.sources <- aggregate(sub3[c("Emissions")], list(type = sub3$type, year = sub3$year, zip = sub3$fips), sum)

library(ggplot2)
png("plot5.png",width=600,height=480,units="px")

qplot(year, Emissions, data = baltmot.sources, geom= "line") + theme_gray() + ggtitle("Motor Vehicle-Related Emissions in Baltimore County") + xlab("Year") + ylab("Emission Levels")

dev.off()
