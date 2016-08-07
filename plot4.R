#initiate necessary packages
library(data.table)
library(lattice)
library(lubridate)
#then load data into R console
mydata<-read.table("./data/household_power_consumption.txt",sep=";",head=TRUE,stringsAsFactors = FALSE)
#filter relevant data into a new dataset
mydata$Date<-dmy(mydata$Date)
mydata2<-subset(mydata,(mydata$Date=="2007-02-01")|(mydata$Date=="2007-02-02"))
#converting relative character variables into numeric
mydata2$Global_reactive_power<-as.numeric(mydata2$Global_reactive_power)
mydata2$Global_active_power<-as.numeric(mydata2$Global_active_power)
mydata2$Voltage<-as.numeric(mydata2$Voltage)
mydata2$Sub_metering_1<-as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2<-as.numeric(mydata2$Sub_metering_2)
#convert Time variable into POSIXct
mydata2$Date<-as.character(mydata2$Date)
mydata2$Time<-as.POSIXct(strptime(paste(mydata2$Date,mydata2$Time),"%Y-%m-%d %H:%M:%S"),tz="GMT")
#open up png device
png(filename ="./data/plot4.png")
#set up "par()" parameters
par(cra=c(480,480),mfrow=c(2,2))
#the forth plot of project 
with(mydata2,plot(Time,Global_active_power,ylab="Global Active Power",xlab="",type="l"))
with(mydata2,plot(Time,Voltage,ylab="Voltage",xlab="date time",type="l"))
with(mydata2,plot(Time,Sub_metering_1,ylab="Energy sub metering",xlab="",type="l"))
points(mydata2$Time,mydata2$Sub_metering_2,type = "l",col="red")
points(mydata2$Time,mydata2$Sub_metering_3,type = "l",col="blue")
legend("topright",col=c("black","red","blue"),bty = "n",lty = c(1, 1, 1),legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
with(mydata2,plot(Time,Global_reactive_power,xlab="date time",type="l"))
#close up png device,write plot into file
dev.off()