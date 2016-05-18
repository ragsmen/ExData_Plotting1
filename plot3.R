#Import data from csv file
hpc <- read.csv("D:/Coursera/Data Science Specialization/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#Convert Date from Factor to Date
hpc$Date <- format(hpc$Date)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#Create the subset with data for both dates
hpcsubsettemp <- subset(hpc, hpc$Date == "2007-2-1")
hpcsubset <- rbind(hpcsubsettemp, subset(hpc, hpc$Date == "2007-2-2"))

#plot 3
hpcsubset$DateTime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), "%Y-%m-%d %H:%M:%S")
png("plot3.png", width=480, height=480)
plot(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Sub_metering_1)),type='l', ylab ="Energy sub metering", xlab="")
lines(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Sub_metering_2)),type='l', col='red')
lines(hpcsubset$DateTime, hpcsubset$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()

#plot 4
png("plot4.png", width=480, height=480)

par(mfcol=c(2,2))

plot(hpcsubset$DateTime, hpcsubset$Global_active_power, type='l',ylab="Global Active Power (Kilowatts)", xlab="")

plot(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Sub_metering_1)),type='l', ylab ="Energy sub metering", xlab="")
lines(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Sub_metering_2)),type='l', col='red')
lines(hpcsubset$DateTime, hpcsubset$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))

plot(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Voltage)),type='l', ylab="Voltage",xlab="datetime" )

plot(hpcsubset$DateTime, as.numeric(as.character(hpcsubset$Global_reactive_power)),type='l', ylab="Global_reactive_power",xlab="datetime" )

dev.off()