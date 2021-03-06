## plot2 generates a plot identical to "Plot 2" in the readme file
#   dataFile = name & location of file containing the dataset.  
plot2 <- function(dataFile) {
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
  png(file='plot2.png')
  plot(dataSubset$DateTime,
       dataSubset$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  dev.off()
}

plot2("../household_power_consumption.txt")