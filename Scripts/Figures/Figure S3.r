
source("Scripts/Derived variables/SII-F.r")

# Parameterization
LAI <- 3
Vcmax <- 50
cp <- 30
Km <- 703
Rd <- 1
a <- 1.6
nZ <- 0.5
p <- 43200
l <- 1.8e-5
VPD <- 0.02
pe <- -1.58*10^-3
b <- 4.38
kxmax <- 5
c <- 2.64
d <- 5
h <- l*a*LAI/nZ*p
h2 <- l*LAI/nZ*p/1000
ca <- 400
k <- 0.05
MAP <- 1825
gamma <- 1/((MAP/365/k)/1000)*nZ
pkx <- 0.5
h3 <- 25

# family ESS
wL1 = 0.12
wL2 = 0.18
wLL1 <- wLLf(wL1)
wLL2 <- wLLf(wL2)
pxL1 = psf(wL1)
pxL2 = psf(wL2)

# Functions
gsf1 <- function(w)gswLf(w, wL = wL1)
gsf2 <- function(w)gswLf(w, wL = wL2)
PLCf1 <- function(px)PLCf(px)*100
PLCmf1 <- function(px)PLCf1(pxL1)-(PLCf1(pxL1)-PLCf1(px))*pkx
PLCmf2 <- function(px)PLCf1(pxL2)-(PLCf1(pxL2)-PLCf1(px))*pkx
pxf1 <- function(w)pxf(w, gs = gsf1(w), wL = wL1)
pxf2 <- function(w)pxf(w, gs = gsf2(w), wL = wL2)

# Figures
windows(24, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(4, 4.5, 0.5, 0.5), mfrow=c(1, 3))
# gs(w)
# 1
curve(gsf1, wLL1, 1, xaxt="n", yaxt="n", xlab=NA, ylab=NA,
      xlim=c(0, 1), ylim=c(0, 0.3), cex.lab=1.3, col=1, lwd=1)

axis(1, xlim=c(0, 1), pos=0, lwd=2, at = c(0, 0.5, 1))
mtext(expression(italic(s)),side=1, line=2.5, cex=1.3)
axis(2, ylim=c(0, 0.3), pos=0, lwd=2, at = c(0, 0.1, 0.2, 0.3))
mtext(expression(italic(g[s])~(mol~m^-2~s^-1)),side=2,line=1.8, cex=1.3)
box()
# 2
curve(gsf2, wLL2, 1, add = T, col=2, lwd=4, lty = 2)

# px()
# 1
curve(pxf1, wLL1, 1, xaxt="n", yaxt="n", xlab=NA, ylab=NA,
      xlim=c(0, 1), ylim=c(-10, 0), cex.lab=1.3, col=1, lwd=1)
abline(h = pxL1)
axis(1, xlim=c(0, 1), pos=-10, lwd=2, at = c(0, 0.5, 1))
mtext(expression(italic(s)),side=1, line=2.5, cex=1.3)
axis(2, ylim=c(-10, 0), pos=0, lwd=2, at = c(-10, -5, 0))
mtext(expression(psi[x]~(MPa)), side=2, line=2.1, cex=1.3)
box()
# 2
curve(pxf2, wLL2, 1, add = T, col=2, lwd=4, lty = 2)

# PLC
# 1
curve(PLCf1, -10, pxL1,
      xlim=c(-10, 0), ylim=c(0, 102), xaxt="n", yaxt="n",
      xlab=NA, ylab=NA,
      cex.lab=1.3, col=1, lwd=1)
curve(PLCmf1, pxL1, pe, col=1, lwd=1, add=T)

axis(1, pos=0, lwd=2, at=c(-10, -5, 0))
axis(2, pos=-10, lwd=2, at=c(0, 50, 100))
mtext(expression(psi[x]~(MPa)), side=1, line=3, cex=1.3)
mtext("PLC (%)", side=2, line=2.1, cex=1.3)
box()
# 2
curve(PLCf1, -10, pxL2, add = T, col=2, lwd=4, lty = 2)
curve(PLCmf2, pxL2, pe, add = T, col=2, lwd=4, lty = 2)

#dev.copy2pdf(file = "Figures/Figure S3.pdf")
