#Import data from csv file
hpc <- read.csv("D:/Coursera/Data Science Specialization/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#Convert Date from Factor to Date
hpc$Date <- format(hpc$Date)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#Create the subset with data for both dates
hpcsubsettemp <- subset(hpc, hpc$Date == "2007-2-1")
hpcsubset <- rbind(hpcsubsettemp, subset(hpc, hpc$Date == "2007-2-2"))

#plot 2
hpcsubset$DateTime <- strptime(paste(hpcsubset$Date, hpcsubset$Time), "%Y-%m-%d %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(hpcsubset$DateTime, hpcsubset$Global_active_power, type='l',ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()
