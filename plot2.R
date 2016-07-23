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
png("plot2.png")
plot(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"),
     data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
graphics.off()