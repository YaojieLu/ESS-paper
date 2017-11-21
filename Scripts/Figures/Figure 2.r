
# Data
dataSIL   <- read.csv("Results/SI-gsL.csv")
dataSIH   <- read.csv("Results/SI-gsH.csv")
dataSIIL  <- read.csv("Results/SII-gsL.csv")
dataSIIH  <- read.csv("Results/SII-gsH.csv")
dataSIII <- read.csv("Results/SIII-gs.csv")
dataSIV  <- read.csv("Results/SIV-gs.csv")
dataSV   <- read.csv("Results/SV-gs.csv")

# Figures
windows(16, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="r", lwd=2, mar=c(2.8, 3.5, 1.7, 0.7), mfrow=c(1, 2))
# Immediate
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(0, 1), ylim=c(0, 0.4), cex.lab=1.3, main="Immediate refilling")

points(dataSIL, type="l", lwd=8)
points(dataSIH, type="l", lwd=8, lty=2)
points(dataSIIL, type="l", lwd=4)
points(dataSIIH, type="l", lwd=4, lty=2)
points(dataSIII, type="l", lwd=1)

axis(1, xlim=c(0, 1), pos=-0.04*0.4, lwd=2)
mtext(expression(italic(s)),side=1, line=1.85, cex=1.3)
axis(2, ylim=c(0, 0.4), pos=0, lwd=2)
mtext(expression(italic(g[s])~(mol~m^-2~s^-1)),side=2,line=1.8, cex=1.3)
text(1*0.035, 0.4*1.04*0.95, "a", cex=1.3)
box()

# Delayed
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(0, 1), ylim=c(0, 0.4), cex.lab=1.3, main="Delayed refilling")

points(dataSIII, type="l", lwd=1)
points(dataSV, type="l", lwd=4)
points(dataSIV, type="l", lwd=8)

axis(1, xlim=c(0, 1), pos=-0.04*0.4, lwd=2)
mtext(expression(italic(s)),side=1, line=1.85, cex=1.3)
axis(2, ylim=c(0, 0.4), pos=0, lwd=2)
mtext(expression(italic(g[s])~(mol~m^-2~s^-1)),side=2,line=1.8, cex=1.3)
text(1*0.035, 0.4*1.04*0.95, "b", cex=1.3)
box()

dev.copy2pdf(file = "Figures/Figure 2.pdf")
