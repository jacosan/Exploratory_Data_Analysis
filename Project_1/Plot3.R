## Jacobo Sanchez
## Exploratory Data Analysis Course - Data Science Specialization
## December 2014

## Project 1 - Plot 3

# Function loads the required file
loadData <- function() {
        # If the ZIP input file is not present, download it
        if(!file.exists("household_power_consumption.zip")) {
                fileUrl <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
                download.file(fileUrl, method="curl", destfile="household_power_consumption.zip")
                unzip("household_power_consumption.zip")
        }
}
loadData()

## Load & name comlums of relevant data 
HPC <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep = ";", na.strings = "?")
colnames(HPC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

## Format Date - Time 
Date_Time <- paste (HPC$Date, HPC$Time, sep ="")
HPC$Date_Time <- strptime (Date_Time, "%d/%m/%Y %H:%M:%S")


# Plotting
png (filename= "Plot3.png", width = 480, height = 480, units = "px")
plot (HPC$Date_Time, HPC$Sub_metering_1, 
        type = "l",
        ylab = "Energy sub metering",
        xlab = "")       
        lines(HPC$Date_Time, HPC$Sub_metering_2, type = "l", col = "red")
        lines(HPC$Date_Time, HPC$Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()




