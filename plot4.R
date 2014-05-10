source("readData.R")
#Plot 4
par(mfrow=c(2,2))

plot(x=data$DateTime,y=data$Global_active_power,type="line",
     ylab="Global Active Power",
     xlab="date")

with(data,plot(x=DateTime,y=Voltage,type="line"))

with(data,plot(x=DateTime,Sub_metering_1,type="line",col="black",
               ylab="Energy sub metting"))
lines(data$DateTime,data$Sub_metering_2,type="line",col="red")
lines(data$DateTime,data$Sub_metering_3,type="line",col="blue")
legend("topright",c("Sub_metting_1","Sub_metting_2","Sub_metting_3"),
       lty=rep(1,3),
       col=c("black","red","blue"),cex=0.6)
with(data,plot(DateTime,Global_reactive_power,t="line"))

dev.copy(png,"figure/plot4.png",width=480,height=480)
dev.off()
