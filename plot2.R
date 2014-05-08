
## import only data from 2/1/2007 and 2/2/2007
dat = read.table("household_power_consumption.txt",sep=";", skip=66637, nrow=2880, colClasses=c("character","character",NA,NA,NA,NA,NA,NA,NA),col.names=c("date","time","gb_act","gb_react","voltage","gb_intensity","sub1","sub2","sub3"))

## set data of 
## convert Date and Time
dat$n.date = as.Date(dat$date,"%d/%m/%Y")
dt = paste(dat$date,dat$time)
dat$n.time = strptime(dt, format = "%d/%m/%Y %H:%M:%S")
dat$date = dat$time = NULL

## create plot2
png("plot2.png", width = 480, height = 480, unit = "px")
plot(dat$n.time,dat$gb_act, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()