filename <- "data.zip"
if (!file.exists(filename)){
  URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(URL, filename)
}
if(!file.exists("household_power_consumption.txt")){
  unzip(filename)
}