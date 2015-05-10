#load the data
data <- read.csv("./hpc.txt", sep=";", header=TRUE)

# merge the two dates
day1 <- data[data$Date=="1/2/2007", ]
day2 <- data[data$Date=="2/2/2007", ]
ndata <- rbind(day1, day2) 

# # convert dates to R Type
# dates <- ndata$Date
# times <- ndata$Time
# x <- paste(dates, times)
# ndata$PTime <- strptime(x, "%d/%m/%Y %H:%M:%S")

# plot no. 1 - histogram
hist(as.numeric(ndata$Global_active_power), col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# save plot as png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()