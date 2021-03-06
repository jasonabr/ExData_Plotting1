power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
power.sub <- subset(power, Date=="1/2/2007" | Date=="2/2/2007", select=c("Date","Time", "Global_active_power"))
GlobalActivePower <- as.numeric(power.sub$Global_active_power)
DT <- with(power.sub, paste(Date, Time))
DT <- strptime(DT, "%d/%m/%Y %H:%M:%S")
png(filename="Plot2.png", width=480, height=480, units="px")
plot(DT, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

