
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

# Sensitivity analysis
ca <- 400
#k <- 0.05
#MAP <- 1825
#gamma <- 1/((MAP/365/k)/1000)*nZ
d <- seq(1, 15, by=1)
env <- as.vector(expand.grid(d))
df <- data.frame(P50=numeric(), pxgs50=numeric())

for(i in 1:nrow(env)){
  d <- env[i, 1]
  
  g1 <- gsmaxf(1)
  f1 <- function(w)gsmaxf(w)-g1*0.5
  wgs50 <- uniroot(f1, c(0.001, 1), tol=.Machine$double.eps)$root
  
  df[i, 1] <- Psi50fd(d)
  df[i, 2] <- pxf(wgs50, gsmaxf(wgs50))
}

res <- cbind(env, df)
colnames(res) <- c("d", "P50", "pxgs50")
write.csv(res, "Results/SIV-DV.csv", row.names = FALSE)
