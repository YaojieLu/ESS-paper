
# ps(w)
psf <- function(w)pe*w^(-b)

# minimum xylem water potential function at given w
pxminfI <- function(w){
  ps <- psf(w)
  f1 <- function(px)(ps-px)*h2*kxf(px)
  res <- optimize(f1, c(-40, 0), tol=.Machine$double.eps, maximum=T)$maximum
  return(res)
}

# xylem water potential function
pxfI <- Vectorize(function(w, gs){
  ps <- psf(w)
  pxmin <- pxminfI(w)
  f1 <- function(px)((ps-px)*h2*kxf(px)-h*VPD*gs)^2
  res <- ifelse(pxmin<ps, optimize(f1, c(pxmin, ps), tol=.Machine$double.eps)$minimum, ps)
  return(res)
})

# PLC(px)
PLCf <- function(px)1-exp(-(-px/d)^c)