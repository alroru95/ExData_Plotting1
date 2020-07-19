## Download the file and put it in the data folder:
if (!file.exists("./data")) {dir.create("./data")}
URLzip <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URLzip, "./data/Electric.zip", method = "curl")

##Unzip files in the created directory:
unzip("./data/Electric.zip", exdir = "./data")

##Read the .txt file and subset the corresponding date:
data <- read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
February <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

##Plot Global active power and Frequency and copy it as .png:
GAP <- as.numeric(February$Global_active_power) ##x has to be numeric
png("plot1.png", width=480, height=480)
with(February, hist(GAP, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))
dev.off() 
