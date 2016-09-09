data <- read.csv("D:/exploratory/exdata/household_power_consumption.txt",sep=";")  #Read file
data[data=="?"]=NA          #NA Replacement
data <-  na.omit(data)      #omit NA

#Data Transformation
data$Date <-strptime(data$Date,"%d/%m/%Y")
data$Date <- as.Date(data$Date)

#------------------------------------------------------------------------------------

# Data Subsetting
df <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
df$Time <- strptime(df$Time,"%H:%M:%S")

#------------------------------------------------------------------------------------
# data type conversions
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Voltage <- as.numeric(as.character(df$Voltage))

# for for plotting Multiple plots
par(mfrow=c(2,2))
par(mar=c(4,4,2,1))

# Plotting
plot(df$Global_active_power,type="l",ylab = "Global Active Power(kilowatts)", xaxt='n',xlab ="")
axis(1,at=c(0,1500,2900),labels=c("Thu", "Fri", "Sat"))

plot(df$Voltage,type="l",ylab = "Voltage",xlab = "datetime", xaxt='n')
axis(1,at=c(0,1500,2900),labels=c("Thu", "Fri", "Sat"))

plot(df$Sub_metering_1,type="l", xaxt='n',ylab = "Energy Sub Metering",xlab ="")
lines(df$Sub_metering_2,type="l",col="red", xaxt='n')
lines(df$Sub_metering_3,type="l",col="blue", xaxt='n')
axis(1,at=c(0,1500,2900),labels=c("Thu", "Fri", "Sat"))

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"),cex = 0.2)

df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
plot(df$Global_reactive_power,type="l",ylab = "Global_Reactive_Power",xlab = "datetime", xaxt='n')
axis(1,at=c(0,1500,2900),labels=c("Thu", "Fri", "Sat"))


#saving as PNG File
dev.copy(png,"D:/plot4.png",height = 480,width=480)
dev.off()
