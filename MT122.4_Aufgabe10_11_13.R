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

#Pretty Fonts anyone?
#install.packages("showtext")
#install.packages("jsonlite")
#install.packages("curl")
library(showtext)
#font_add_google("Rubik", "rubik")
#font_add_google("Karla", "karla")
## Automatically use showtext to render text
showtext_auto()


# Bubble Plot
p <- ggplot(dataset, aes(x=wahlbeteiligung, y=temperatur))
p <- p + geom_point(alpha=0.7)
p <- p + theme_classic()
p <- p + ggtitle("Wahlen Wien - Wahlbeteiligung")
p <- p + theme(plot.title = element_text(size=22))
p <- p + theme(text=element_text(size=16,  family="rubik"))
p <- p + xlab("Wahlbeteiligung")
p <- p + ylab("Temperatur")
# Regressionsgerade hinzufügen
p <- p + geom_smooth(aes(x=wahlbeteiligung, y=temperatur ),dataset,method='lm', se=FALSE)
#p

# Objective : Aufgabe 11
# Die Mittagstemperatur amWahltag (25.4.2010) betrug 18◦.Welche Wahlbeteiligung war bei dieser Temperatur zu erwarten?

estWahlbeteiligung <- function(temp,niveaufaktor , koeffizient) {
  wahlbeteiligung <- temp * koeffizient + niveaufaktor
  return(wahlbeteiligung)
}

uhbpwbt <- estWahlbeteiligung(18, niveaufaktor , koeffizient)
sprintf("Die Wahlbeteiligung liegt voraussichtlich bei %f",uhbpwbt)

p <- p + geom_point(aes(x = uhbpwbt, y=18),shape=4,size=5,color='#D10E04')
p <- p + geom_text(aes(x = uhbpwbt + 0.03 , y = 18, label=sprintf("BPW Beteiligung %f %%",uhbpwbt)))

p
ggsave(filename = "./MT122.4_Aufgabe11_Wahlbeteiligung.jpg", plot=p,device="jpeg" )


windowsFonts()

# Objective : Aufgabe 13
# Besteht zwischen der in Tab.4.2 gegebenen Wahlbeteiligung der
# Wienerinnen und Wiener und der am Wahltag vorherrschenden Temperatur eine
# hohe Korrelation?
# Wie groß ist der Korrelationskoeffizient?

korellationskoeffizient <- cor(dataset$temperatur,dataset$wahlbeteiligung)
sprintf("Der Korellationskoeffizient lautet %f",korrelationskoeffizient)

# Bei einem Korellationskoeffizienten von -0.8497998 handelt es sich um einen starken negativen linearen zusammenhang

