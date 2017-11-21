
options(digits=22)
source("Scripts/Derived variables/SIII-F.r")

# Parameterization
LAI <- 1
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
d <- 4
gamma <- 1/((MAP/365/k)/1000)*nZ

#data <- read.csv("Results/SIII-DV.csv")
#wL <- subset(data, d==5, select="wL")[[1]]
wL <- uniroot(optwLf, c(0.1, 0.3), tol=.Machine$double.eps)$root
pxL <- psf(wL)
fg1 <- function(ps)ESSg1psf(ps, wL)

xg1 <- seq(pxL, pe, by=(psf(1)-pxL)/100)
yg1 <- fg1(xg1)

# Collect results
resg1 <- data.frame(ps=xg1, g1=yg1)
colnames(resg1) <- c("ps", "g1")
write.csv(resg1, "Results/SIII-g1.csv", row.names = FALSE)
