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
mydata2$Voltage<-as.numeric(mydata2$Voltage)
mydata2$Sub_metering_1<-as.numeric(mydata2$Sub_metering_1)
mydata2$Sub_metering_2<-as.numeric(mydata2$Sub_metering_2)
#open up png device
png(filename ="./data/plot1.png")
#set up "par()" parameters
par(cra=c(480,480))
#the first plot of project 
hist(mydata2$Global_active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
#close up png device,write plot into file
dev.off()