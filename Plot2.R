data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'") ## Read the relevant dates using read.csv.sql function from sqldf package
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") ## Covert the Time field to date-time format
png(filename = "Plot2.png", width = 480, height = 480, units = "px", bg = "white")  ## save the chart to png file
plot(data$Time, data$Global_active_power, type = "l", ylab = "Global Active Power (killowatts)", xlab = "") ## plot the line chart with correct labels
dev.off() ## close the png file
