#For create plot3.png please write: plot3("household_power_consumption.txt")

plot3 <- function(file) {
  data <- read.table(file, sep = ";", header = TRUE)
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  df <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  #-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2,col="red")
  lines(df$timestamp,df$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  #-------------------------------------------------------------------------------------
  dev.copy(png, file="plot3.png", height = 480, width = 480)
  dev.off()
  cat(":) Plot3.png is in current directory.")
}

