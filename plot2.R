##read data
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
## select specified date
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
##create field for merged Date/Time
data$DateTime<-strptime(paste(data$Date, data$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
## interp GAP as numeric
data$Global_active_power<-gsub(",", ".", data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
##plot (I use Ukrainian locale, so some marks may differ)
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab= "Global Active Power (killowatts)")
dev.off()

