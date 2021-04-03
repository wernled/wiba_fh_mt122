# Title     : Beispiel 20 Skritpum MT122.4 Seite 84
# Objective : Beispiel 20
# Created by: Wernle Daniel
# Created on: 03/04/2021

#libs
install.packages("dplyr")
library("dplyr")

dataset <- read.csv(file = "./MT122.4_Beispiel20.csv", encoding = "UTF-8", header = TRUE, sep = ",")

#Totals hinzufügen -> Seite 85
total <- rowSums(cbind(dataset$Geschlecht_w,dataset$Geschlecht_m),na.rm = FALSE)
dataset <- data.frame(dataset,total)

#Häufigkeiten hinzufügen -> Seite 85
haeufigkeit_total <- prop.table(dataset$total)
dataset <- data.frame(dataset,haeufigkeit_total)

haeufigkeit_w <- dataset$Geschlecht_w / colSums(cbind(dataset$total))
dataset <- data.frame(dataset,haeufigkeit_w)
haeufigkeit_m <- dataset$Geschlecht_m / colSums(cbind(dataset$total))
dataset <- data.frame(dataset,haeufigkeit_m)

#Man sieht das 58,8% in Gruppe A , 23,5% in Gruppe B und 17,6% in Gruppe C sind
#bind_rows(summarise(dataset,across(where(is.numeric), sum),across(where(is.character), ~"Total")))

#Man sieht das 66,7 der Angestellten Weiblich und 33,3% Männlich sind
dswithtotals <- rbind(dataset,bind_rows(summarise(dataset,across(where(is.numeric), sum),across(where(is.character), ~"Total"))))
dswithtotals

#Erwartetet häufigkeite bassierend auf den den 66,7 und 33,3% zum Dataframe hinzufügen
estHaeufigkeit_w <- ( dataset$total / 100) * ( bind_rows(summarise(dataset,across(where(is.numeric), sum),across(where(is.character), ~"Total")))$haeufigkeit_w * 100)
estHaeufigkeit_m <- ( dataset$total / 100) * ( bind_rows(summarise(dataset,across(where(is.numeric), sum),across(where(is.character), ~"Total")))$haeufigkeit_m * 100)
dataset <- data.frame(dataset,estHaeufigkeit_w)
dataset <- data.frame(dataset,estHaeufigkeit_m)
dataset

#Chi Quadrat Koeffizient ausrechnen

#Funktion um das Chi quadrat für eine Spalte zu berechnen
#Formel -> Summe der (Wahrscheinliche Häufigkeit - Tatsächliche Häufigkeit)^2 / Wahrscheinliche Häufigkeit
mt_single_col_chiq <- function(haeufigkeit, esthaeufigkeit ) {
  tempvar1 <- esthaeufigkeit - haeufigkeit
  tempvar2 <- tempvar1^2
  tempvar3 <- tempvar2 / esthaeufigkeit
  colSums(cbind(tempvar3),na.rm = FALSE)
}

chiq <- mt_single_col_chiq(dataset$Geschlecht_w,dataset$estHaeufigkeit_w) + mt_single_col_chiq(dataset$Geschlecht_m,dataset$estHaeufigkeit_m)
chiq

#Korrigierten Kontingenzkoeffizient ausrechnen (Siehe Formel Seite 86 im Skriptum)
korrigierterKontinenzkoeffizient <- sqrt(2 * (chiq/(chiq+51)))
korrigierterKontinenzkoeffizient

sprintf("Der Korrigierte Kontingenzkoeffizient lautet %.2f" , korrigierterKontinenzkoeffizient)
