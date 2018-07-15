
data <-   read.csv("Kia.csv")

plot(data$Mileage, data$Price)

model <- nls(Price ~ pmax*Mileage/(Mileage+M50)*Year/(Year+Y50),
             start = list(pmax = 12000, M50 = 40000, Y50 = 10), data = data)

pred <- predict(model, newdata=data[1:2])
