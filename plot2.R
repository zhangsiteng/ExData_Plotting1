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
png(filename ="./data/plot2.png")
#set up "par()" parameters
par(cra=c(480,480))
#the second plot of project 
with(mydata2,plot(Time,Global_active_power,ylab="Global Active Power (killowatts)",xlab="",type="l"))
#close up png device,write plot into file
dev.off()