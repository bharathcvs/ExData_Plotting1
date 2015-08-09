download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./hpc.zip")
unzip("./hpc.zip",exdir=".")
fullhpc<-read.table("./household_power_consumption.txt",header=TRUE,sep=";")
hpc<-subset(fullhpc,strptime(Date,"%d/%m/%Y") %in% c("2007-02-01","2007-02-02"))
png(filename="./plot1.png",width=480,height=480,units="px")
hist(as.numeric(as.character(hpc$Global_active_power)),
     ylim=c(0,1200),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()