data <- read.csv.sql("household_power_consumption.txt",header=TRUE,sep=";", sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'") ## Read the relevant dates using read.csv.sql function from sqldf package
png(filename = "Plot1.png", width = 480, height = 480, units = "px", bg = "white")  ## save the chart to png file
hist(data$Global_active_power, breaks = c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9), col = "red", xlab = "Global Active Power (killowatts)", main = "Global Active Power", xlim = c(0,6), ylim = c(0,1200)) ## plot the histogram with correct breaks and labels
dev.off() ## close the png file
