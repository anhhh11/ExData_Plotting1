source("readData.R")
#Plot 2
plot(x=data$DateTime,y=data$Global_active_power,type="line",
     ylab="Global Active Power (kilowatt)",
     xlab="")
dev.copy(png,"figure/plot2.png",width=480,height=480)
dev.off()
