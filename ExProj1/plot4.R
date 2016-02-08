# Plot 4
plotData<-read.table("PlotData/CleanPlotData.txt",header = TRUE, sep= "|")
plotData$DateTime<-as.POSIXlt(plotData$DateTime)

png(filename='PlotData/plot4.png',width=480,height=480,units='px')

# create frames
par(mfrow=c(2,2))

# plot top left (1,1)
plot(plotData$DateTime,plotData$GlobalActivePower,ylab='Global Active Power',xlab='',type='l')

# plot top right (1,2)
plot(plotData$DateTime,plotData$Voltage,xlab='datetime',ylab='Voltage',type='l')

# plot bottom left (2,1)
lncol<-c('black','red','blue')
lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
plot(plotData$DateTime,plotData$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering')
lines(plotData$DateTime,plotData$SubMetering2,col=lncol[2])
lines(plotData$DateTime,plotData$SubMetering3,col=lncol[3])

# plot data on bottom right (2,2)
plot(plotData$DateTime,plotData$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')

# close
x<-dev.off()