# Reading and subsetting data
activepower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(activepower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(activepower,activepower$Date=="1/2/2007" | activepower$Date =="2/2/2007")

# creating date for x-axis
str(subpower)
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subpower$Global_active_power)

# plotting
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="line", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()