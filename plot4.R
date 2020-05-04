rm(list=ls())
h <- read.table("/home/hhammami/Bureau/THESE/R/household_power_consumption.txt", header=TRUE, sep=";")
#new var date+time
h$date.time<- paste(h$Date, h$Time)
#chage datetime form
h$date.time<-strptime(h$date.time, "%d/%m/%Y %H:%M:%S")
#choose period
t <- h [(which(h$date.time==strptime("2007-02-01", "%Y-%m-%d"))) : (which(h$date.time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))),]

#Plot4
png(file="/home/hhammami/ExData_Plotting1/figure/plot4.png", width=480, height=480)

par(mfcol=c(2,2))
plot(t$date.time, as.numeric(as.character(t$Global_active_power)),type='l', ylab="Global Active Power", xlab=" ")
plot(t$date.time, as.numeric(as.character(t$Sub_metering_1)),type='l', xlab=" ", ylab ="Energy sub metering")
lines(t$date.time, as.numeric(as.character(t$Sub_metering_2)),type='l', col='red')
lines(t$date.time, t$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(t$date.time, as.numeric(as.character(t$Voltage)),type='l',ylab="Voltage",xlab="datetime" )
plot(t$date.time, as.numeric(as.character(t$Global_reactive_power)),type='l',ylab="Global_reactive_power",xlab="datetime" )

dev.off()
