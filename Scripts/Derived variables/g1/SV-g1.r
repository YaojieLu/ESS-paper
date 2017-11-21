
options(digits=22)
source("Scripts/Derived variables/SV-F.r")

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

data <- read.csv("Results/SV-DV.csv")
wL <- subset(data, d==5, select="wL")[[1]]
#wL <- uniroot(optwLif, c(0.01, 0.3), tol=.Machine$double.eps^0.25)$root
pxL <- psf(wL)
fg1 <- function(ps)ESSg1psf(ps, wL)

xg1 <- seq(pxL, psf(1), by=(psf(1)-pxL)/100)
yg1 <- fg1(xg1)

# Collect results
resg1 <- data.frame(ps=xg1, g1=yg1)
colnames(resg1) <- c("ps", "g1")
write.csv(resg1, "Results/SV-g1.csv", row.names = FALSE)
