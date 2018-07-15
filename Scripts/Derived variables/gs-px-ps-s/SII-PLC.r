
options(digits=22)
source("Scripts/Derived variables/SII-F.r")
data <- read.csv("Results/SII-DV.csv")

pe <- -1.58*10^-3
b <- 4.38
c <- 2.64
d <- 5
pkx <- 0.5

x <- seq(-10, 0, by=0.1)

# Low h
h3L <- 1
wLL <- subset(data, h3==h3L & d==5, select="wL")[[1]]
yL <- PLCfm1(x, wLL)
# Collect results
resL <- data.frame(px=x, PLC=yL*100)
colnames(resL) <- c("px", "PLC")
write.csv(resL, "Results/SII-PLCL.csv", row.names=FALSE)

# High h
h3H <- 100
wLH <- subset(data, h3==h3H & d==5, select="wL")[[1]]
yH <- PLCfm1(x, wLH)
# Collect results
resH <- data.frame(px=x, PLC=yH*100)
colnames(resH) <- c("px", "PLC")
write.csv(resH, "Results/SII-PLCH.csv", row.names=FALSE)
