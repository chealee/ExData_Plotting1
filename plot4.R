#project1

setwd("~/DataScience/04 ExploratoryDataAnalysis/project/project1/exdata-data-household_power_consumption")

install.packages("sqldf")
require(sqldf)
pollution <- read.csv.sql("household_power_consumption.txt", sep=";", 
             stringsAsFactors = FALSE, header=TRUE,
             "select * from file where Date = '1/2/2007' or Date = '2/2/2007'")
#2880obs 9var

#subset 2007-02-01 to 2007-02-02
#subData <- subset(household_power_consumption, Date == '1/2/2007' |  Date == '2/2/2007');

View(pollution);




#plot 4
par(mfcol=c(2,2))
#par(mar=c(5,3,2,2)+0.1)
#png("./plot4.png",  width = 480, height = 480)


with(pollution, {
  #plot1
  plot(Global_active_power,ylab="Global Active Power(kilowatts)", 
                       type="l", xaxt="n", xlab = "")
  axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
  
  #plot2
  plot(Sub_metering_1, ylab="Energy sub metering",
       type="l", xaxt="n", xlab = "")
  lines(Sub_metering_2, col="red")
  lines(Sub_metering_3, col="blue")
  axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
  legend(x=1800,y=50, pch= "-" ,col=c("black","red","blue"),
         legend= c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
         inset=c(-0.2,0), cex = 0.5, pt.cex=2,y.intersp = 0.55, bty = "n")
  #cex =0.5 pt.cex and title.cex
  #click location of legend use locator(1) instead of topright
 
  #plot3
  plot(Voltage, type="l", xaxt="n",xlab="datetime")
  axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
  
  #plot4
  plot(Global_reactive_power, type="l", xaxt="n",xlab="datetime")
  axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
})


dev.copy(png, file="plot4.png")
dev.off()
