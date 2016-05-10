energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date <- as.Date(energy$Date, "%d/%m/%Y")
energy$Date <- Date
twodays <- energy[energy$Date == "2007-02-01"|energy$Date == "2007-02-02",]
datetime <- paste(twodays$Date,twodays$Time)
datetime <- as.POSIXlt(datetime, tz ="GMT")
twodays$datetime <- datetime
Global_active_power <- as.numeric(as.character(twodays$Global_active_power))
twodays$Global_active_power <- Global_active_power
Sub_metering_1 <- as.numeric(as.character(twodays$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(twodays$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(twodays$Sub_metering_3))
twodays$Sub_metering_1 <- Sub_metering_1
twodays$Sub_metering_2 <- Sub_metering_2
twodays$Sub_metering_3 <- Sub_metering_3
plot(twodays$datetime,twodays$Sub_metering_1, type = "l", col ="black", xlab = "", ylab = "Energy sub metering")
lines(twodays$datetime,twodays$Sub_metering_2, col ="red")
lines(twodays$datetime,twodays$Sub_metering_3, col ="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, text.width = strwidth("Sub_metering_33333"))
dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
