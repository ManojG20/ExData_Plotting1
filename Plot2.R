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

#plot 2
png(filename="plot2.png", width = 480, height = 480)
plot(dat$DateTime, dat$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
dev.off()
