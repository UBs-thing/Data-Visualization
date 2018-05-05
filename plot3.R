plot1 <- read.table("household_power_consumption.txt"
                    ,sep = ";"
                    ,colClasses=c("character", "character", rep("numeric",7))
                    ,header = TRUE,na = "?"
                  )
plot1 <- plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]
plot1$Time <- strptime(paste(plot1$Date, plot1$Time), "%d/%m/%Y %H:%M:%S")
plot1$Date <- as.Date(plot1$Date, "%d/%m/%Y")
png(file = "plot3.png")
with(plot1,plot(Time,Sub_metering_1,col = "black",ylab = "Energy Sub metering",xlab="",type = "l"))
lines(plot1$Time,plot1$Sub_metering_2,col = "red")
lines(plot1$Time,plot1$Sub_metering_3,col = "blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)
dev.off()
