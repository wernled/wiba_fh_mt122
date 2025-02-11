# Title     : Aufgabe 10 Skritpum MT122.4 Seite 76
# Objective : Aufgabe 10
# Created by: Wernle Daniel
# Created on: 30/03/2021

# Clear Console
cat("\014")

#Load Data
dataset <- read.csv(file = "./table4.2.csv", encoding = "UTF-8", header = TRUE, sep = ",")
#dataset

k <- lm(dataset$wahlbeteiligung~dataset$temperatur)

koeffizient <- k$coefficients[2]
niveaufaktor <- k$coefficients[1]

sprintf("Koeffizient von Y~X lautet %f",koeffizient)
sprintf("Der Niveaufaktor lautet %f",niveaufaktor)

#install.packages("ggplot2")
library(ggplot2)

# install.packages('showtext', dependencies = TRUE)
library(showtext)
font_add("Comic Sans MS", "comic.ttf")
## Automatically use showtext to render text
showtext_auto()


# Bubble Plot
p <- ggplot(dataset, aes(y=wahlbeteiligung, x=temperatur))
p <- p + geom_point(alpha=0.7)
p <- p + theme_classic()
p <- p + ggtitle("Wahlen Wien - Wahlbeteiligung")
p <- p + theme(plot.title = element_text(size=22))
p <- p + theme(text=element_text(size=16,  family="Comic Sans MS"))
p <- p + ylab("Wahlbeteiligung")
p <- p + xlab("Temperatur")
# Regressionsgerade hinzufügen
p <- p + geom_smooth(aes(y=wahlbeteiligung, x=temperatur ),dataset,method='lm', se=FALSE)
#p

# Objective : Aufgabe 11
# Die Mittagstemperatur amWahltag (25.4.2010) betrug 18◦.Welche Wahlbeteiligung war bei dieser Temperatur zu erwarten?

estWahlbeteiligung <- function(temp,niveaufaktor , koeffizient) {
  wahlbeteiligung <- temp * koeffizient + niveaufaktor
  return(wahlbeteiligung)
}

uhbpwbt <- estWahlbeteiligung(18, niveaufaktor , koeffizient)
sprintf("Die Wahlbeteiligung liegt voraussichtlich bei %f",uhbpwbt)

p <- p + geom_point(aes(y = uhbpwbt, x=18),shape=4,size=5,color='#D10E04')
p <- p + geom_text(aes(y = uhbpwbt, x = 18 +1, label=sprintf("BPW Beteiligung %f %%",uhbpwbt)))

p
ggsave(filename = "./MT122.4_Aufgabe11_Wahlbeteiligung.jpg", plot=p,device="jpeg" )


windowsFonts()

# Objective : Aufgabe 13
# Besteht zwischen der in Tab.4.2 gegebenen Wahlbeteiligung der
# Wienerinnen und Wiener und der am Wahltag vorherrschenden Temperatur eine
# hohe Korrelation?
# Wie groß ist der Korrelationskoeffizient?

korrelationskoeffizient <- cor(dataset$temperatur,dataset$wahlbeteiligung)
sprintf("Der Korellationskoeffizient lautet %f",korrelationskoeffizient)

# Bei einem Korellationskoeffizienten von -0.8497998 handelt es sich um einen starken negativen linearen zusammenhang

