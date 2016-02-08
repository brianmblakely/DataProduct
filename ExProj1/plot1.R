
# Plot1

plotData<-read.table("PlotData/CleanPlotData.txt",header = TRUE, sep= "|")
png(filename='PlotData/plot1.png',width=480,height=480,units='px')
hist(plotData$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red')
x<-dev.off()
