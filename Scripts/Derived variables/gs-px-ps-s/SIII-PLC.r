
options(digits=22)
source("Scripts/Derived variables/SIII-F.r")
data <- read.csv("Results/SIII-DV.csv")

pe <- -1.58*10^-3
b <- 4.38
c <- 2.64
d <- 5

wL <- subset(data, d==5, select="wL")[[1]]
x <- seq(-10, 0, by=0.1)
y <- PLCfm(x, wL)
# Collect results
res <- data.frame(px=x, PLC=y*100)
colnames(res) <- c("px", "PLC")
write.csv(res, "Results/SIII-PLC.csv", row.names=FALSE)
