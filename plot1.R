#Import data from csv file
hpc <- read.csv("D:/Coursera/Data Science Specialization/Exploratory Data Analysis/household_power_consumption.txt", sep=";")

#Convert Date from Factor to Date
hpc$Date <- format(hpc$Date)
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

#Create the subset with data for both dates
hpcsubsettemp <- subset(hpc, hpc$Date == "2007-2-1")
hpcsubset <- rbind(hpcsubsettemp, subset(hpc, hpc$Date == "2007-2-2"))

#plot 1
hpcsubset$Global_active_power <- as.numeric(as.character(hpcsubset$Global_active_power))
png("plot1.png", width=480, height=480)
hist(hpcsubset$Global_active_power, main="Global Active Power", col = "red", xlab="Global Active Power (kilowatts)")
dev.off()