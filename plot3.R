download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./hpc.zip")
unzip("./hpc.zip",exdir=".")
fullhpc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
hpc<-subset(fullhpc,strptime(Date,"%d/%m/%Y") %in% c("2007-02-01","2007-02-02"))
xstart<-as.POSIXct(strptime("2007-02-01","%Y-%m-%d"))
xend<-as.POSIXct(strptime("2007-02-03","%Y-%m-%d"))
xrange<-c(xstart,xend)
png(filename="./plot3.png",width=480,height=480,units="px")
#submeter1
plot(strptime(paste(as.character(hpc$Date),as.character(hpc$Time),sep=" "),"%d/%m/%Y %H:%M:%S"),
     as.numeric(as.character(hpc$Sub_metering_1)),xlim=xrange,type="l",col="black",
     ylab="Energy sub metering",xlab="")
#submeter3
lines(strptime(paste(as.character(hpc$Date),as.character(hpc$Time),sep=" "),"%d/%m/%Y %H:%M:%S"),
      as.numeric(as.character(hpc$Sub_metering_3)),col="blue")
#submeter2
lines(strptime(paste(as.character(hpc$Date),as.character(hpc$Time),sep=" "),"%d/%m/%Y %H:%M:%S"),
      as.numeric(as.character(hpc$Sub_metering_2)),col="red")
legend("topright",lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
