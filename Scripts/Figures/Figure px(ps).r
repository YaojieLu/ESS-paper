
source("Scripts/Figures/Figure-F.r")

# Data
dataSIL   <- read.csv("Results/SI-wpsgspxL.csv")
dataSIH   <- read.csv("Results/SI-wpsgspxH.csv")
dataSIIL  <- read.csv("Results/SII-wpsgspxL.csv")
dataSIIH  <- read.csv("Results/SII-wpsgspxH.csv")
dataSIII <- read.csv("Results/SIII-wpsgspx.csv")

# Figures
Cols <- c("purple", "orange", "darkgreen")
windows(24, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(4, 4.2, 2, 0.4), mfrow=c(1, 3))
# Scenario I
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(-10, 0), main = expression(italic(p[k[x]])==100~'(%)'), cex.lab=1.3)

points(dataSIL[, 2], dataSIL[, 4], type="l", col=Cols[1])
points(dataSIH[, 2], dataSIH[, 4], type="l", col=Cols[1], lty=2)

axis(1, xlim=c(-10, 0), pos=-10, lwd=2)
mtext(expression(psi[s]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(-10, 0), pos=-10, lwd=2)
mtext(expression(psi[x]~(MPa)), side=2, line=2.1, cex=1.3)
box()

legend("topleft", c(expression(paste(italic(p[k[x]]==100), ",  ", beta==1)),
                    expression(paste(italic(p[k[x]]==100), ",  ", beta==100)),
                    expression(paste(italic(p[k[x]]==50), ",  ", beta==1)),
                    expression(paste(italic(p[k[x]]==50), ",  ", beta==100)),
                    expression(paste(italic(p[k[x]]==0)))), lty=c(1, 2, 1, 2, 1), col=c("purple", "purple", "orange", "orange", "darkgreen"))

# Scenario II
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(-10, 0), main = expression(italic(p[k[x]])==50~'(%)'), cex.lab=1.3)

points(dataSIIL[, 2], dataSIIL[, 4], type="l", col=Cols[2])
points(dataSIIH[, 2], dataSIIH[, 4], type="l", col=Cols[2], lty=2)

axis(1, xlim=c(-10, 0), pos=-10, lwd=2)
mtext(expression(psi[s]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(-10, 0), pos=-10, lwd=2)
box()

# Scenario III
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(-10, 0), main = expression(italic(p[k[x]])==0~'(%)'), cex.lab=1.3)

points(dataSIII[, 2], dataSIII[, 4], type="l", col=Cols[3])

axis(1, xlim=c(-10, 0), pos=-10, lwd=2)
mtext(expression(psi[s]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(-10, 0), pos=-10, lwd=2)
box()

dev.copy2pdf(file = "Figures/Figure px(ps).pdf")
