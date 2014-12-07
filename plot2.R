Data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")
Subsetdata <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Datetime <- strptime(paste(Subsetdata$Date, Subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Globalactivepower <- as.numeric(Subsetdata$Global_active_power)

plot(Datetime, Globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
