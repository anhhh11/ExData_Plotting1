source("readData.R")
#Plot1
par(mfrow=c(1,1))
hist(data$Global_active_power,
     main="Global active power",
    xlab="Global active power (kilowatts)",
    col="red")
dev.copy(png,"figure/plot1.png",width=480,height=480)
dev.off()
