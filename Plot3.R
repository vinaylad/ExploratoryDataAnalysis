data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'") ## Read the relevant dates using read.csv.sql function from sqldf package
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") ## Covert the Time field to date-time format
png(filename = "Plot3.png", width = 480, height = 480, units = "px", bg = "white")  ## save the chart to png file
plot(data$Time, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black") ## plot the line chart with correct labels
lines(data$Time, data$Sub_metering_2, type="l", col = "red") ## Add trend line for Sub_metering_2 with red color
lines(data$Time, data$Sub_metering_3, type="l", col = "blue") ## Add trend line for Sub_metering_3 with blue color
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75) ## Add legend to the chart
dev.off() ## close the png file
