## Download the file and put it in the data folder:
if (!file.exists("./data")) {dir.create("./data")}
URLzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URLzip, "./data/Electric.zip", method = "curl")

##Unzip files in the created directory:
unzip("./data/Electric.zip", exdir = "./data")

##Read the .txt file and subset the corresponding date:
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
February <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Set the variables used as numeric, in the case of Dates as specified:
nData <- strptime(paste(February$Date, February$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(February$Global_active_power)
GAR <- as.numeric(February$Global_reactive_power)
Voltage <- as.numeric(February$Voltage)
subMetering1 <- as.numeric(February$Sub_metering_1)
subMetering2 <- as.numeric(February$Sub_metering_2)
subMetering3 <- as.numeric(February$Sub_metering_3)

##Plot the variables and copy them as png:
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(nData, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(nData, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(nData, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(nData, subMetering2, type = "l", col = "red")
lines(nData, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(nData, GAR, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
