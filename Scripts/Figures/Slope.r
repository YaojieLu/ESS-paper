
## Data
#dataDVSI <-   read.csv("Results/SI-DV.csv")
#dataDVSII <-  read.csv("Results/SII-DV.csv")
#rawdatab <- read.csv("Data/Martinez-vilalta 2014.csv")
#datab <- data.frame(P50=rawdatab$P50.Mpa, sigma=rawdatab$sigma)
#datab <- datab[order(datab$P50), ]
#
## Martinez-vilalta 2014
#fit <- nls(sigma ~ a*(-P50)^b+c, data=datab, start=list(a=0.8459, b=0.1261, c=-0.1320),
#           control=c(minFactor=1e-5))
#
## Figures
#windows(8, 6)
#par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(5, 5, 1, 1), mfrow=c(1, 1))
plot(datab$P50, datab$sigma,
     type="p", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 1.5), cex.lab=1.3, pch=1, lwd=1, col = "gray60")

lines(datab$P50, predict(fit), lwd=1, col = "gray60")

points(subset(dataDVSI, LAI==3 & h3==1 & d<11, select=c("P50", "slope")), type="l", col=Cols[1], lty=1)
points(subset(dataDVSI, LAI==3 & h3==100 & d<11, select=c("P50", "slope")), type="l", col=Cols[1], lty=2)
#points(subset(dataDVSII, h3==100,select=c("P50", "slope")), type="l", col=Cols[2], lty=2)
segments(subset(dataDVSI, LAI==3 & h3==100 & d==1, select=c("P50"))[[1]], 0,
         subset(dataDVSI, LAI==3 & h3==100 & d==10, select=c("P50"))[[1]], 0, col=Cols[3])
## V
#points(subset(dataDVSV, select=c("P50", "slope")), type="l", col="blue")

axis(1, xlim=c(-10, 0), pos=-1.5*0.04, lwd=2, at=c(-10, -5, 0))
mtext(expression(psi[x50]~(MPa)), side=1, line=3, cex=1.3)
axis(2, ylim=c(0, 1.5), pos=-10, lwd=2, at=c(0, 0.5, 1, 1.5))
mtext("Slope", side=2, line=2, cex=1.3)
text(-10*0.965, 1.5*1.04*0.95, "b", cex=1.3)
legend("topright", legend=expression(Martinez-vilalta~italic(et~al.)~2014), lty=1, lwd=1, pch=1, col = "gray60")
box()
