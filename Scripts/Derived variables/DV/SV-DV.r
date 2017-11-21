
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

# Sensitivity analysis
ca <- 400
k <- 0.05
MAP <- 1825
gamma <- 1/((MAP/365/k)/1000)*nZ
pkx <- 0.5
d <- seq(1, 10, by=1)
env <- as.vector(expand.grid(pkx, d))
df <- data.frame(wL=numeric(), P50=numeric(), pxmin=numeric(), pxgs50=numeric(), slope=numeric())

for(i in 1:nrow(env)){
  pkx <- env[i, 1]
  d <- env[i, 2]
  
  wL <- uniroot(optwLif, c(0.01, 0.3), tol=.Machine$double.eps^0.25)$root
  g1 <- gsmaxfm(1, wL)
  f1 <- function(w)gsmaxfm(w, wL)-g1*0.5
  wgs50 <- uniroot(f1, c(wL, 1), tol=.Machine$double.eps)$root
  
  df[i, 1] <- wL
  df[i, 2] <- P50f(d)
  df[i, 3] <- pxf(wL, gsmaxfm(wL, wL), wL)
  df[i, 4] <- pxf(wgs50, gsmaxfm(wgs50, wL), wL)
  df[i, 5] <- (df[i, 2]-pxf(1, gsmaxfm(1, wL), wL))/(psf(wL)-psf(1))
}

res <- cbind(env, df)
colnames(res) <- c("pkx", "d", "wL", "P50", "pxmin", "pxgs50", "slope")
write.csv(res, "Results/SV-DV.csv", row.names = FALSE)
