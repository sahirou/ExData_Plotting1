
## Load data
source('load_data.R')

## Plot
png(
  filename = "plot2png",
  width = 480, 
  height = 480, 
  units = "px"
)

## Plot
with(df, plot(DateTime, Global_active_power,type = "l", col = "black",xlab = "", ylab = "Global Active Power (kilowatts)"))

## Shut down device
dev.off()
