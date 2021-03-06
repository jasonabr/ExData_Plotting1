power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007")
SM1 <- as.numeric(power.sub$Sub_metering_1)
SM2 <- as.numeric(power.sub$Sub_metering_2)
SM3 <- as.numeric(power.sub$Sub_metering_3)
DT <- with(power.sub, paste(Date, Time))
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")
png(filename="Plot3.png", width=480, height=480, units="px")
plot(DT, SM1, type="l", xlab="", ylab="Energy sub metering")
lines(DT, SM2, type="l", col="red")
lines(DT, SM3, type="l", col="blue")
varnames <- names(power.sub[,7:9])
color <- c("black", "red", "blue")
legend("topright",lty=c(1,1,1), legend=varnames, col=color)
dev.off()
