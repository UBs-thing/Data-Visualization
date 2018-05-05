plot1 <- read.table("household_power_consumption.txt"
                    ,sep = ";"
                    ,colClasses=c("character", "character", rep("numeric",7))
                    ,header = TRUE,na = "?"
)
plot1 <- plot1[plot1$Date %in% c("1/2/2007","2/2/2007"),]
plot1$Time <- strptime(paste(plot1$Date, plot1$Time), "%d/%m/%Y %H:%M:%S")
plot1$Date <- as.Date(plot1$Date, "%d/%m/%Y")
png(file = "plot1.png")
with(plot1,hist(Global_active_power,xlab = "Global Active Power(kilowatts)",main = "Global Active Power",col = "red"))
dev.off()