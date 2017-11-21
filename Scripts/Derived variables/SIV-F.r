
# psf(w)
psf <- function(w)pe*w^(-b)

# wf(ps)
wf <- function(ps)(ps/pe)^(-1/b)

# PLC(px)
PLCf <- function(px)1-exp(-(-px/d)^c)

# P50
Psi50fd <- function(d){
  f1 <- function(px)exp(-(-px/d)^c)-0.5
  res <- uniroot(f1, c(-100, 0), tol=.Machine$double.eps)$root
  return(res)
}

# xylem conductance function
kxf <- function(px)kxmax*exp(-(-px/d)^c)

# minimum xylem water potential function at given w
pxminf <- function(w){
  ps <- psf(w)
  f1 <- function(px)(ps-px)*h2*kxf(px)
  res <- optimize(f1, c(-40, 0), tol=.Machine$double.eps, maximum=T)$maximum
  return(res)
}

# gsmaxf(w)
gsmaxf <- Vectorize(function(w){
  ps <- psf(w)
  pxmin <- pxminf(w)
  res <- (ps-pxmin)*h2*kxf(pxmin)/(h*VPD)
  return(res)
})

# xylem water potential function
pxf <- function(w, gs){
  ps <- psf(w)
  pxmin <- pxminf(w)
  f1 <- function(px)((ps-px)*h2*kxf(px)-h*VPD*gs)^2
  res <- ifelse(pxmin<ps, optimize(f1, c(pxmin, ps), tol=.Machine$double.eps)$minimum, ps)
  return(res)
}

# Af(gs)
Af <- function(gs)LAI*1/2*(Vcmax+(Km+ca)*gs-Rd-((Vcmax)^2+2*Vcmax*(Km-ca+2*cp)*gs+((ca+Km)*gs+Rd)^2-2*Rd*Vcmax)^(1/2))
