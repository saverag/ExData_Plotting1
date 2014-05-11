##read data
data<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
## select specified date
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
## interp GAP as numeric
data$Global_active_power<-gsub(",", ".", data$Global_active_power)
data$Global_active_power<-as.numeric(data$Global_active_power)
##plot
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (killowatts)", col="red")
dev.off()