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




#plot2
library(lubridate)
pollution$Date<-as.Date(pollution$Date, "%d/%m/%Y")
class(pollution$Date)

with(pollution, plot(Global_active_power,ylab="Global Active Power(kilowatts)", 
                     type="l", xaxt="n", xlab = ""));
#customized axis
axis(1, at=c(0,1500,2900), labels=c("Thu","Fri", "Sat"))
dev.copy(png, file="plot2.png")


dev.off()
