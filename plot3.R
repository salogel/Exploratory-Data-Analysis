Data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")
Subsetdata <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Datetime <- strptime(paste(Subsetdata$Date, Subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Submetering1 <- as.numeric(Subsetdata$Sub_metering_1)
Submetering2 <- as.numeric(Subsetdata$Sub_metering_2)
Submetering3 <- as.numeric(Subsetdata$Sub_metering_3)

plot(Datetime, Submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(Datetime, Submetering2, type="l", col="Red")
lines(Datetime, Submetering3, type="l", col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("Black", "Red", "Blue"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
