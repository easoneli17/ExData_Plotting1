setwd("/Users/Lizzie Eason/Desktop/Coursera/4_EDA")
housedata <- read.table("household_power_consumption.txt", sep=";", 
                        na.strings="?",header=TRUE)
#note that 480 is the default height and width for png(), 
#but they are included here for clarity
png(file="plot1.png",width=480,height=480) 
hist(housedata$Global_active_power[housedata$Date=="1/2/2007"
                                   |housedata$Date=="2/2/2007"], 
     col="red", ylab="Frequency", xlab="Global Active Power (kilowatts)",
     xlim=c(0,6), main="Global Active Power")

dev.off() 
