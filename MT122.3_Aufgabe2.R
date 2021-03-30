#Aufgabe 2 Skritpum MT122.3 Seite 57

#Daten aus CSV Tabelle importieren -> Da wir die Schuljahre als Vektor wollen müssen wir den Spaltennamen hinten bei der read.csv Funktion angeben
schuljahre  <- read.csv(file = "./mt122.3_Aufgabe2.csv", header = TRUE, sep=",")$Schuljahre

#Ausgabe des schuljahre Vektors
schuljahre

#Standard Quantile Funktion von R um zu überprüfen ob es mal prinzipiell funktioniert mit dem Vektor zu arbeiten
quantile(schuljahre)

#In der Aufgabe ist das 0.65 quantile gefragt also müssen wir das noch angeben
quantile(schuljahre, .65)

#Das Ergebniss ist mit 15.675 etwas größer als das über das näherungsverfahren berechnete Ergebnis