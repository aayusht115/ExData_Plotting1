plot2 <- function(){
      
        reqdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        #column in table with date and time merged together
        FullTimeDate <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        reqdata <- cbind(reqdata, FullTimeDate)
        
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
        
        #subset data from 2007-02-01 and 2007-02-02
        subsetdata <- subset(reqdata, Date == "2007-02-01" | Date =="2007-02-02")
        
        # plot globalactivepower vs date&time
        png("plot2.png", width=480, height=480)
        with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))
        dev.off()
}
