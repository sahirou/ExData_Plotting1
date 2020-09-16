
## Load data
source('load_data.R')

## Graphics devices for PNG file 
png(
  filename = "plot1.png",
  width = 480, 
  height = 480, 
  units = "px"
)

## Plot
with(df, hist(Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)", ylab = "Frequency"  ,main = "Global Active Power"))


## Shut down device
dev.off()
