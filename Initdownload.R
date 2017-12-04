# Download import data file, if it does not exist

importFile <- "NEI_data.zip"

if(!file.exists(importFile)) {
  
  importURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  
  download.file(url=importURL,destfile=importFile)
}

if(!(file.exists("summarySCC_PM25.rds") && file.exists("Source_Classification_Code.rds"))) { 
  unzip(importFile) 
}