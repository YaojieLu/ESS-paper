
# Data
dataDVSI <-   read.csv("Results/SI-DV.csv")
dataDVSIII <- read.csv("Results/SIII-DV.csv")

# Figures
Cols <- c("purple", "orange", "darkgreen")
windows(8, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(5, 5, 1, 1), mfrow=c(1, 1))
plot(0, 0, type="n",
     xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-100, 0), ylim=c(-100, 0), cex.lab=1.3)

points(subset(dataDVSIII, select=c("P50", "pxmin")), type="l", col=Cols[3])
points(subset(dataDVSI, h3==1, select=c("P50", "pxmin")), type="l", col=Cols[1])
points(subset(dataDVSI, h3==100, select=c("P50", "pxmin")), type="l", lty=2, col=Cols[1])

axis(1, xlim=c(-100, 0), pos=-100, lwd=2, at=c(-100, -30, 0))
mtext(expression(psi[x50]~(MPa)), side=1, line=3, cex=1.3)
axis(2, ylim=c(-100, 0), pos=-100, lwd=2)
mtext(expression(psi[x*", "*italic(g[s]*50)]~(MPa)), side=2, line=2, cex=1.3)
box()
