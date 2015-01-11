##Downloading zip into tempfile and opening dataset
temp<-tempfile()
getzp<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(getzp, temp)

dta<-read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")

##subsetting data
sb_dta<-subset(dta, Date=="1/2/2007" | Date=="2/2/2007")

##Plot 1

png(filename="plot1.png", width=480, height=480)
   
    hist(sb_dta$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()