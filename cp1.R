##Course project 1
cp1 <- read.table("C:/Users/mpastur/Desktop/test/household_power_consumption.txt", header= TRUE, sep=";")
cp2 <- subset(cp1, cp1$Date == "1/2/2007" | cp1$Date == "2/2/2007")
DateTime <- paste(cp2$Date,cp2$Time)
cp2$Date <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")
cp3 <- select(cp2, -Time)
cp3$Global_active_power <- as.numeric(cp3$Global_active_power)
cp3$Sub_metering_1 <- as.numeric(cp3$Sub_metering_1)
cp3$Sub_metering_2 <- as.numeric(cp3$Sub_metering_2)
cp3$Sub_metering_3 <- as.numeric(cp3$Sub_metering_3)
cp3$Voltage <- as.numeric(cp3$Voltage)
cp3$Global_intensity <- as.numeric(cp3$Global_intensity)

par(mfrow = c(1, 1))
##Chart 1 <-  Histogram
hist(cp3$Global_active_power, breaks = 12, col = "red", main = "Global Active Power", ylab="Frequency", xlab= "Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()

    
##Chart 2 <- plot
plot(cp3$Date, cp3$Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()

##Chart3 <- plot
plot(cp3$Date,cp3$Sub_metering_1, type= "n", xlab=" ", ylab="Energy sub meetering")
lines(cp3$Date,cp3$Sub_metering_1, col ="grey")
lines(cp3$Date,cp3$Sub_metering_2, col ="red")
lines(cp3$Date,cp3$Sub_metering_3, col ="blue")
legend("topright",pch="-", col = c("grey","red","blue"), legend = c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3"))
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px")
dev.off()


##Chart4
par(mfrow = c(2, 2))
with(cp3, {
        plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)")
        plot(Date, Voltage, xlab="Voltage", ylab="datetime", type="l")
        plot(cp3$Date,cp3$Sub_metering_1, type= "n", xlab=" ", ylab="Energy sub meetering")
        lines(cp3$Date,cp3$Sub_metering_1, col ="grey")
        lines(cp3$Date,cp3$Sub_metering_2, col ="red")
        lines(cp3$Date,cp3$Sub_metering_3, col ="blue")
        legend("topright",pch="-", col = c("grey","red","blue"), legend = c("Sub_meetering_1","Sub_meetering_2","Sub_meetering_3"))
        plot(Date, Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.copy(png, file = "plot4.png",width = 480, height = 480, units = "px")
dev.off()

