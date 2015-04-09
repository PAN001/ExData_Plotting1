plot1 <- function() {
  # read in data
  colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  library("dplyr")
  data <- read.csv("household_power_consumption.txt", col.names = colnames, sep = ";", stringsAsFactors = FALSE)
  useful <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  useful$dateTime = paste(useful$Date, useful$Time)
  useful$DateTime = strptime(useful$dateTime, format = "%d/%m/%Y %H:%M:%S")

  Sys.setlocale("LC_ALL","C")
  
  # draw the plot
  useful$Sub_metering_1 <- as.numeric(useful$Sub_metering_1)
  useful$Sub_metering_2 <- as.numeric(useful$Sub_metering_2)
  useful$Sub_metering_3 <- as.numeric(useful$Sub_metering_3)

  par(mfrow = c(2,2))
  
  # draw the first plot
  useful$Global_active_power <- as.numeric(useful$Global_active_power)
  plot(useful$DateTime, useful$Global_active_power, type = "o", pch = ".",xlab = "", ylab = "Global Active Power")
  
  # draw the second plot
  useful$Voltage <- as.numeric(useful$Voltage)
  plot(useful$DateTime, useful$Voltage, type = "o", pch = ".", xlab = "datetime", ylab = "Voltage")
  
  # draw the third plot
  useful$Sub_metering_1 <- as.numeric(useful$Sub_metering_1)
  useful$Sub_metering_2 <- as.numeric(useful$Sub_metering_2)
  useful$Sub_metering_3 <- as.numeric(useful$Sub_metering_3)
  plot(useful$DateTime, useful$Sub_metering_1, type = "o", pch = ".", xlab = "", ylab = "Energy sub metering")
  points(useful$DateTime, useful$Sub_metering_2, type = "o", pch = ".", col = "Red")
  points(useful$DateTime, useful$Sub_metering_3, type = "o", pch = ".", col = "Blue")
  # add legend
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "-", col = c("Black", "Red", "Blue"), cex = 0.5)
  
  # draw the forth plot
  useful$Global_reactive_power <- as.numeric(useful$Global_reactive_power)
  plot(useful$DateTime, useful$Global_reactive_power, type = "o", pch = ".", xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.copy(png, file = "plot4.png")
  dev.off()
}