
## Load data
source('load_data.R')

## Graphics devices for PNG file
png(
  filename = "plot3png",
  width = 480, 
  height = 480, 
  units = "px"
)

## Plot
with(
  data = df,
  expr = {
    plot(DateTime,Sub_metering_1,col = "black",type="l",xlab = "",ylab = "Energy sub metering")
    lines(DateTime,Sub_metering_2,col = "red")
    lines(DateTime,Sub_metering_3,col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c("solid","solid","solid")) 
  }
)

## Shut down device
dev.off()
