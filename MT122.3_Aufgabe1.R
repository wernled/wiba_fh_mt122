#Aufgabe 1 Skritpum MT122.3 Seite 49

#Vektor erstellen mit den Werten aus Beispiel 3 (Seite 46)
x <- c(1, 3, 1, 3, 2, 2, 5, 4, 3, 2, 3, 4, 6, 3)


#Unter Zuhilfenahme von Stackoverflow: https://stackoverflow.com/questions/2547402/how-to-find-the-statistical-mode
#Funktion für Modalwert
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x,ux)))]
}


#Extended Funktion für Modalwert falls mehrere auftreten sollten
Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}


#Zuweisen der Modus-Werte über die Funktionen Mode bzw. Modes
xmod <- Mode(x)
xmodes <- Modes(x)

#Ausgabe der Werte für xmod und xmodes
xmod
xmodes