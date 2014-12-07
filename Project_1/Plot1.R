## Jacobo Sanchez
## Exploratory Data Analysis Course - Data Science Specialization
## December 2014

## Project 1 - Plot 1

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

## Load & format relevant data 
HPC <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep = ";", na.strings = "?")
colnames(HPC) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Plotting
png(filename= "Plot1.png", width = 480, height = 480, units = "px")
hist (HPC$Global_active_power, 
      main = "Global Active Power", 
      xlab = "Global Active Power (Kilowatts)", 
      col = "red")
dev.off()

