
##Downloading zip into tempfile and opening dataset

temp<-tempfile()
getzp<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(getzp, temp)

dta<-read.table(unz(temp, "household_power_consumption.txt"), header=TRUE, sep=";", na.strings="?")

##subsetting data
sb_dta<-subset(dta, Date=="1/2/2007" | Date=="2/2/2007")



##Plot 3

png(filename="plot3.png", width=480, height=480)

   plot(ex_time, sb_dta$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
      lines(ex_time, sb_dta$Sub_metering_2, col="red")
      lines(ex_time, sb_dta$Sub_metering_3, col="blue")
   legend("topright", lwd=2, col=c("black","red", "blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))

dev.off()