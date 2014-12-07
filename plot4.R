Data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")
Subsetdata <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Datetime <- strptime(paste(Subsetdata$Date, Subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Globalactivepower <- as.numeric(Subsetdata$Global_active_power)
Globalreactivepower <- as.numeric(Subsetdata$Global_reactive_power)
Voltage <- as.numeric(Subsetdata$Voltage)
Submetering1 <- as.numeric(Subsetdata$Sub_metering_1)
Submetering2 <- as.numeric(Subsetdata$Sub_metering_2)
Submetering3 <- as.numeric(Subsetdata$Sub_metering_3)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

plot(Datetime, Globalactivepower, type="l", xlab="", ylab="Global Active Power")

plot(Datetime, Voltage, type="l", xlab="Datetime", ylab="Voltage")

plot(Datetime, Submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(Datetime, Submetering2, type="l", col="Red")
lines(Datetime, Submetering3, type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty="n", col=c("Black", "Red", "Blue"))

plot(Datetime, Globalreactivepower, type="l", xlab="Datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()