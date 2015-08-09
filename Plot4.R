power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")
png(filename="Plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))
#Plot 1
GlobalActivePower <- as.numeric(power.sub$Global_active_power)
DT <- with(power.sub, paste(Date, Time))
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")
plot(DT, GlobalActivePower, type="l", xlab="", ylab="Global Active Power")
#Plot 2
Voltage <- as.numeric(power.sub$Voltage)
plot(DT, Voltage, type="l", xlab="datetime", ylab="Voltage")
#Plot3
SM1 <- as.numeric(power.sub$Sub_metering_1)
SM2 <- as.numeric(power.sub$Sub_metering_2)
SM3 <- as.numeric(power.sub$Sub_metering_3)
plot(DT, SM1, type="l", xlab="", ylab="Energy sub metering")
lines(DT, SM2, type="l", col="red")
lines(DT, SM3, type="l", col="blue")
varnames <- names(power.sub[,7:9])
color <- c("black", "red", "blue")
legend("topright", bty="n", lty=c(1,1,1), legend=varnames, col=color)
#Plot4
GRP <- as.numeric(power.sub$Global_reactive_power)
plot(DT, GRP, type="l", xlab="dateime", ylab="Global_reactive_power")
dev.off()

