elec<- read.csv("~/Documents/R/Semaine 1/Devoir/household_power_consumption.txt", header=T, sep=";")


elec$Date <- as.Date(elec$Date, format='%d/%m/%Y')
elec$Time <- strptime(elec$Time,format='%H:%M:%S')

elec2007 <- elec[(elec$Date=="2007-02-01") | (elec$Date=="2007-02-02"),]

elec2007$Global_active_power <- as.numeric(as.character(elec2007$Global_active_power))

hist(elec2007$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
