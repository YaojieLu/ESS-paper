
# Data
d1   <- read.csv("Results/SIII-fp1.csv")
d2   <- read.csv("Results/SIII-fp2.csv")
d2[, 1] <- as.factor(d2[, 1])
fr <- levels(d2[, 1])

# Figure
windows(8, 6)
par(mgp = c(2.2, 1, 0), xaxs = "r", yaxs = "r", lwd = 2, mar = c(3.8, 4, 2, 0.5), mfrow = c(2, 2))
Cols = c("lightgreen", "red", "orange")
# Fixed point
plot(d1,
     type = "l", xaxt = "n", yaxt = "n", xlab = NA, ylab = NA, xlim = c(-10, 0), ylim = c(-10, 0), cex.lab = 1.3)
points(d1[which(d1$R == fr[1]), ], pch = 15, col = Cols[1])
points(as.numeric(fr[2]), as.numeric(fr[2]), pch = 15, col = Cols[2])
points(d1[which(d1$R == fr[3]), ], pch = 15, col = Cols[3])
abline(a = 0, b = 1, lty = 2, lwd = 1)

axis(1, xlim = c(-10, 0), pos = -10*1.04, lwd = 2)
mtext(expression(Given~psi[xL*infinity]~(MPa)~"for"~italic(R)),side = 1, line = 2.5, cex = 1.3)
axis(2, ylim = c(-10, 0), pos = -10*1.04, lwd = 2)
mtext(expression(The~best~psi[xL*infinity]~(MPa)~"for"~italic(I)),side = 2,line = 2, cex = 1.3)
text(-5.5, -5, "ESS", cex = 1.3, col = Cols[2])
text(-0.1, -1, "1:1", cex = 1.3)
text(-10*1.04*0.955, -10*1.04+10*1.08*0.955, "a", cex = 1.3)
box()

# Fixed point2
# b
x = as.numeric(fr[1])
plot(d2[which(d2$R == x), 2:3],
     type = "l", xaxt = "n", yaxt = "n", xlab = NA, ylab = NA, xlim = c(-10, 0), ylim = c(0, 120), cex.lab = 1.3)
segments(x, -120*0.04,
         x, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         lty = 2, lwd = 1)
segments(-10*1.04, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         x, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         lty = 2, lwd = 1)
segments(d1[which(d1$R == x), ]$I, -120*0.04,
         d1[which(d1$R == x), ]$I, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[1])
segments(-10*1.04, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         10*0.04, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[1])

axis(1, xlim = c(-10, 0), pos = -120*0.04, lwd = 2)
mtext(expression(psi[xL*infinity]~(MPa)~"for"~italic(I)),side = 1, line = 2.5, cex = 1.3)
axis(2, ylim = c(0, 120), pos = -10*1.04, lwd = 2, at = c(0, 40, 80, 120))
mtext(expression(italic(bar(B[I]))~(mu*mol~m^2~s^-1)),side = 2,line = 2, cex = 1.3)
title(as.expression(bquote(Given~psi[xL*infinity]==.(x)~MPa~"for"~italic(R))),
      cex.main = 1.5, col.main = Cols[1])
text(-10*1.04*0.955, -120*0.04+120*1.08*0.955, "b", cex = 1.3)
box()

# c
x = as.numeric(fr[2])
xx = round(as.numeric(fr[2]), digits = 0)
plot(d2[which(d2$R == x), 2:3],
     type = "l", xaxt = "n", yaxt = "n", xlab = NA, ylab = NA, xlim = c(-10, 0), ylim = c(0, 120), cex.lab = 1.3)
segments(x, -120*0.04,
         x, d2[which(d2$R == x & d2$I == xx), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[2])
segments(-10*1.04, d2[which(d2$R == x & d2$I == xx), ]$B_bar,
         10*0.04, d2[which(d2$R == x & d2$I == xx), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[2])

axis(1, xlim = c(-10, 0), pos = -120*0.04, lwd = 2)
mtext(expression(psi[xL*infinity]~(MPa)~"for"~italic(I)),side = 1, line = 2.5, cex = 1.3)
axis(2, ylim = c(0, 120), pos = -10*1.04, lwd = 2, at = c(0, 40, 80, 120))
mtext(expression(italic(bar(B[I]))~(mu*mol~m^2~s^-1)),side = 2,line = 2, cex = 1.3)
title(as.expression(bquote(Given~psi[xL*infinity]%~~%.(x)~MPa~"for"~italic(R))),
      cex.main = 1.5, col.main = Cols[2])
text(-10*1.04*0.955, -120*0.04+120*1.08*0.955, "c", cex = 1.3)
box()

# d
x = as.numeric(fr[3])
plot(d2[which(d2$R == x), 2:3],
     type = "l", xaxt = "n", yaxt = "n", xlab = NA, ylab = NA, xlim = c(-10, 0), ylim = c(0, 120), cex.lab = 1.3)
segments(x, -120*0.04,
         x, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         lty = 2, lwd = 1)
segments(-10*1.04, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         x, d2[which(d2$R == x & d2$I == x), ]$B_bar,
         lty = 2, lwd = 1)
segments(d1[which(d1$R == x), ]$I, -120*0.04,
         d1[which(d1$R == x), ]$I, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[3])
segments(-10*1.04, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         10*0.04, d2[which(d2$R == x & d2$I == round(d1[which(d1$R == x), ]$I, digits = 0)), ]$B_bar,
         lty = 2, lwd = 1, col = Cols[3])

axis(1, xlim = c(-10, 0), pos = -120*0.04, lwd = 2)
mtext(expression(psi[xL*infinity]~(MPa)~"for"~italic(I)),side = 1, line = 2.5, cex = 1.3)
axis(2, ylim = c(0, 120), pos = -10*1.04, lwd = 2, at = c(0, 40, 80, 120))
mtext(expression(italic(bar(B[I]))~(mu*mol~m^2~s^-1)),side = 2,line = 2, cex = 1.3)
title(as.expression(bquote(Given~psi[xL*infinity]==.(x)~MPa~"for"~italic(R))),
      cex.main = 1.5, col.main = Cols[3])
text(10*0.04-10*1.04*0.045, 120*1.04-120*1.08*0.935, "d", cex = 1.3)
box()

# Save
dev.copy2pdf(file = "Figures/Figure S4.pdf")
