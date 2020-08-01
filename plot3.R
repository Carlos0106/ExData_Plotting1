##Plot histogram of Global Active Power
##Read the data
data<-read.delim("household_power_consumption.txt", header=TRUE, sep=";")
data1<-subset(data, Date=="1/2/2007")
data2<-subset(data, Date=="2/2/2007")
##Create a data frame with the especific data
data3<-rbind(data1, data2)
data3$Date<-as.Date(data3$Date, "%d/%m/%Y") ##Change class to Data. Use capital Y for 4 digits year
data3$Time<-strptime(paste(data3$Date,data3$Time), format="%Y-%m-%d %H:%M:%S")
##Open the specific device (png) 
png(filename="plot3.png", width=480, height=480)
##Create the plot on the devide 
plot(data3$Time, data3$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data3$Time, data3$Sub_metering_2, col="red")
lines(data3$Time, data3$Sub_metering_3, col="blue")
##Legend
legend("topright",lty = 1, col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
##Close the device
dev.off()
