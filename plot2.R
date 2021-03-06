# Load data
data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?",
                 colClasses = c(rep("character", 2), rep("numeric", 7)))

# Filter out unnecessary observations
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

# Convert Date and Time from character to POSIXlt
datetime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Open graphics device
png("plot2.png", width = 480, height = 480)

# Create graph
plot(datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()
