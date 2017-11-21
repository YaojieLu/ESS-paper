
options(digits=22)
source("Scripts/Derived variables/SIV-F.r")

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

xgs <- seq(0, 1, by=0.01)
ygs <- gsmaxf(xgs)

# Collect results
resgs <- data.frame(w=xgs, gs=ygs)
colnames(resgs) <- c("w", "gs")
write.csv(resgs, "Results/SIV-gs.csv", row.names = FALSE)
