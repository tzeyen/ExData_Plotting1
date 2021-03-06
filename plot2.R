##Reading data
power_full <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

##Subset data to be used
power <- subset(power_full, Date %in% c("1/2/2007", "2/2/2007"))

##Format Date and Time and add an additional DateTime variable
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power$DateTime <- paste(power$Date, power$Time)
power$Time <- strptime(power$DateTime, format = "%Y-%m-%d %H:%M:%S")

##Create the line plot: plot 2
png(file = "plot2.png", width = 480, height = 480)
plot(power$Time, power$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)" )
dev.off()
