
options(digits=22)
source("Scripts/Derived variables/SI-F.r")
data <- read.csv("Results/SI-DV.csv")

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
#k <- 0.05
#MAP <- 1825
#gamma <- 1/((MAP/365/k)/1000)*nZ
d <- 5

# Low h
h3 <- 1
wLL <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
aL <- seq(wLL, 1, by=(1-wLL)/100)
bL <- psf(aL)
cL <- ESSf(aL)
dL <- pxf(aL, cL)

# High h
h3 <- 100
wLH <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
aH <- seq(wLH, 1, by=(1-wLH)/100)
bH <- psf(aH)
cH <- ESSf(aH)
dH <- pxf(aH, cH)

# Collect results
resL <- data.frame(w=aL, ps=bL, gs=cL/max(cL)*100, px=dL)
resH <- data.frame(w=aH, ps=bH, gs=cH/max(cH)*100, px=dH)
write.csv(resL, "Results/SI-wpsgspxL.csv", row.names=FALSE)
write.csv(resH, "Results/SI-wpsgspxH.csv", row.names=FALSE)
