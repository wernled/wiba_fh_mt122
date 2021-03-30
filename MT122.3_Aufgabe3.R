#Aufgabe 3 Skritpum MT122.3 Seite 60

#Console Löschen ;)
cat("\014")  

#Da in der CSV umlaute vorkommen ö sollten wir die System Locale  auf Deutsch stellen
Sys.setlocale("LC_CTYPE", "german")

#Daten aus CSV Tabelle importieren -> Auch hier müssen wir als Encoding UTF-8 angeben um das ö sauber in die Tabelle zu bekommen
zwergentabelle  <- read.csv(file = "./MT122.3_Aufgabe3.csv",encoding="UTF-8", header = TRUE, sep=",",check.names=FALSE)

#Um einen Vektor aus der Spalte 'Größe (in cm)' zu erhalten können wir es wieter hinten anfügen 
zwergengroeßen <- zwergentabelle$`Größe (in cm)`

#Die Werte im Vektor der Größe nach anordnen
zwergengroeßen <- sort(zwergengroeßen)

#Ausgabe des Vektors Zwergengrößen... nur um sicherzugegehen das wir damit arbeiten können :)
zwergengroeßen

#In der Aufgabe sind Min, Max, sowie 1. - 3. Quartil (näherungsweise und exakt) gefragt

#Minimalwert
zgmin <- min(zwergengroeßen)

#Ausgabe Minimalwert
zgmin

#Maximalwert
zgmax <- max(zwergengroeßen)

#Ausgabe Maximalwert
zgmax

#1. - 3. Quartil Berechnungen
#Exakt
zgquantilefunc <- quantile(zwergengroeßen)

#Ausgabe Exakte Quantiles
zgquantilefunc

#Jetzt über das Näherungsverfahren

#wir haben 7 werte, somit ist n=7
n<-7

#Berechnung 1. Quartile
p1<-0.25
p2<-0.5
p3<-0.75
q1 <- n * p1
q2 <- n * p2
q3 <- n * p3

#Runden
round(q1, digits = 0)
round(q2, digits = 0)
round(q3, digits = 0)

#Die gerundeten Größen sind 2,4,5
#Somit müssen wir das Mittel der folgenden Elemente ausrechnen
# für 25% -> Element 2 (70) & 3 (80)
# für 50% -> Element 4 (80) & 5 (81)
# für 75% -> Element 5 (81) & 6 (85)

x25 <- (70+80)/2
x50 <- (80+81)/2
x75 <- (81+85)/2

#Ausgabe von Quartil 25%, 50%, 75%
x25
x50
x75