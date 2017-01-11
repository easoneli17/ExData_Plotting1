setwd("/Users/Lizzie Eason/Desktop/Coursera/4_EDA")
housedata <- read.table("household_power_consumption.txt", sep=";", 
                        na.strings="?",header=TRUE)

#This code is used to determine where to put the x axis labels
length(housedata$Sub_metering_1[housedata$Date=="1/2/2007"])
#1440

#note that 480 is the default height and width for png(), 
#but they are included here for clarity
png(file="plot3.png",width=480,height=480) 

plot(housedata$Sub_metering_1[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Energy sub metering",xlab="",xaxt="n")

lines(housedata$Sub_metering_1[housedata$Date=="1/2/2007"
                                    |housedata$Date=="2/2/2007"])
lines(housedata$Sub_metering_2[housedata$Date=="1/2/2007"
                                    |housedata$Date=="2/2/2007"],col="red")
lines(housedata$Sub_metering_3[housedata$Date=="1/2/2007"
                                    |housedata$Date=="2/2/2007"],col="blue")

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","blue","red"))

dev.off() 
