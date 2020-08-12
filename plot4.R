##Reading data
power_full <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subset data to be used
power <- subset(power_full, Date %in% c("1/2/2007", "2/2/2007"))

##Format Date and Time and add an additional DateTime variable
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$DateTime <- paste(power$Date, power$Time)
power$Time <- strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S")

##Create panel graph: plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(power$Time, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
plot(power$Time, power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage" )
plot(power$Time, power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(power$Time, power$Sub_metering_2, type = "l", col = "red")
lines(power$Time, power$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(power$Time, power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )
dev.off()