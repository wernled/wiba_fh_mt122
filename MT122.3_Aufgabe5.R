#Aufgabe 5 Skritpum MT122.3 Seite 64

#Console Löschen ;)
cat("\014")

#Als Datenbasis dient die Tabelle 3.4 aus dem Skriptum (auch verwendet in Aufgabe 2)
schuljahre  <- read.csv(file = "./Aufgabe2.csv", header = TRUE, sep=",")$Schuljahre

spannweite <- range(schuljahre)
spannweite <- spannweite[2] - spannweite[1]

#Ausgabe Spannweite 
spannweite

#Quartilsabstand
schuljahre.quartile <- quantile(schuljahre)
interquantile <- schuljahre.quartile[4,1] - schuljahre.quartile[2,1]


#Ausgabe durchschnittlicher Abstand zwischen den Quartilen
interquantile


#Alternative Berechnung Interquartilsabstand mit R-Funktion
interquantile <- IQR(schuljahre)
interquantile


#Ausreißertest:

#Au = x0.25 - 1.5 * IQR 
#A0 = x0.75 + 1.5 * IQR


AUpper = quantile(schuljahre,0.25)[1] - 1.5 * IQR(schuljahre)
ALower = quantile(schuljahre,0.75)[1]  + 1.5 * IQR(schuljahre)

#Ausgabe Au & A0
AUpper
ALower

#Alle Werte liegen innerhalb der grenzen 11.75 und 18.75 es gibt somit keine Ausreißer

