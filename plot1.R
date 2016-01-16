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




#plot1
#check for na values
sum(is.na(pollution$Global_active_power));
pollution$Global_active_power<-as.numeric(as.character(pollution$Global_active_power));
class(pollution$Global_active_power);

hist(pollution$Global_active_power, 
     main="Global Active Power", col="red",
     xlab="Global Active Power(kilowatts)");
dev.copy(png, file="plot1.png")


dev.off()
