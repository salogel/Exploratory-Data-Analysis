Data <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', stringsAsFactors=FALSE, dec=".")
Subsetdata <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Globalactivepower <- as.numeric(Subsetdata$Global_active_power)
hist(Globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

