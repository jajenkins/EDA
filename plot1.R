library(dplyr)
library(lubridate)

setwd("C:/Users/jeff.jenkins/Dropbox/R/coursera/ExploratoryDataAnalysis")

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

##data2$Date <- as.Date(data2$Date, "%d/%m/%Y") ## converts date from factor to Date format



##data2[,10] <- 

dt <- paste(data2[,1], data2[,2])

dt <- strptime(dt,"%d/%m/%Y %H:%M:%S")  ## converts chars to date/time

png(file = "plot1.png", width = 480, height = 480) 
with(data2, hist(data2[,3], ylab="Frequency", xlab ="Global Active Power (kilowatts)", col = "red" ))
dev.off()