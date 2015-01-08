require(data.table)
filename<-"./exdata_data_household_power_consumption/household_power_consumption.txt"
## skip up to start of target day and read two days of data at one entry per minute 
DT<-fread(filename, skip="1/2/2007", nrows=2*24*60, sep=";")
## recover data column names
setnames(DT, colnames(fread(filename, nrows=0)))
## create a time axis
timeaxis<-strptime(paste(DT[,Date],DT[,Time]), "%d/%m/%Y %H:%M:%S")
png("plot4.png")
## configure for 2 by 2 plots, adjust font sizs and margins
par(mfrow=c(2,2),cex.axis=0.8,cex.lab=0.8, mar=c(4,4,1,1))
plot(timeaxis,DT$Global_active_power, xlab="", 
     ylab = "Global Active Power (kilowatts)",type = "l")
plot(timeaxis,DT$Voltage, xlab="", ylab = "voltage",type = "l")
plot(timeaxis,DT$Sub_metering_1, xlab="", 
     ylab = "energy sub metering",type = "l")
lines(timeaxis,DT$Sub_metering_2, col="red")
lines(timeaxis,DT$Sub_metering_3, col="blue")
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"),
       col=c("black","red","blue"), lty=c(1,1,1),cex=0.7)
plot(timeaxis,DT$Global_reactive_power, xlab="", 
     ylab = "Global_reactive_power",type = "l") 
dev.off()