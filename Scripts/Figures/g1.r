#
#library(nlme)
#library(doBy)
#
## Data
#datag1SIL <-   read.csv("Results/SI-g1L.csv")
#datag1SIH <-   read.csv("Results/SI-g1H.csv")
#datag1SIII <- read.csv("Results/SIII-g1.csv")
#dataa <- read.csv("Data/Zhou 2014.csv")
#
## Zhou 2014
#fits <- nlsList(g1 ~ a*exp(b*LWP)|Species, start=list(a=10, b=0.5), data=dataa)
#rangefun <- function(x)setNames(range(x), c("min", "max"))
#ran <- summaryBy(LWP ~ Species, FUN=rangefun, data=dataa)
#pars <- cbind(ran, as.data.frame(coef(fits)))
#
## Figures
#windows(8, 6)
#par(mgp=c(2.2, 1, 0), xaxs="i", lwd=2, mar=c(5, 5, 1, 1), mfrow=c(1, 1))
plot(0, 0, type="n", xaxt="n", yaxt="n", xlab=NA, ylab=NA,
     xlim=c(-10, 0), ylim=c(-0.5, 10), cex.lab=1.3)

for(i in 1:nrow(pars))curve(pars[i, "a"]*exp(pars[i, "b"]*x), from=pars[i, "LWP.min"], to=0, add=TRUE, lwd=1)

points(datag1SIL, type="l", col=Cols[1])
points(datag1SIH, type="l", col=Cols[1], lty=2)
points(datag1SIII, type="l", col=Cols[3])
## V
#points(datag1SV, type="l", col="blue")

axis(1, xlim=c(-10, 0), pos=-0.5, lwd=2, at=c(-10, -5, 0))
mtext(expression(psi[s]~(MPa)), side=1, line=3, cex=1.3)
axis(2, ylim=c(0, 10), pos=-10, lwd=2, at=c(0, 5, 10))
mtext(expression(italic(g[1])~(kPa^-0.5)), side=2, line=2, cex=1.3)
text(-10*0.965, 10.5*0.95-0.5, "a", cex=1.3)
legend("topright", c("Zhou et al. 2014"), lwd=1, lty=1)
box()
