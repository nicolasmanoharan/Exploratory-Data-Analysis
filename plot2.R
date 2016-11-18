
elec<- read.csv("~/Documents/R/Semaine 1/Devoir/household_power_consumption.txt", header=T, sep=";")
elec$Date <- as.Date(elec$Date, format="%d/%m/%Y")
elec2007 <- elec[(elec$Date=="2007-02-01") | (elec$Date=="2007-02-02"),]

elec2007$Global_active_power <- as.numeric(as.character(elec2007$Global_active_power))
elec2007 <- transform(elec2007, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(elec2007$timestamp,elec2007$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
