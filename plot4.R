## Complete dataset
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F, comment.char="", quote='\"') ##2,075,259 obs of 9 vars
head(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ##Date format

data_sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) ##Selected date. Give us 2,880 obs. of 10 vars

#Plot 4
par(mfrow=c(2,2), mar=c(5,5,2,1))
with(data_sub, 
    {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Energy Sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power",xlab="datetime")
    }
)
dev.copy(png, file="plot4.png", height=480, width=480)  ## Saving to PNG file
dev.off()
