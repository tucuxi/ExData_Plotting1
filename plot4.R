# Load data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))

# Filter out unnecessary observations
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time from character to POSIXlt
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Open graphics device
png("plot4.png", width = 480, height = 480)

# Create graph
par(mfrow = c(2,2))

with(data, {
  # topleft
  plot(datetime, Global_active_power, type = "l",
       xlab = "", ylab = "Global Active Power")

  # topright
  plot(datetime, Voltage, type = "l")

  # bottomleft
  plot(datetime, Sub_metering_1, type = "n",
       xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_1, col = "black")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
  legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  # bottomright
  plot(datetime, Global_reactive_power, type = "l")
})

# Close graphics device
dev.off()
