##read data
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
## select specified date
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
##create field for merged Date/Time
data$DateTime<-strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
## interp our data as numeric
data$Global_active_power<-as.numeric(gsub(",", ".", data$Global_active_power))
data$Global_reactive_power<-as.numeric(gsub(",", ".", data$Global_reactive_power))
data$Voltage<-as.numeric(gsub(",", ".", data$Voltage))
data$Sub_metering_1<-as.numeric(gsub(",", ".", data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(gsub(",", ".", data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(gsub(",", ".", data$Sub_metering_3))
##plot (I use Ukrainian locale, so some marks may differ)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab= "Global Active Power (killowatts)")
plot(data$DateTime, data$Voltage, type="l", xlab="", ylab= "Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab= "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend(1170330019,40, legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),col=c("black","blue","red"))

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="", ylab= "Global Rective Power")

dev.off()

