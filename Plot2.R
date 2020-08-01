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
png(filename="plot2.png", width=480, height=480)
##Create the plot on the devide 
plot(data3$Time, data3$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##Close the device
dev.off()


