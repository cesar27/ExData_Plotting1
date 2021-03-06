## Complete dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"') ##2,075,259 obs of 9 vars
head(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ##Date format

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) ##Selected date. Give us 2,880 obs. of 10 vars

#Plot 2
plot(data_sub$Global_active_power~data_sub$Datetime, xlab="",ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png, file="plot2.png", height=480, width=480) ## Saving to PNG file
dev.off()
