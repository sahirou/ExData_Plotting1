
# rm(list = ls())

# Check if "lubridate" and "sqldf" are installed
if(!library(lubridate, logical.return = TRUE)) {
  # It does not exist, so install it
  install.packages('lubridate')
}

if(!library(sqldf, logical.return = TRUE)) {
  # It does not exist, so install it
  install.packages('sqldf')
}


## Set working directory, Download and unzip raw data **************************

# Project main directory named "project"
projectFolder <- 'project'

# Raw data will be stored in a folder named "data", inside "project" folder
rawDataFolder <- 'data'

# In the user home directory, create the 'project' directory if it does not exist
setwd('~')
if(!dir.exists(projectFolder)) {
  dir.create(file.path(projectFolder,rawDataFolder), recursive = TRUE)
}
setwd(projectFolder)

# Download raw data
zipFileName <- 'exdata_data_household_power_consumption.zip'
zipFileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

# Check if the raw data is already downloaded
if(!file.exists(file.path(rawDataFolder,zipFileName))) {
  # It does not exist, so download it
  download.file(
    url = zipFileUrl,
    destfile = file.path(rawDataFolder,zipFileName),
    mode = "wb")
}

# Unzip raw data
unzip(
  zipfile = file.path(rawDataFolder,zipFileName), 
  exdir = file.path(rawDataFolder), 
  overwrite = TRUE
)


## Read raw data

# Raw data are unzipped and stored here
pathData = file.path(rawDataFolder)

# Read  data for 2 days : 2007-02-01 and 2009-02-02
df <- sqldf::read.csv.sql(
  file = file.path(pathData, "household_power_consumption.txt"), 
  sql = "select * from file where Date in ('1/2/2007','2/2/2007')", 
  sep=";"
) 

## Add datetime field from Date and Time fields
df$DateTime <- lubridate::dmy_hms(paste0(df$Date," ",df$Time))

## Convert Date and Time columns to Date and Time
df$Date <- lubridate::dmy(df$Date)
df$Time <- lubridate::hms(df$Date)


## Check NAs in the data 
if(!any(is.na(df))) {
  print('No NAs in the data frame')
}

str(df)
