
source("Scripts/Figures/Figure-F.r")

# Initialize
pe <- -1.58*10^-3
b <- 4.38

# Data
dataSIL   <- read.csv("Results/SI-gsL.csv")
dataSIH   <- read.csv("Results/SI-gsH.csv")
dataSIIL  <- read.csv("Results/SII-gsL.csv")
dataSIIH  <- read.csv("Results/SII-gsH.csv")
dataSIII <- read.csv("Results/SIII-gs.csv")
dataSIV  <- read.csv("Results/SIV-gs.csv")
dataSV   <- read.csv("Results/SV-gs.csv")

dataSIL[1] <- psf(dataSIL[1])
dataSIH[1] <- psf(dataSIH[1])
dataSIIL[1] <- psf(dataSIIL[1])
dataSIIH[1] <- psf(dataSIIH[1])
dataSIII[1] <- psf(dataSIII[1])
dataSIV[1] <- psf(dataSIV[1])
dataSV[1] <- psf(dataSV[1])

# Figures
windows(16, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="r", lwd=2, mar=c(3.6, 3.5, 1.7, 0.7), mfrow=c(1, 2))
# Immediate
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 0.4), cex.lab=1.3, main="Immediate refilling")

points(dataSIL, type="l", lwd=8)
points(dataSIH, type="l", lwd=8, lty=2)
points(dataSIIL, type="l", lwd=4)
points(dataSIIH, type="l", lwd=4, lty=2)
points(dataSIII, type="l", lwd=1)

axis(1, xlim=c(-10, 0), pos=-0.04*0.4, lwd=2)
mtext(expression(italic(psi[s])~(MPa)),side=1, line=2.4, cex=1.3)
axis(2, ylim=c(0, 0.4), pos=-10, lwd=2)
mtext(expression(italic(g[s])~(mol~m^-2~s^-1)),side=2,line=1.8, cex=1.3)
text(-10*0.035, 0.4*1.04*0.95, "a", cex=1.3)
legend("topleft", legend=c("0 %", "50 %", "100 %"), title = expression(italic(p[k[x]])), lwd=c(1, 4, 8))
legend("bottomleft", legend=c(25, 200), title = expression(beta), lty=c(1, 2))
box()

# Delayed
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 0.4), cex.lab=1.3, main="Delayed refilling")

points(dataSIII, type="l", lwd=1)
points(dataSV, type="l", lwd=4)
points(dataSIV, type="l", lwd=8)

axis(1, xlim=c(-10, 0), pos=-0.04*0.4, lwd=2)
mtext(expression(italic(psi[s])~(MPa)),side=1, line=2.4, cex=1.3)
axis(2, ylim=c(0, 0.4), pos=-10, lwd=2)
mtext(expression(italic(g[s])~(mol~m^-2~s^-1)),side=2,line=1.8, cex=1.3)
text(-10*0.965, 0.4*1.04*0.95, "b", cex=1.3)
box()

dev.copy2pdf(file = "Figures/extra/gs-ps.pdf")
