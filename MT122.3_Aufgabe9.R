#Aufgabe 9 Skritpum MT122.3 Seite 67

#Console Löschen ;)
cat("\014")


#Funktion zur Berechnung des Standardisierten Beobachtungswertes (Skritptum Seite 67 3.25) 
zfunc <- function(x, meanVal, sdval ) {
  z = (x - meanVal)/sdval
  z
}

#Erstellen eines Vektors mit den Werten der Reihe
wertevektor <-  c(15,21, 22, 23, 24, 25, 26, 27, 28, 29,35)

#Ermitteln des Mittelwertes 
mittelwert <- mean(wertevektor)

#Ermitteln der Standardabweichung
standardabweichung <- sd(wertevektor)

#Erstellen eines Vektors mit den standardisierten Beobachtungswerten
zReihe <- zfunc(wertevektor,mittelwert,standardabweichung)

#Zusammenführen in einen Datenframe für eine hübschere Ausgabe
dataset <- data.frame(wertevektor,zReihe)

#Ausgabe 
dataset


