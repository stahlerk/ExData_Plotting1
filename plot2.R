##Downloading zip into tempfile and opening dataset

temp<-tempfile()
getzp<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(getzp, temp)

dta<-read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")

##subsetting data
sb_dta<-subset(dta, Date=="1/2/2007" | Date=="2/2/2007")

##Plot 2

##Step 1: paste "date" and "time" columns together and make a new exact time variable (ex_time)
ex_time<-strptime(paste(sb_dta$Date, sb_dta$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

##Step 2: plot active power against exact time
png(filename="plot2.png", width=480, height=480)

   plot(ex_time, sb_dta$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") 

dev.off()