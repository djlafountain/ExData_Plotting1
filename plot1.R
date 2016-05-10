energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
Date <- as.Date(energy$Date, "%d/%m/%Y")
energy$Date <- Date
twodays <- energy[energy$Date == "2007-02-01"|energy$Date == "2007-02-02",]
datetime <- paste(twodays$Date,twodays$Time)
datetime <- as.POSIXlt(datetime, tz ="GMT")
twodays$datetime <- datetime
Global_active_power <- as.numeric(as.character(twodays$Global_active_power))
twodays$Global_active_power <- Global_active_power
with(twodays, hist(Global_active_power, breaks = 12, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()