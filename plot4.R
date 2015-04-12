#For create plot4.png please write: plot4("household_power_consumption.txt")

plot4 <- function(file) {
  data <- read.table(file, sep = ";", header = TRUE)
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  df <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  
  df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
  df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
  df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
  df$Voltage <- as.numeric(as.character(df$Voltage))
  
  #df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  #-------------------------------------------------------------------------------------
  par(mfrow=c(2,2))
  par(mar = c(4, 4, 2, 4))
  #1-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
  #2-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Voltage, type="l", xlab="datetime", ylab="Voltage")
  #3-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
  lines(df$timestamp,df$Sub_metering_2,col="red")
  lines(df$timestamp,df$Sub_metering_3,col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  #4-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  #-------------------------------------------------------------------------------------
  dev.copy(png, file="plot4.png", height = 480, width = 480)
  dev.off()
  cat(":) Plot4.png is in current directory.")
}

