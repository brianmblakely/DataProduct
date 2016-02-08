

# Plot2
plotData<-read.table("PlotData/CleanPlotData.txt",header = TRUE, sep= "|")
plotData$DateTime<-as.POSIXlt(plotData$DateTime)
png(filename='PlotData/plot2.png',width=480,height=480,units='px')
plot(plotData$DateTime,plotData$GlobalActivePower,ylab='Global Active Power (kilowatts)', xlab='', type='l')
x<-dev.off()
