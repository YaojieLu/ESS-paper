
options(digits=22)
source("Scripts/Derived variables/SII-F.r")
data <- read.csv("Results/SII-DV.csv")

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
k <- 0.05
MAP <- 1825
gamma <- 1/((MAP/365/k)/1000)*nZ
pkx <- 0.5
d <- 5

# Low h
h3L <- 1
wLL <- subset(data, h3==h3L & d==5, select="wL")[[1]]
h3 <- h3L
wLLL <- wLLf(wLL)
fL <- Vectorize(function(w)gswLf(w, wLL))
aL <- seq(wLLL, 1, by=(1-wLLL)/100)
bL <- psf(aL)
cL <- fL(aL)
dL <- pxf(aL, cL, wLL)

# High h
h3H <- 100
wLH <- subset(data, h3==h3H & d==5, select="wL")[[1]]
h3 <- h3H
wLHL <- wLLf(wLH)
fH <- Vectorize(function(w)gswLf(w, wLH))
aH <- seq(wLHL, 1, by=(1-wLHL)/100)
bH <- psf(aH)
cH <- fH(aH)
dH <- pxf(aH, cH, wLH)

# Collect results
resL <- data.frame(w=aL[-1], ps=bL[-1], gs=cL[-1]/max(cL[-1])*100, px=dL[-1])
resH <- data.frame(w=aH[-1], ps=bH[-1], gs=cH[-1]/max(cH[-1])*100, px=dH[-1])
write.csv(resL, "Results/SII-wpsgspxL.csv", row.names=FALSE)
write.csv(resH, "Results/SII-wpsgspxH.csv", row.names=FALSE)
