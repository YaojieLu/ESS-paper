
# Data
dataDVSI <-   read.csv("Results/SI-DV.csv")

# Figures
Cols <- c("purple", "orange", "darkgreen")
windows(16, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(3.5, 3.5, 2, 0.3), mfrow=c(1, 2))
# LAI = 1
plot(0, 0, type="n",
     xaxt="n", yaxt="n", xlab=NA, ylab=NA, main = "LAI = 1",
     xlim=c(-30, 0), ylim=c(-30, 0), cex.lab=1.3)

points(subset(dataDVSI, LAI==1 & h3==1, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 1)
points(subset(dataDVSI, LAI==1 & h3==25, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 2)
points(subset(dataDVSI, LAI==1 & h3==100, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 3)
points(subset(dataDVSI, LAI==1 & h3==200, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 4)

axis(1, xlim=c(-30, 0), pos=-30, lwd=2, at=c(-30, -20, -10, 0))
mtext(expression(psi[x12]~(MPa)), side=1, line=2.4, cex=1.3)
axis(2, ylim=c(-30, 0), pos=-30, lwd=2, at=c(-30, -20, -10, 0))
mtext(expression(psi[xclose]~(MPa)), side=2, line=2, cex=1.3)
abline(a=0, b=1, lty = 2)
legend("topleft", title=expression(beta), as.character(c(1, 25, 100, 200)), lty=1, col=Cols[1], lwd=1:4)
box()

# LAI = 3
plot(0, 0, type="n",
     xaxt="n", yaxt="n", xlab=NA, ylab=NA, main = "LAI = 3",
     xlim=c(-30, 0), ylim=c(-30, 0), cex.lab=1.3)

points(subset(dataDVSI, LAI==3 & h3==1, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 1)
points(subset(dataDVSI, LAI==3 & h3==25, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 2)
points(subset(dataDVSI, LAI==3 & h3==100, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 3)
points(subset(dataDVSI, LAI==3 & h3==200, select=c("P12", "pxmin")), type="l", col=Cols[1], lwd = 4)

axis(1, xlim=c(-30, 0), pos=-30, lwd=2, at=c(-30, -20, -10, 0))
mtext(expression(psi[x12]~(MPa)), side=1, line=2.4, cex=1.3)
axis(2, ylim=c(-30, 0), pos=-30, lwd=2, at=c(-30, -20, -10, 0))
abline(a=0, b=1, lty = 2)
box()
