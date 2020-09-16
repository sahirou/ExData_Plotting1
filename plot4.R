
## Load data
source('load_data.R')

## Graphics devices for PNG file
png(
  filename = "plot4png",
  width = 480, 
  height = 480, 
  units = "px"
)

## Fill device by row
par(mfrow = c(2,2))

## Plot 1,1
with(df, plot(DateTime, Global_active_power,type = "l", col = "black",xlab = "", ylab = "Global Active Power"))

## Plot 1,2
with(df, plot(DateTime, Voltage,type = "l", col = "black",xlab = "datetime", ylab = "Voltage"))

## Plot 2,1
with(
  data = df,
  expr = {
    plot(DateTime,Sub_metering_1,col = "black",type="l",xlab = "",ylab = "Energy sub metering")
    lines(DateTime,Sub_metering_2,col = "red")
    lines(DateTime,Sub_metering_3,col = "blue")
    legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=c("solid","solid","solid")) 
  }
)

# Plot 2,2
with(df, plot(DateTime, Global_reactive_power,type = "l", col = "black",xlab = "datetime"))

## Shut down device
dev.off()
