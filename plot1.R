data = read.csv("household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
mydata <- subset(data, Date == "2007-02-01" | Date == "2007-02-01")
rm(data)

png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(mydata$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()