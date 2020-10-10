datasetUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if (!file.exists("Electric power consumption")) {
        download.file(datasetUrl, destfile = "./Electric power consumption")       
}
unzip("Electric power consumption")
list.files() # to know the file name that has unziped which is "household_power_consumption"
rawDataset <- read.table("household_power_consumption.txt", header = T, sep = ";", dec = ".",encoding = "UTF-8", stringsAsFactors = T, na.strings = "?")
na.omit(rawDataset)
as.Date(rawDataset$Date, "%d/%m/%y")
strptime(rawDataset$Time, "hh:mm:ss")
str(rawDataset)
dataSet1 <- subset(rawDataset, Date == "1/2/2007")
dataSet2 <- subset(rawDataset, Date == "2/2/2007")
dataset <- rbind(dataSet1, dataSet2)
png(filename = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, xlab = "Global Active power(kilowatts)", main = "Global Active power", col = "red", freq = 200)
dev.off()