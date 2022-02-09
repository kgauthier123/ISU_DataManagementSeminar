library(ggplot2)
library(scales)

setwd("~/Box/PocatelloStormwater/Data/DO/CleanedData")


# Plot Clifford cleaned data
DO_clif <- read.csv("Clifford_DO_07-06-2021.csv",header=TRUE,sep=",")
DO_clif$MST_time<-as.POSIXct(DO_clif$MST_time,format="%Y-%m-%d %H:%M:%S")

p1 <- ggplot(DO_clif, aes(MST_time, DO_mgl)) +
  geom_line(na.rm=TRUE) + ggtitle("Clifford Site") + xlab("Date") + ylab("DO (mg/L)")+ ylim(c(0,20))

# Plot Fire Station cleaned data
DO_firestation <- read.csv("FireStation_DO_06-18-2021.csv",header=TRUE,sep=",")
DO_firestation$MST_time<-as.POSIXct(DO_firestation$MST_time,format="%Y-%m-%d %H:%M:%S")

p2 <- ggplot(DO_firestation, aes(MST_time, DO_mgl)) +
  geom_line(na.rm=TRUE) + ggtitle("Fire Station Site") + xlab("Date") + ylab("DO (mg/L)")+ ylim(c(0,20))

# Plot Pacific cleaned data
DO_pacific <- read.csv("Pacific_DO_10-09-2021.csv",header=TRUE,sep=",")
DO_pacific$MST_time<-as.POSIXct(DO_pacific$MST_time,format="%Y-%m-%d %H:%M:%S")

p3 <- ggplot(DO_pacific, aes(MST_time, DO_mgl)) +
  geom_line(na.rm=TRUE) + ggtitle("Pacific Site") + xlab("Date") + ylab("DO (mg/L)")

# Plot Ferguson cleaned data
DO_ferguson <- read.csv("Ferguson_DO_10-09-2021.csv",header=TRUE,sep=",")
DO_ferguson$MST_time<-as.POSIXct(DO_ferguson$MST_time,format="%Y-%m-%d %H:%M:%S")

p4 <- ggplot(DO_ferguson, aes(MST_time, DO_mgl)) +
  geom_line(na.rm=TRUE) + ggtitle("Ferguson Site") + xlab("Date") + ylab("DO (mg/L)") + 
  scale_x_datetime(labels = date_format("%b"))

# Plot Winco cleaned data
DO_winco <- read.csv("Winco_DO_10-09-2021.csv",header=TRUE,sep=",")
DO_winco$MST_time<-as.POSIXct(DO_winco$MST_time,format="%Y-%m-%d %H:%M:%S")

p5 <- ggplot(DO_winco, aes(MST_time, DO_mgl)) +
  geom_line(na.rm=TRUE) + ggtitle("Winco Site") + xlab("Date") + ylab("DO (mg/L)") + ylim(c(0,20))


### Make a panel plot
library(ggpubr)

panel_plot <- ggarrange(p1, p2, p3, p4, p5,
                        ncol = 3,
                        nrow = 2,
                        widths = 1,
                        heights = 1,
                        align = "h",
                        common.legend = FALSE,
                        legend = 'bottom')
panel_plot

### Save plot (hi-res)
setwd("~/Box/DataManagementSeminar")
png(file="my_panel_plot.png", width=6000, height=3000, units="px", res=500)
panel_plot
dev.off()



