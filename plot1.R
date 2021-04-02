plot1<- function()
        
        reqdata <- read.csv("C:/Users/HP/Downloads/quiz1_data/exdata_data_household_power_consumption", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

# change class of all columns to required class
reqdata$Date <- as.Date(reqdata$Date, format="%d/%m/%Y")
reqdata$Time <- format(reqdata$Time, format="%H:%M:%S")
reqdata$Global_active_power <- as.numeric(reqdata$Global_active_power)
reqdata$Global_reactive_power <- as.numeric(reqdata$Global_reactive_power)
reqdata$Voltage <- as.numeric(reqdata$Voltage)
reqdata$Global_intensity <- as.numeric(reqdata$Global_intensity)
reqdata$Sub_metering_1 <- as.numeric(reqdata$Sub_metering_1)
reqdata$Sub_metering_2 <- as.numeric(reqdata$Sub_metering_2)
reqdata$Sub_metering_3 <- as.numeric(reqdata$Sub_metering_3)

# subset data from 2007-02-01 and 2007-02-02
subsetdata <- subset(reqdata, Date == "2007-02-01" | Date =="2007-02-02")

# plot histogram of global active power for 2 days
png("plot1.png", width=480, height=480)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
}
