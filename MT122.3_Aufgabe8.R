#Aufgabe 8 Skritpum MT122.3 Seite 65

#Console Löschen ;)
cat("\014")


#Lösung durch hinstarren 
#
# Da sich die Varianz von der Summe der Potenzen von der Differenz zwischen Element und Mittelwert abhängt ist die Reihe 
# mit dem Größten Abstand zum Mittelwert (50) die mit der größten Varianz. Hier ist es die Reihe C. Die reihe B hat 
# die kleinste Abweichung pro Element vom Mittelwert und somit die kleineste Varianz.
#
# Berechnung der Varianz und Standardabweichung
vekA <- c(0, 20, 40, 50, 60, 80, 100)
var(vekA)
sd(vekA)

vekB <- c(0, 48, 49, 50, 51, 52, 100)
var(vekB)
sd(vekB)

vekC <- c(0, 1, 2, 50, 98, 99, 100)
var(vekC)
sd(vekC)


