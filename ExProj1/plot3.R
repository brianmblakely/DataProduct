# Plot3
plotData<-read.table("PlotData/CleanPlotData.txt",header = TRUE, sep= "|")
plotData$DateTime<-as.POSIXlt(plotData$DateTime)

png(filename='PlotData/plot3.png',width=480,height=480,units='px')
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(plotData$DateTime,plotData$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(plotData$DateTime,plotData$SubMetering2,col=lncol[2])
lines(plotData$DateTime,plotData$SubMetering3,col=lncol[3])
legend('topright',legend=lbls,col=lncol,lty='solid')
x<-dev.off()

