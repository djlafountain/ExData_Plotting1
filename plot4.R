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
Global_reactive_power <- as.numeric(as.character(twodays$Global_reactive_power))
Voltage <- as.numeric(as.character(twodays$Voltage))
twodays$Global_reactive_power <- Global_reactive_power
twodays$Voltage <- Voltage
par(mfrow=c(2,2))
with(twodays,{
        plot(datetime, Global_active_power, type = "l",xlab = "", ylab = "Global Active Power")
        
        plot(datetime, Voltage, type = "l")
        
        plot(datetime, Sub_metering_1, type = "l", col ="black", xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, col ="red")
        lines(datetime, Sub_metering_3, col ="blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd = 1, text.width = strwidth("Sub_metering_33333"), bty = "n", y.intersp = .2)

        plot(datetime, Global_reactive_power, type = "l")
})
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()