## Download the file and put it in the data folder:
if (!file.exists("./data")) {dir.create("./data")}
URLzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URLzip, "./data/Electric.zip", method = "curl")

##Unzip files in the created directory:
unzip("./data/Electric.zip", exdir = "./data")

##Read the .txt file and subset the corresponding date:
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
February <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot the different Submeterings and copy it as .png:
nData <- strptime(paste(February$Date, February$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ##Need to change date format as this 
subMetering1 <- as.numeric(February$Sub_metering_1) ##x has to be numeric
subMetering2 <- as.numeric(February$Sub_metering_2) ##added as numeric as lines
subMetering3 <- as.numeric(February$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(nData, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(nData, subMetering2, type = "l", col = "red")
lines(nData, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
