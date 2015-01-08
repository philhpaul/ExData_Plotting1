require(data.table)
filename<-"./exdata_data_household_power_consumption/household_power_consumption.txt"
## skip up to start of target day and read two days of data at one entry per minute 
DT<-fread(filename, skip="1/2/2007", nrows=2*24*60, sep=";")
## recover data column names
setnames(DT, colnames(fread(filename, nrows=0)))
## create a time axis
timeaxis<-strptime(paste(DT[,Date],DT[,Time]), "%d/%m/%Y %H:%M:%S")
png("plot2.png")
par(cex.axis=0.8,cex.lab=0.8,cex.main=0.9)
plot(timeaxis,DT$Global_active_power, xlab="", 
     ylab = "Global Active Power (kilowatts)",type = "l")
dev.off()