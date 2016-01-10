################################################################################################################################## 
#                                 Coursera - Exploratory Data Analysis - Assignment 1                                            #
#  Author:      H van Rensburg                                                                                                   #
#  Date:        10/01/2016                                                                                                       #
#  Platform:    Rstudio Version 0.99.491   (Windows 8)                                                                           #
#--------------------------------------------------------------------------------------------------------------------------------#
#                                               Steps Followed                                                                   #
#  Step 0: Extract and unzip the the dataset                                                                                     #
#  Step 1: Import dataset                                                                                                        #
#  Step 2: Create the diagram                                                                                                    #
#                                                                                                                                #
################################################################################################################################## 

#-------------------------------------------------------------------------------------------------------------#
## Step 0: Extract and unzip the the dataset                                                                 ##
#-------------------------------------------------------------------------------------------------------------#
  # Set your working directory
setwd("C:/Users/hvanrensburg/Documents/R/WD/Assignment 1")


  # Check if the file has been unzipped before commencing
if(!file.exists("./data")){
  dir.create("./data")
}
  # Unzip the downloaded file
if(!file.exists("./data/household_power_consumption.txt")){
  unzip(zipfile="./exdata-data-household_power_consumption.zip",exdir="./data")
}

#-------------------------------------------------------------------------------------------------------------#
## Step 1: Import dataset                                                                                    ##
#-------------------------------------------------------------------------------------------------------------#
  # Set working directory
setwd("./data") 

  # Import the datasets
HousePowerCons      <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)  

  # Decrease the size of the dataset by only selecting the required dates
NewData <- subset(HousePowerCons,Date == "1/2/2007"|Date == "2/2/2007")

#-------------------------------------------------------------------------------------------------------------#
## Step 2: Create the diagram                                                                                ##
#-------------------------------------------------------------------------------------------------------------#
  # Create the .png file
png("plot3.png", width=480, height=480)

  # Create the required variables
DateTime <- strptime(paste(NewData$Date, NewData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
SubMet_1 <- as.numeric(NewData$Sub_metering_1)
SubMet_2 <- as.numeric(NewData$Sub_metering_2)
SubMet_3 <- as.numeric(NewData$Sub_metering_3)

  # Create the diagram
plot(DateTime,SubMet_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(DateTime,SubMet_2, type = "l", col = "red")
lines(DateTime,SubMet_3, type = "l", col = "blue")
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), col = c("black","red","blue"), lty = 1, lwd = 2)

  # Close the .png file 
dev.off()
