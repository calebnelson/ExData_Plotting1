filename <- "data.zip"
if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(URL, filename)
}
if(!file.exists("household_power_consumption.txt")){
  unzip(filename)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
dt <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

png("plot4.png")

#Split into 4 graphs
par(mfrow=c(2,2))

#Graph top left
plot(dt, data$Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Graph top right
plot(dt, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Graph bottom left
plot(dt, data$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, data$Sub_metering_2, type="l", col="red")
lines(dt, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#Graph bottom right
plot(dt, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

graphics.off()