data<-read.csv2('household_power_consumption.txt',na.strings="?",colClasses='character')
DT<-paste(data$Date, data$Time)
data$DT<-strptime(DT,format='%d/%m/%Y %H:%M:%S')
data$Date<-strptime(data$Date,format='%d/%m/%Y')
days<-c(as.POSIXlt("2007-02-01"), as.POSIXlt("2007-02-02"))
fdata<-data[data$Date %in% days,]
png(file='plot2.png',width=480,height=480)
plot(fdata$DT,as.numeric(fdata$Global_active_power),type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()