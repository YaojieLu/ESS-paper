
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
h <- l*a*LAI/nZ*p
h2 <- l*LAI/nZ*p/1000

#environmental conditions
ca <- 400
k <- 0.05
MAP <- 1825
gamma <- 1/((MAP/365/k)/1000)*nZ
d <- 5

# Initialize
ESS <- 0.152775311364286
fpps <- seq(-10, -1, by = 0.5)
fpwL <- wf(fpps)
fpwLr <- c(fpwL[3], ESS, head(tail(fpwL, n=3), n=1))
fpin <- as.vector(expand.grid(fpwLr, fpwL))
fpdf1 <- data.frame("R" = fpps, "I" = fpps)
fpdf2 <- data.frame("R" = fpin[, 1], "I" = fpin[, 2], "B_bar" = fpin[, 2])

# Run
# Fixed point 1
for(i in 1:nrow(fpdf1)){
  averAirelf1 <- Vectorize(function(wLi)averAirelf(wLi, wLr = wf(fpdf1[i, 1])))
  optwLi <- optimize(averAirelf1, c(0.1, 0.3), tol=.Machine$double.eps^0.3, maximum=T)
  fpdf1[i, 2] = psf(optwLi$maximum)
  print(as.numeric(fpdf1[i, ]))
}

# Fixed point 2
for(i in 1:nrow(fpdf2)){
  fpdf2[i, 3] = averAirelf(fpdf2[i, 2], fpdf2[i, 1])
  print(as.numeric(fpdf2[i, ]))
}
fpdf2[, 1:2] <- psf(fpdf2[, 1:2])

# Save
write.csv(fpdf1, "Results/SIII-fp1.csv", row.names = FALSE)
write.csv(fpdf2, "Results/SIII-fp2.csv", row.names = FALSE)
