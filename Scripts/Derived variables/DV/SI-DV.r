
options(digits=22)
source("Scripts/Derived variables/SI-F.r")

# Parameterization
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

# Sensitivity analysis
ca <- 400
#k <- 0.05
#MAP <- 1825
#gamma <- 1/((MAP/365/k)/1000)*nZ
LAI <- c(1, 3)
h3 <- c(1, 25, 100, 200)
d <- seq(1, 15, by=1)
env <- as.vector(expand.grid(LAI, h3, d))
df <- data.frame(wL=numeric(), P50=numeric(), P12=numeric(), pxmin=numeric(), pxgs50=numeric(), slope=numeric())

for(i in 1:nrow(env)){
  LAI <- env[i, 1]
  h3 <- env[i, 2]
  d <- env[i, 3]
  
  wL <- uniroot(ESSBf, c(0.01, 1), tol=.Machine$double.eps)$root
  g1 <- ESSf(1)
  f1 <- function(w)ESSf(w)-g1*0.5
  w50 <- uniroot(f1, c(wL, 1), tol=.Machine$double.eps)$root
  psL <- psf(wL)
  
  df[i, 1] <- wL
  df[i, 2] <- Psi50fd(d)
  df[i, 3] <- Psi12fd(d)
  df[i, 4] <- pxf(wL, ESSf(wL))
  df[i, 5] <- pxf(w50, ESSf(w50))
  df[i, 6] <- (ESSpxpsf(psL)-ESSpxpsf(pe))/(psL-pe)
}

res <- cbind(env, df)
colnames(res) <- c("LAI", "h3", "d", "wL", "P50", "P12", "pxmin", "pxgs50", "slope")
write.csv(res, "Results/SI-DV.csv", row.names = FALSE)
