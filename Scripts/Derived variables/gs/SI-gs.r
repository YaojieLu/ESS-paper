
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
h3L <- 1

#wLL <- subset(data, h3==h3L & d==5, select="wL")[[1]]
h3 <- h3L
wLL <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
xL <- seq(wLL, 1, by=(1-wLL)/100)
yL <- ESSf(xL)

# Collect results
resL <- data.frame(w=xL, gs=yL)
colnames(resL) <- c("w", "gs")
write.csv(resL, "Results/SI-gsL.csv", row.names=FALSE)

# High h
h3H <- 100

#wLH <- subset(data, h3==h3H & d==5, select="wL")[[1]]
h3 <- h3H
wLH <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
xH <- seq(wLH, 1, by=(1-wLH)/100)
yH <- ESSf(xH)

# Collect results
resH <- data.frame(w=xH, gs=yH)
colnames(resH) <- c("w", "gs")
write.csv(resH, "Results/SI-gsH.csv", row.names=FALSE)
