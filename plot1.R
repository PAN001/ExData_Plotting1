plot1 <- function() {
  # read in data
  colnames <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  library("dplyr")
  data <- read.csv("household_power_consumption.txt", col.names = colnames, sep = ";", stringsAsFactors = FALSE)
  useful <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
  
  useful$Date <- strptime(useful$Date, format = "%d/%m/%Y")
  
  # draw the plot
  useful$Global_active_power <- as.numeric(useful$Global_active_power)
  hist(useful$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
  
  dev.copy(png, file = "plot1.png")
  dev.off()
}