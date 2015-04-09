plot2 <- function() {
  # read in data
  colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  library("dplyr")
  data <- read.csv("household_power_consumption.txt", col.names = colnames, sep = ";", stringsAsFactors = FALSE)
  useful <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  Sys.setlocale("LC_ALL","C")
  
  useful$dateTime = paste(useful$Date, useful$Time)
  useful$DateTime = strptime(useful$dateTime, format = "%d/%m/%Y %H:%M:%S")

  # draw the plot
  useful$Global_active_power <- as.numeric(useful$Global_active_power)
  plot(useful$DateTime, useful$Global_active_power, type = "o", pch = ".", xlab = "", ylab = "Global Active Power(kilowatts)")

  dev.copy(png, file = "plot2.png")
  dev.off()
}