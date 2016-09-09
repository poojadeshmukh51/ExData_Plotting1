data <- read.csv("D:/exploratory/exdata/household_power_consumption.txt",sep=";")  #Read file
data[data=="?"]=NA          #NA Replacement
data <-  na.omit(data)      #omit NA

#Data Transformation
data$Date <-strptime(data$Date,"%d/%m/%Y")
data$Date <- as.Date(data$Date)

#------------------------------------------------------------------------------------

#Data Subsetting
df <- subset(data,data$Date=="2007-02-01" | data$Date=="2007-02-02")
df$Time <- strptime(df$Time,"%H:%M:%S")

#------------------------------------------------------------------------------------
df$Global_active_power <- as.numeric(as.character(df$Global_active_power)) #Data Conversion to float

# Plotting
hist(df$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)")

#saving as PNG File
dev.copy(png,"D:/p.png",height = 480,width=480)
dev.off()
