#Defining Column Classes
classes <- c("character", "character", rep("numeric",7))

#Reading Data
data <- read.table("household_power_consumption.txt", header = TRUE, colClasses = classes, na.strings=c("?"), sep=";")

#Subsetting Required Data
dat <- data[data[,1] %in% c("1/2/2007", "2/2/2007"),]

#Creating DateTime Variable
dat$DateTime <- paste(dat$Date, dat$Time, sep = " ")

#Converting DateTime format
dat$DateTime <- strptime(dat$DateTime, "%d/%m/%Y %H:%M:%S")

#plot 3
png(filename="plot3.png", width = 480, height = 480)
plot(dat$DateTime, dat$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy Sub Metering")
lines(dat$DateTime, dat$Sub_metering_2, col = "red")
lines(dat$DateTime, dat$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"))
dev.off()