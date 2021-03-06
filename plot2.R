download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./hpc.zip")
unzip("./hpc.zip",exdir=".")
fullhpc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
hpc<-subset(fullhpc,strptime(Date,"%d/%m/%Y") %in% c("2007-02-01","2007-02-02"))
xstart<-as.POSIXct(strptime("2007-02-01","%Y-%m-%d"))
xend<-as.POSIXct(strptime("2007-02-03","%Y-%m-%d"))
xrange<-c(xstart,xend)
png(filename="./plot2.png",width=480,height=480,units="px")
plot(strptime(paste(as.character(hpc$Date),as.character(hpc$Time),sep=" "),"%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(hpc$Global_active_power)),xlim=xrange,type="l",
     ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
