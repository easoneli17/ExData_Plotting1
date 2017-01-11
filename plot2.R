setwd("/Users/Lizzie Eason/Desktop/Coursera/4_EDA")
housedata <- read.table("household_power_consumption.txt", sep=";", 
                        na.strings="?",header=TRUE)
#This code is used to determine where to put the x axis labels
length(housedata$Global_active_power[housedata$Date=="1/2/2007"])
#1440
length(housedata$Global_active_power[housedata$Date=="2/2/2007"])
#1440
#note that 480 is the default height and width for png(), 
#but they are included here for clarity
png(file="plot2.png",width=480,height=480) 

plot(housedata$Global_active_power[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
lines(housedata$Global_active_power[housedata$Date=="1/2/2007"
                                    |housedata$Date=="2/2/2007"])
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off() 
