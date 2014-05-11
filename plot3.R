## plot3 generates a plot identical to "Plot 3" in the readme file
#   dataFile = name & location of file containing the dataset.  
plot3 <- function(dataFile) {
  data <- read.csv(dataFile,
                   header=TRUE,sep=";",
                   colClasses=c("character","character",rep("numeric",7)), 
                   na.strings="?")
  data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                            format="%d/%m/%Y %H:%M:%S")
  data$Date <- as.Date(data$Date, 
                       format="%d/%m/%Y")
  dataSubset <- subset(data, 
                       data$Date %in% as.Date(c('2007-02-01','2007-02-02'), 
                                              format="%Y-%m-%d"))
  png(file='plot3.png')
  plot(  dataSubset$DateTime, dataSubset$Sub_metering_1, type="l", col="black",
         xlab="",
         ylab="Energy sub metering")
  points(dataSubset$DateTime, dataSubset$Sub_metering_2, type="l", col="red")
  points(dataSubset$DateTime, dataSubset$Sub_metering_3, type="l", col="blue")
  legend("topright",
         lty=1,
         col=c("black","red","blue"),
         legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "))
  dev.off()
}

plot3("../household_power_consumption.txt")