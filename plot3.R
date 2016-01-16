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



#plot 3
par(mfcol=c(1,1))

with(pollution, plot(Sub_metering_1, ylab="Energy sub metering",
                     type="l", xaxt="n", xlab = ""))
with(pollution, lines(Sub_metering_2, col="red"))
with(pollution, lines(Sub_metering_3, col="blue"))
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
legend("topright", pch= "-" ,col=c("black","red","blue"),
       legend= c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))



dev.copy(png, file="plot3.png")


dev.off()
