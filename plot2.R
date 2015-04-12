##For create plot2.png please write: plot2("household_power_consumption.txt")

plot2 <- function(file) {
  data <- read.table(file, sep = ";", header = TRUE)
  data$Date <- as.Date(data$Date, format="%d/%m/%Y")
  df <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"),]
  df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
  df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
  ##-------------------------------------------------------------------------------------
  plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  ##-------------------------------------------------------------------------------------
  dev.copy(png, file="plot2.png", height = 480, width = 480)
  dev.off()
  cat(":) Plot2.png is in current directory.")
}

