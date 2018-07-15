#
## Data
#dataDVSI <-   read.csv("Results/SI-DV.csv")
#dataDVSIII <- read.csv("Results/SIII-DV.csv")
#datac <- read.csv("Data/Choat2012.csv")
#dataAng <- subset(datac, Type=="Angiosperm", select=c("Psi50", "Psimin"))
#dataAng <- dataAng[order(dataAng$Psi50), ]
#dataGym <- subset(datac, Type=="Gymnosperm", select=c("Psi50", "Psimin"))
#dataGym <- dataGym[order(dataGym$Psi50), ]
#
## Regression
#fitAng <- nls(Psimin ~ -a*Psi50+b, data=dataAng, start=list(a=-0.4, b=-1),
#              control=c(minFactor=1e-5))
#fitGym <- nls(Psimin ~ -a*Psi50+b, data=dataGym, start=list(a=-0.4, b=-1),
#              control=c(minFactor=1e-5))
#
## Figures
#windows(8, 6)
#par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(5, 5, 1, 1), mfrow=c(1, 1))
Colsd <- c("lightblue", "lightpink")
plot(0, 0, type="n",
     xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-15, 0), ylim=c(-15, 0),
     cex.lab=1.3, col=Colsd[1])

points(dataAng, type="p", col=Colsd[1], pch=1, lwd=1)
lines(dataAng$Psi50, predict(fitAng), col=Colsd[1], lwd=1)
points(dataGym, type="p", col=Colsd[2], pch=2, lwd=1)
lines(dataGym$Psi50, predict(fitGym), col=Colsd[2], lwd=1)

points(subset(dataDVSIII, d<11, select=c("P50", "pxmin")), type="l", , col=Cols[3])
points(subset(dataDVSI, h3==1 & d<11, select=c("P50", "pxmin")), type="l", , col=Cols[1])
points(subset(dataDVSI, h3==100 & d<11, select=c("P50", "pxmin")), type="l", lty=2, , col=Cols[1])
#points(subset(dataDVSII, h3==25, select=c("P50", "pxmin")), type="p")
## V
#points(subset(dataDVSV, select=c("P50", "pxmin")), type="l", col="blue")

axis(1, xlim=c(-15, 0), pos=-15, lwd=2, at=c(-15, -10, -5, 0))
mtext(expression(psi[x50]~(MPa)),side=1,line=3, cex=1.3)
axis(2, ylim=c(-15, 0), pos=-15, lwd=2, at=c(-15, -10, -5, 0))
mtext(expression(psi[xclose]~(MPa)),side=2,line=2, cex=1.3)
text(-15*0.965, -15*0.05, "d", cex=1.3)
legend("bottomleft", title=expression(Choat~italic(et~al.)~2012), c("Angiosperm", "Gymnosperm"), lwd=1, pch=c(1, 2), lty=c(1, 1), col=Colsd[1:2])
box()
