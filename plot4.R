# load the data
data <- read.csv("./hpc.txt", sep=";", header=TRUE)

# merge the two dates
day1 <- data[data$Date=="1/2/2007", ]
day2 <- data[data$Date=="2/2/2007", ]
ndata <- rbind(day1, day2) 

# convert dates to R Type
dates <- ndata$Date
times <- ndata$Time
x <- paste(dates, times)
ndata$PTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# plot no. 4 - multiple plots
par(mfcol = c(2,2))

# Global Active Power
plot(ndata$PTime, ndata$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Energy Sub Metering
ndata$SubMeter1 <- as.character(ndata$Sub_metering_1)
ndata$SubMeter2 <- as.character(ndata$Sub_metering_2)
ndata$SubMeter3 <- as.character(ndata$Sub_metering_3)
plot(ndata$PTime, ndata$SubMeter1, type="l",
     xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(ndata$PTime, ndata$SubMeter2, col="red")
lines(ndata$PTime, ndata$SubMeter3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Voltage
plot(ndata$PTime, as.character(ndata$Voltage), type="l",
     xlab="datetime", ylab="Voltage")

# Global Reactive Power
plot(ndata$PTime, as.character(ndata$Global_reactive_power), type="l",
     xlab="datetime", ylab="Global_reactive_power", ylim=c(0, 0.5))

# save plot as png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()