rm(list=ls())
h <- read.table("/home/hhammami/Bureau/THESE/R/household_power_consumption.txt", header=TRUE, sep=";")
#new var date+time
h$date.time<- paste(h$Date, h$Time)
#chage datetime form
h$date.time<-strptime(h$date.time, "%d/%m/%Y %H:%M:%S")
#choose period
t <- h [(which(h$date.time==strptime("2007-02-01", "%Y-%m-%d"))) : (which(h$date.time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))),]

#Plot3
png(file="/home/hhammami/ExData_Plotting1/figure/plot3.png", width=480, height=480)

plot(t$date.time, as.numeric(as.character(t$Sub_metering_1)), xlab="", 
     ylab ="Energy sub metering",type='l')
lines(t$date.time, as.numeric(as.character(t$Sub_metering_2)),
      type='l', col='red')
 lines(t$date.time, t$Sub_metering_3,type='l', col="blue")
legend('topright', col=c("black","red","blue"),  lty=c(1,1,1),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
                   
                 
dev.off()
