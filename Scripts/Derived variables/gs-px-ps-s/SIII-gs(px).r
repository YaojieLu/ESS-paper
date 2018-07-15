
options(digits=22)
source("Scripts/Derived variables/SIII-F.r")

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
d <- 5
gamma <- 1/((MAP/365/k)/1000)*nZ

data <- read.csv("Results/SIII-DV.csv")
wL <- subset(data, d==5, select="wL")[[1]]
#wL <- uniroot(optwLf, c(0.1, 0.3), tol=.Machine$double.eps)$root
fgs <- function(w)gswLf(w, wL)

ags <- seq(wL, 1, by=(1-wL)/100)
bgs <- psf(ags)
cgs <- fgs(ags)
dgs <- rep(psf(wL), length(ags))

# Collect results
resgs <- data.frame(w=ags, ps=bgs, gs=cgs/max(cgs)*100, px=dgs)
write.csv(resgs, "Results/SIII-wpsgspx.csv", row.names = FALSE)
