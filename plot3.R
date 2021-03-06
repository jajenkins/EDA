library(dplyr)
library(lubridate)

setwd("C:/Users/jeff.jenkins/Dropbox/R/coursera/ExploratoryDataAnalysis")

data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

##data2$Date <- as.Date(data2$Date, "%d/%m/%Y") ## converts date from factor to Date format



##data2[,10] <- 

dt <- paste(data2[,1], data2[,2])

dt <- strptime(dt,"%d/%m/%Y %H:%M:%S")  ## converts chars to date/time

png(file = "plot3.png", width = 480, height = 480) 
##with(data2, plot(dt, data2[,3], type ="l",  ylab = "Global Active Power (kilowatts)", xlab = ""))
with(data2, plot(dt, data2$Sub_metering_1, type ="l",  ylab = "Energy Sub metering", xlab = ""))
with(data2, points(dt, data2$Sub_metering_2, type ="l",  ylab = "Global Active Power (kilowatts)", xlab = "", col = "red"))
with(data2, points(dt, data2$Sub_metering_3, type ="l",  ylab = "Global Active Power (kilowatts)", xlab = "", col = "blue"))
dev.off()