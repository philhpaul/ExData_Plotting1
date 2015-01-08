require(data.table)
filename<-"./exdata_data_household_power_consumption/household_power_consumption.txt"
## skip up to start of target day and read two days of data at one entry per minute 
DT<-fread(filename, skip="1/2/2007", nrows=2*24*60, sep=";")
## recover data column names
setnames(DT, colnames(fread(filename, nrows=0)))
png("plot1.png")
par(cex.axis=0.8,cex.lab=0.8,cex.main=0.9)
hist(DT$Global_active_power, xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", col="orange")
dev.off()