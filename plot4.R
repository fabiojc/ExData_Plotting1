plot4 <- function()
{       
        ## SPECIAL INSTRUCTIONS
        ## Please set your working directory to the folder where the file
        ## "household_power_consumption.txt" is and save this R script
        ## in the same folder before running it.
        
        ## This instruction will read the file indicated, while filtering 
        ## just the lines in the dates 2007/02/01 and 2007/02/02.
        file <- read.table("household_power_consumption.txt", header=FALSE, 
                           sep=";", na.strings = "?", skip=66637, nrows=2880, 
                           col.names=c("Date", "Time", "Global_active_power", 
                                       "Global_reactive_power", "Voltage",
                                       "Global_intensity", "Sub_metering_1", 
                                       "Sub_metering_2", "Sub_metering_3"))
        
        ## Joining the date and time columns as one and formatting it as a
        ## full Date
        file$Date <- paste(file$Date, file$Time)
        file$Date <- strptime(file$Date, format="%d/%m/%Y %H:%M:%S")
        file$Time <- NULL
        
        png(filename = "plot4.png", width = 480, height = 480, 
            units = "px", bg = "white")
        
        par(mfrow = c(2,2))
        
        ## First chart (first row, first column)
        plot(file$Date, file$Global_active_power, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        
        ## Second chart (first row, second column)
        plot(file$Date, file$Voltage, type="l", 
             ylab="Voltage", xlab="datetime")
        
        ## Third chart (second row, first column)
        plot(file$Date, file$Sub_metering_1, type="l", 
             ylab="Energy sub metering", xlab="")
        lines(file$Date, file$Sub_metering_2, type="l", col="red")
        lines(file$Date, file$Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, col=c("black", "red", "blue"), 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               bty="n")
        
        ## Fourth chart (second row, second column)
        plot(file$Date, file$Global_reactive_power, type="l", 
             ylab="Global_reactive_power", xlab="datetime")
        
        
        dev.off()
        message("File plot4.png created in the working directory.")
}