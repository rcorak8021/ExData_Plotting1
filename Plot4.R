power_all <- read.delim("C:\\Users\\rcorak\\Documents\\MyRStuff\\ProgrammingAssignment2\\household_power_consumption.txt",header = TRUE,sep = ";")
power_all$Date <- as.Date(power_all$Date, format="%d/%m/%Y")
power_sub <- power_all[(power_all$Date == "2007-02-01") | (power_all$Date == "2007-02-02"),]

power_sub$Global_active_power <- as.numeric(as.character(power_sub$Global_active_power))
power_sub$Sub_metering_1 <- as.numeric(as.character(power_sub$Sub_metering_1))
power_sub$Sub_metering_2 <- as.numeric(as.character(power_sub$Sub_metering_2))
power_sub$Sub_metering_3 <- as.numeric(as.character(power_sub$Sub_metering_3))
power_sub$Voltage <- as.numeric(as.character(power_sub$Voltage))
power_sub$Global_reactive_power <- as.numeric(as.character(power_sub$Global_reactive_power))

power_sub <- transform(power_sub, timestamp=as.POSIXct(paste(Date, Time)), "%d-%m-%Y %H:%M:%S")

par(mfrow=c(2,2))
plot(power_sub$timestamp, power_sub$Global_active_power, type = "l", xlab = "", ylab="Global Active Power")

plot(power_sub$timestamp, power_sub$Voltage, type = "l", xlab = "datetime", ylab="Global Active Power")

plot(power_sub$timestamp, power_sub$Sub_metering_1, type = "l", xlab = "", ylab="Energy sub metering")
lines(power_sub$timestamp,df$Sub_metering_2,col="red")
lines(power_sub$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub Metering 1  ","Sub Metering 2  ", "Sub Metering 3  "),lty=c(1,1), lwd=c(1,1), cex=0.7, bty = "n")

plot(power_sub$timestamp, power_sub$Global_reactive_power, type = "l", xlab = "datetime")



dev.copy(png,filename="plot4.png")
dev.off ()
