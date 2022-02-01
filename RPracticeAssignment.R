
# Set working directory and load in turbidity data file
setwd("~/Box/PocatelloStormwater/Data/Turbidity/TrimmedData")
turbidity1 <- read.csv("375675_FireStation_110320.csv",header=TRUE,sep=",")

# Change column names of data file
colnames(turbidity1) <- c("unix_time", "UTC_time", "MST_time", "batt_V", "temp_C", "turbidity_ntu", "gain")

# Set datetime column to POSIXct format for easier plotting
turbidity1$MST_time<-as.POSIXct(turbidity1$MST_time,tryFormats = c("%Y-%m-%d %H:%M:%OS",
                                                                     "%Y/%m/%d %H:%M:%OS",
                                                                     "%Y-%m-%d %H:%M",
                                                                     "%Y/%m/%d %H:%M",
                                                                     "%Y-%m-%d",
                                                                     "%Y/%m/%d"))

# Set turbidity values to NA if the value is negative
for(i in 1:nrow(turbidity1)){
  if(turbidity1$turbidity_ntu[i]<0){
    turbidity1$turbidity_ntu[i]="NA"}}

# Plot turbidity over time
ggplot(turbidity1, aes(MST_time, turbidity_ntu)) +
  geom_point(na.rm=TRUE) + xlab("Date") + ylab("Turbidity (ntu)")

