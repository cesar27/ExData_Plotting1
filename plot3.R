## Complete dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"') ##2,075,259 obs of 9 vars
head(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ##Date format

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) ##Selected date. Give us 2,880 obs. of 10 vars

#Plot 3
with(data_sub, {
  plot(Sub_metering_1~Datetime, type="l",ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='red')
  lines(Sub_metering_3~Datetime,col='blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1,
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480) ## Saving to PNG file
dev.off()
