
options(digits=22)
source("Scripts/Derived variables/SI-F.r")

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
#d <- 3.54
h <- l*a*LAI/nZ*p
h2 <- l*LAI/nZ*p/1000

# Environmental conditions
ca <- 400
d <- 5

# Low h
h3L <- 1

#wLL <- subset(data, h3==h3L & d==5, select="wL")[[1]]
h3 <- h3L
wLL <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
xL <- seq(wLL, 1, by=(1-wLL)/100)
yL <- ESSPLCf(xL)

# High h
h3H <- 100

#wLH <- subset(data, h3==h3H & d==5, select="wL")[[1]]
h3 <- h3H
wLH <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
xH <- seq(wLH, 1, by=(1-wLH)/100)
yH <- ESSPLCf(xH)

# Figure
windows(8, 6)
par(mgp=c(2.2, 1, 0), xaxs="i", yaxs="i", lwd=2, mar=c(3.3, 3.5, 0.9, 0.7), mfrow=c(1, 1))
# PLC - w
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(0, 1), ylim=c(0, 100), cex.lab=1.3)

points(xL, yL*100, col="purple", type="l")
points(xH, yH*100, col="purple", type="l", lty=2)

axis(1, xlim=c(0, 1), pos=0, lwd=2)
mtext(expression(italic(s)),side=1, line=2, cex=1.3)
axis(2, ylim=c(0, 100), pos=0, lwd=2)
mtext("PLC (%)",side=2,line=1.8, cex=1.3)
box()
legend("topright", title = "Unit xylem recovery cost", c("low", "high"), lty = 1:2, col = "purple")
