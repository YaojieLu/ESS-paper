
options(digits=22)
source("Scripts/Derived variables/SI-F.r")

c <- 2.64
d <- 5
x <- seq(-10, 0, by=0.1)
y <- PLCf(x)

# Collect results
res <- data.frame(px=x, PLC=y*100)
colnames(res) <- c("px", "PLC")
write.csv(res, "Results/SI-PLC.csv", row.names=FALSE)
