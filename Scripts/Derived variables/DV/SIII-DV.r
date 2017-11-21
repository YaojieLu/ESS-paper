
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

#environmental conditions
ca <- 400
k <- 0.05
MAP <- 1825
d <- seq(1, 15, by=1)
env <- as.vector(expand.grid(k, MAP, d))

# Initialize
total <- nrow(env)
df <- data.frame(numeric(total), numeric(total), numeric(total), numeric(total))
pb <- txtProgressBar(min=0, max=total, style=3)

# Sensitivity Analysis
for(i in 1:total){
  k <- env[i, 1]
  MAP <- env[i, 2]
  d <- env[i, 3]
  gamma <- 1/((MAP/365/k)/1000)*nZ
  
  x <- try(uniroot(optwLf, c(0.01, 0.3), tol=.Machine$double.eps))
  if(is.numeric(x[[1]])){
    wL <- x$root
    df[i, 1] <- wL
    df[i, 2] <- Psi50fd(d)
    df[i, 3] <- psf(wL)
    g1 <- gswLf(1, wL)
    f1 <- function(w)gswLf(w, wL)-g1*0.5
    w50 <- uniroot(f1, c(wL, 1), tol=.Machine$double.eps)$root
    df[i, 4] <- psf(w50)
  }else{
    df[i, ] <- 100
  }
  setTxtProgressBar(pb, i)
}
close(pb)

# Collect results
res <- cbind(env, df)
colnames(res) <- c("k", "MAP", "d", "wL", "P50", "pxmin", "pxgs50")
write.csv(res, "Results/SIII-DV.csv", row.names = FALSE)
