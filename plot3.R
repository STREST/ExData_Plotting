#Exploratory Data Analysis
#Coursera course
#Peer-graded Assignment: Course Project 1
#Author: Stefan xxxxxxx

#reading data from local file
raw_data <- read.csv("~/Coursera/week9/r/household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE)

#create tidy dataset:
#convert date and time
data = data.frame(matrix(nrow=nrow(raw_data),ncol=0))
data$date <- strptime(paste(raw_data$Date, raw_data$Time), "%d/%m/%Y %H:%M:%S")
#convert numeric columns
data$globalactivepower <- as.numeric(raw_data$Global_active_power)
data$globalreactivepower <- as.numeric(raw_data$Global_reactive_power)
data$voltage <- as.numeric(raw_data$Voltage)
data$globalintensity <- as.numeric(raw_data$Global_intensity)
data$submetering1 <- as.numeric(raw_data$Sub_metering_1)
data$submetering2 <- as.numeric(raw_data$Sub_metering_2)
data$submetering3 <- as.numeric(raw_data$Sub_metering_3)

#select data in domain
data_s = data[as.Date(data$date)==as.Date("2007-02-01")|as.Date(data$date)==as.Date("2007-02-02"),]

#plot3
png(filename="~/Coursera/week9/r/plot3.png", width = 480, height = 480)
plot(data_s$date,data_s$submetering1,type="l",xlab="",ylab="Energy sub metering")
lines(data_s$date,data_s$submetering2,col="red")
lines(data_s$date,data_s$submetering3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()

