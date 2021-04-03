# Title     : Aufgabe 14 Skritpum MT122.4 Seite 83
# Objective : Welche Werte kann ein Rangkorrelationskoeffizient annehmen?
# Created by: Wernle Daniel
# Created on: 03/04/2021

dataset <- read.csv(file = "./MT122.4_Aufgabe14.csv", encoding = "UTF-8", header = TRUE, sep = ",")
#dataset[order(dataset$Platzierung),]
order(dataset$Gewicht)
rank(dataset$Gewicht,ties.method = "first")
GewichtsRang <- rank(dataset$Gewicht,ties.method = "first")
dataset <- data.frame(dataset,GewichtsRang)

#Skriptum Seite 82 -> Pearson sollte nicht verwendet werden da Gewicht rationalskalit ist und Platzierung ordinalskaliert
cor(dataset$Gewicht,dataset$Platzierung, method = "pearson")


GewichtsRang <- rank(dataset$Gewicht,ties.method = "first")
dataset <- data.frame(dataset,GewichtsRang)

#Skriptum Seite 82 -> Da jetzt beide ordinalskaliert sind kann man pearson verwenden,
# da es aber aucu ex qequo Plätze gibt ist person hier nur ein Näherungswert
cor(dataset$GewichtsRang,dataset$Platzierung, method = "pearson")

#Skriptum Seite 83 -> Spearman-Rankkorrelationskoeffizient
cor(dataset$GewichtsRang,dataset$Platzierung, method = "spearman")

#Lösung Aufgabe 14
sprintf("Der korrelationskoeffizient liegt stets zwischen 1 und -1, dabei spielt es keine Rolle welche Methode man verwendet")


