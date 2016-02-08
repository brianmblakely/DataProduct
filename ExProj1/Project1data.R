library(data.table)
library(lubridate)

# create the PlotData file works
if (!file.exists('PlotData')) {  dir.create('PlotData')}
if(!file.exists('data.zip')){
    url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
    download.file(url,destfile = "PlotData/data.zip")
}

unzip("data.zip", exdir="PlotData", overwrite=TRUE)

# Put data into a table, limiting to two days
variable.class <- c(rep('character',2),rep('numeric',7)) 
data<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings='?',colClasses=variable.class)
plotData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]


columnNames<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity',
          'SubMetering1','SubMetering2','SubMetering3')
colnames(plotData)<-columnNames
plotData$DateTime<-dmy(plotData$Date)+hms(plotData$Time)
plotData<-plotData[,c(10,3:9)]
plotData$DateTime<-as.POSIXlt(plotData$DateTime)
write.table(plotData,file='PlotData/CleanPlotData.txt',sep='|',row.names=FALSE)
