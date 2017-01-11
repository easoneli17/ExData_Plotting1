setwd("/Users/Lizzie Eason/Desktop/Coursera/4_EDA")
housedata <- read.table("household_power_consumption.txt", sep=";", 
                        na.strings="?",header=TRUE)

#This code is used to determine where to put the x axis labels
length(housedata$Sub_metering_1[housedata$Date=="1/2/2007"])
#1440

#note that 480 is the default height and width for png(), 
#but they are included here for clarity
png(file="plot4.png",width=480,height=480) 

par(mfcol=c(2,2))

#plot 1
plot(housedata$Global_active_power[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
lines(housedata$Global_active_power[housedata$Date=="1/2/2007"
                                    |housedata$Date=="2/2/2007"])
axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#plot 2
plot(housedata$Sub_metering_1[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Energy sub metering",xlab="",xaxt="n")

lines(housedata$Sub_metering_1[housedata$Date=="1/2/2007"
                               |housedata$Date=="2/2/2007"])
lines(housedata$Sub_metering_2[housedata$Date=="1/2/2007"
                               |housedata$Date=="2/2/2007"],col="red")
lines(housedata$Sub_metering_3[housedata$Date=="1/2/2007"
                               |housedata$Date=="2/2/2007"],col="blue")

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

legend(x=1300,y=40,"Sub_metering_1",lty=c(1,1),col="black",cex=.8,inset=0,bty="n")
legend(x=1300,y=36,"Sub_metering_2",lty=c(1,1),col="blue",cex=.8,inset=0,bty="n")
legend(x=1300,y=32,"Sub_metering_3",lty=c(1,1),col="red",cex=.8,inset=0,bty="n")

#plot3
plot(housedata$Voltage[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Voltage",xlab="datetime",xaxt="n")

lines(housedata$Voltage[housedata$Date=="1/2/2007"
                               |housedata$Date=="2/2/2007"])

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

#plot4
plot(housedata$Global_reactive_power[housedata$Date=="1/2/2007"|housedata$Date=="2/2/2007"],
     type="n", ylab="Global_reactive_power",xlab="datetime",xaxt="n")

lines(housedata$Global_reactive_power[housedata$Date=="1/2/2007"
                        |housedata$Date=="2/2/2007"])

axis(side=1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off() 
