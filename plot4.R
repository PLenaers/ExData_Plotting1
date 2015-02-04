data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
mydata <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
rm(data)

mydata$Time <- strptime(mydata$Time,"%H:%M:%S")
mydata$Global_active_power <- as.numeric(mydata$Global_active_power)
mydata$Global_reactive_power <- as.numeric(mydata$Global_reactive_power)
mydata$Voltage <- as.numeric(mydata$Voltage)
mydata$Global_intensity <- as.numeric(mydata$Global_intensity)
mydata$Sub_metering_1 <- as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2 <- as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3 <- as.numeric(mydata$Sub_metering_3)

png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))

#Plot 1
plot(mydata$Global_active_power, type="l", xlab="", ylab="Global Activity Power (kilowatts)", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

#Plot 2
plot(mydata$Voltage, type="l", xlab="datetime", ylab="Voltage", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

#Plot 3
plot(mydata$Sub_metering_1, type="l", xlab="", col="black", ylab="Energy sub meeting", xaxt="n")
lines(mydata$Sub_metering_2, type="l", xlab="", col="red", xaxt="n")
lines(mydata$Sub_metering_3, type="l", xlab="", col="blue", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

#Plot 4
plot(mydata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", xaxt="n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

dev.off()