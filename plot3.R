source("readData.R")
#Plot 3
with(data,plot(x=DateTime,Sub_metering_1,type="line",col="black",
               ylab="Energy sub metting"))
lines(data$DateTime,data$Sub_metering_2,type="line",col="red")
lines(data$DateTime,data$Sub_metering_3,type="line",col="blue")
legend("topright",legend=c("Sub_metting_1","Sub_metting_2","Sub_metting_3"),
       lty=rep(1,3),
       col=c("black","red","blue"))
dev.copy(png,"figure/plot3.png",width=480,height=480)
dev.off()
