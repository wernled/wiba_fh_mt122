# Title     : Bubble Graph Plot
# Objective : Create Graph as in example for Bubble Plot in R on Page 71 of MT122.4
# Created by: Daniel Wernle
# Created on: 30/03/2021

dataset <- read.csv(file = "./table4.1.csv", encoding = "UTF-8", header = TRUE, sep = ",")

# Libraries
#install.packages("ggplot2")
library(ggplot2)

# Bubble Plot
p <- ggplot(dataset, aes(x=height, y=weight))
p <- p + geom_point(alpha=0.7)
p <- p + theme_classic()
p <- p + ggtitle("Bubbles ... everywhere bubbles")
p <- p + xlab("Größe")
p <- p + ylab("Gewicht")
# Regressionsgerade hinzufügen
p <- p + geom_smooth(method='lm', se=0)
p

