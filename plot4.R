## plot4 generates a plot identical to "Plot 4" in the readme file
#   dataFile = name & location of file containing the dataset.  
plot4 <- function(dataFile) {
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
  png(file='plot4.png')

  par(mfcol=c(2,2))
  #Upper left graph
  plot(dataSubset$DateTime, dataSubset$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  #Lower left graph
  plot(  dataSubset$DateTime, dataSubset$Sub_metering_1, type="l", col="black",
         xlab="",
         ylab="Energy sub metering")
  points(dataSubset$DateTime, dataSubset$Sub_metering_2, type="l", col="red")
  points(dataSubset$DateTime, dataSubset$Sub_metering_3, type="l", col="blue")
  legend("topright",
         lty=1,
         col=c("black","red","blue"),
         legend=c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),
         bty="n",
         cex=0.95)
  
  #Upper right graph
  plot(dataSubset$DateTime, dataSubset$Voltage,
       type="l",
       xlab="datetime",
       ylab="Voltage")
  
  #Lower right graph
  plot(dataSubset$DateTime, dataSubset$Global_reactive_power,
       type="l",
       xlab="datetime",
       ylab="Global_reactive_power")
  
  dev.off()
}

plot4("../household_power_consumption.txt")