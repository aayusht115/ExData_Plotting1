plot4 <- function() {
        
        # read data
        reqdata <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )
        
        # column in table with date and time merged
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
        
        # subset data from 2007-02-01 and 2007-02-02
        subsetdata <- subset(reqdata, Date == "2007-02-01" | Date =="2007-02-02")
        
        # 4 graphs
        png("plot4.png", width=480, height=480)
        par(mfrow=c(2,2))
        with(subsetdata, plot(FullTimeDate, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
        with(subsetdata, plot(FullTimeDate, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
        with(subsetdata, plot(FullTimeDate, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
        lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_2,type="l", col= "red")
        lines(subsetdata$FullTimeDate, subsetdata$Sub_metering_3,type="l", col= "blue")
        legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
        with(subsetdata, plot(FullTimeDate, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
        dev.off()
}
