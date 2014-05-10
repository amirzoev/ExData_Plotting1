data<-read.csv2('household_power_consumption.txt',na.strings="?",colClasses='character')
DT<-paste(data$Date, data$Time)
data$DT<-strptime(DT,format='%d/%m/%Y %H:%M:%S')
data$Date<-strptime(data$Date,format='%d/%m/%Y')
days<-c(as.POSIXlt("2007-02-01"), as.POSIXlt("2007-02-02"))
fdata<-data[data$Date %in% days,]
png(file='plot4.png',width=480,height=480)
par(mfrow=c(2,2))
with(fdata,{
  plot(DT,as.numeric(Global_active_power),type='l',xlab='',ylab='Global Active Power')
  plot(DT,as.numeric(Voltage),type='l',xlab='datetime',ylab='Voltage')
  plot(fdata$DT,as.numeric(fdata$Sub_metering_1),type='l',xlab='',ylab='Energy sub metering')
  lines(fdata$DT,as.numeric(fdata$Sub_metering_2),type='l',xlab='',col='red')
  lines(fdata$DT,as.numeric(fdata$Sub_metering_3),type='l',xlab='',col='blue') 
  legend("topright",lwd=1,col=c('black','red','blue'), legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),bty='n')
  plot(DT,as.numeric(Global_reactive_power),type='l',xlab='datetime',ylab='Global_reactive_power')
  
})
dev.off()
