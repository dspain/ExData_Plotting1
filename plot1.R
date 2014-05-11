## plot1 generates a plot identical to "Plot 1" in the readme file
#   dataFile = name & location of file containing the dataset.  
plot1 <- function(dataFile) {
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
  hist(dataSubset$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       col="red")
  dev.copy(png, file='plot1.png')
  dev.off()
}

plot1("../household_power_consumption.txt")