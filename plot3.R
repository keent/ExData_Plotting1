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

# plot no. 3 - time series of Energy sub metering 1 to 3

# convert Factor to character to properly plot
ndata$SubMeter1 <- as.character(ndata$Sub_metering_1)
ndata$SubMeter2 <- as.character(ndata$Sub_metering_2)
ndata$SubMeter3 <- as.character(ndata$Sub_metering_3)

plot(ndata$PTime, ndata$SubMeter1, type="l",
      xlab="Time", ylab="Energy sub metering", ylim=c(0,40))

# annotate
lines(ndata$PTime, ndata$SubMeter2, col="red")
lines(ndata$PTime, ndata$SubMeter3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save plot as png
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()