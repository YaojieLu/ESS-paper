
library(plotly)

# Data
d1   <- read.csv("Results/SIII-fp2.csv")
x <- seq(-10, -1, by = 0.5)
y <- seq(-10, -1, by = 0.5)
n <- length(x)
z1 <- t(matrix(d1[, 3],nrow = n, ncol = n))
diag1 <- diag(z1)
z2 <- matrix(diag1, nrow = 1, ncol = n)
z2 <- z2[rep(1:nrow(z2), times = n), ]

d2   <- read.csv("Results/SIII-fp1.csv")

# Figure
# Color
color1 <- rep(0, length(z1))
dim(color1) <- dim(z1)
color2 <- rep(1, length(z2))
dim(color2) <- dim(z2)
# Plotting
p <- plot_ly(colors = c('grey', 'black')) %>%
  add_surface(x = x, y = y, z = z1,
              opacity = 0.8, surfacecolor = color1,
              cauto = F, cmax = 1, cmin = 0)
p <-  add_surface(p,
                  x = x, y = y, z = z2,
                  opacity = 1, surfacecolor = color2,
                  cauto = F, cmax = 1, cmin = 0) %>%
  hide_colorbar()
p