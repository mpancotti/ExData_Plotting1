epc<-read.csv("household_power_consumption.txt",sep=";")
epc$Time<-strptime(paste(epc$Date,epc$Time),format="%d/%m/%Y %H:%M:%S")
epc$Date<-as.Date(epc$Date,format="%d/%m/%Y")
sepc<-subset(epc,Date==as.Date("2007-02-01") | Date==as.Date("2007-02-02"))
sepc$Sub_metering_1<-as.numeric(as.character(sepc$Sub_metering_1))
sepc$Sub_metering_2<-as.numeric(as.character(sepc$Sub_metering_2))
sepc$Sub_metering_3<-as.numeric(as.character(sepc$Sub_metering_3))
par(mfrow=c(1,1))
plot(sepc$Time,sepc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(sepc$Time,sepc$Sub_metering_2,type="l",col="red")
points(sepc$Time,sepc$Sub_metering_3,type="l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1))
dev.copy(png,"plot3.png")
dev.off()