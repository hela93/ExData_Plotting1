rm(list=ls())
h <- read.table("/home/hhammami/Bureau/THESE/R/household_power_consumption.txt", header=TRUE, sep=";")
summary(h)

#new var date+time
h$date.time<- paste(h$Date, h$Time)
#chage datetime form
h$date.time<-strptime(h$date.time, "%d/%m/%Y %H:%M:%S")
#choose period
t <- h [(which(h$date.time==strptime("2007-02-01", "%Y-%m-%d"))) : (which(h$date.time==strptime("2007-02-02 23:59:00", "%Y-%m-%d %H:%M:%S"))),]

#Plot1
png(file="/home/hhammami/ExData_Plotting1/figure/plot1.png", width=480, height=480)
hist(as.numeric(as.character(t$Global_active_power)),  main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
