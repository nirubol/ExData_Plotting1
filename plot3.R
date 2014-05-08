
## import only data from 2/1/2007 and 2/2/2007
dat = read.table("household_power_consumption.txt",sep=";", skip=66637, nrow=2880, colClasses=c("character","character",NA,NA,NA,NA,NA,NA,NA),col.names=c("date","time","gb_act","gb_react","voltage","gb_intensity","sub1","sub2","sub3"))

## set data of 
## convert Date and Time
dat$n.date = as.Date(dat$date,"%d/%m/%Y")
dt = paste(dat$date,dat$time)
dat$n.time = strptime(dt, format = "%d/%m/%Y %H:%M:%S")
dat$date = dat$time = NULL

## create plot3
png("plot3.png", width = 480, height = 480, unit = "px")
plot(dat$n.time,dat$sub1, type = "l",ylab = "Energy sub metering", xlab = "")
points(dat$n.time,dat$sub2, type = "l", col = "red")
points(dat$n.time,dat$sub3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()