
source("Scripts/Figures/Figure-F.r")

# Initialize
pe <- -1.58*10^-3
b <- 4.38

# Data
# gs(px)
dataSIL   <- read.csv("Results/SI-wpsgspxL.csv")
dataSIH   <- read.csv("Results/SI-wpsgspxH.csv")
dataSIIL  <- read.csv("Results/SII-wpsgspxL.csv")
dataSIIH  <- read.csv("Results/SII-wpsgspxH.csv")
dataSIII <- read.csv("Results/SIII-wpsgspx.csv")
# PLC
dataSIPLC <- read.csv("Results/SI-PLC.csv")
dataSIIPLCL <- read.csv("Results/SII-PLCL.csv")
dataSIIPLCH <- read.csv("Results/SII-PLCH.csv")
dataSIIIPLC <- read.csv("Results/SIII-PLC.csv")

# Figures
Cols <- c("purple", "orange", "darkgreen")
windows(24, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="r", lwd=2, mar=c(4, 4.2, 2, 0.4), mfrow=c(1, 3))
# Scenario I
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 100), main = expression(italic(p[k[x]])==100~'(%)'), cex.lab=1.3)

points(dataSIL[, 4:3], type="l", col=Cols[1])
points(dataSIH[, 4:3], type="l", col=Cols[1], lty=2)
points(dataSIPLC, type="l")

axis(1, xlim=c(-10, 0), pos=-4, lwd=2)
mtext(expression(psi[x]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(0, 100), pos=-10, lwd=2)
mtext(expression('Relative'~italic(g[s])~'or'~'PLC'~'(%)'), side=2, line=2.1, cex=1.3)
box()

# Scenario II
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 100), main = expression(italic(p[k[x]])==50~'(%)'), cex.lab=1.3)

points(dataSIIL[, 4:3], type="l", col=Cols[2])
points(dataSIIH[, 4:3], type="l", col=Cols[2], lty=2)
points(dataSIIPLCL, type="l")
points(dataSIIPLCH, type="l", lty=2)

axis(1, xlim=c(-10, 0), pos=-4, lwd=2)
mtext(expression(psi[x]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(0, 100), pos=-10, lwd=2)
box()

legend("bottomleft", c(expression(paste(beta==1)), expression(paste(beta==100))), title = 'PLC', lty=c(1, 2))

# Scenario III
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(0, 100), main = expression(italic(p[k[x]])==0~'(%)'), cex.lab=1.3)

points(dataSIII[, 4:3], type="l", col=Cols[3])
points(dataSIIIPLC, type="l")

axis(1, xlim=c(-10, 0), pos=-4, lwd=2)
mtext(expression(psi[x]~(MPa)),side=1, line=3, cex=1.3)
axis(2, ylim=c(0, 100), pos=-10, lwd=2)
box()

legend("bottomright", c(expression(paste(italic(p[k[x]]==100), ",  ", beta==1)),
                        expression(paste(italic(p[k[x]]==100), ",  ", beta==100)),
                        expression(paste(italic(p[k[x]]==50), ",  ", beta==1)),
                        expression(paste(italic(p[k[x]]==50), ",  ", beta==100)),
                        expression(paste(italic(p[k[x]]==0)))), lty=c(1, 2, 1, 2, 1), col=c("purple", "purple", "orange", "orange", "darkgreen"))

dev.copy2pdf(file = "Figures/Figure gs(px).pdf")
