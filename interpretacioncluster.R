
#---analizando en forma cualitativa los clusters
x = iris[,-5]
q = kmeans(x, 3)
q$cluster
library(dplyr)
x$id = as.factor(q$cluster)
head(x)

x %>% group_by(id)
x %>% group_by(id) %>% summarise(media1 = mean(Sepal.Length), media2 = mean(Sepal.Width))
y = x %>% group_by(id) %>% summarise(media1 = mean(Sepal.Length), media2 = mean(Sepal.Width))

barplot(y$media1)

par(mfrow = c(2,2))
boxplot(Sepal.Length ~ id, data = x, col = c(2:4))
boxplot(Sepal.Width~ id, data = x, col = c(2:4))
boxplot(Petal.Length ~ id, data = x, col = c(2:4))
boxplot(Petal.Width ~ id, data = x, col = c(2:4))

par(mfrow = c(1,1))
plot(x$Sepal.Length[x$id == 1], x$Sepal.Width[x$id == 1])
pairs(x[x$id == 1,])

q$centers
q$size
