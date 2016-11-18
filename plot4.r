elec<- read.csv("household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE)
elec2007 <- elec[elec$Date %in% c("1/2/2007","2/2/2007") ,]
dateheure <- strptime(paste(elec2007$Date, elec2007$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

elec2007$Global_active_power <- as.numeric(elec2007$Global_active_power)
elec2007$Global_reactive_power <- as.numeric(elec2007$Global_reactive_power)
elec2007$subMetering1 <- as.numeric(elec2007$Sub_metering_1)
elec2007$subMetering2 <- as.numeric(elec2007$Sub_metering_2)
elec2007$subMetering3 <- as.numeric(elec2007$Sub_metering_3)


par(mfrow = c(2, 2)) 

plot(dateheure, elec2007$Global_active_power, typ="l", xlab="datetime", ylab = "global active power")
plot(dateheure, elec2007$Voltage, type ="l", xlab="datetime", ylab ="voltage")
plot(dateheure, elec2007$subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(dateheure, elec2007$subMetering2, type="l", col="red")
lines(dateheure, elec2007$subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
plot(dateheure, elec2007$Global_reactive_power, typ="l",  xlab ="Global Reactive Power", ylab = "datetime")

png("plot4.png", width=480, height=480)

dev.off()
