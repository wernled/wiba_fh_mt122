#Aufgabe 7 Skritpum MT122.3 Seite 65

#Console Löschen ;)
cat("\014")

wertevektor <- c(21, 22, 23, 24, 25, 26, 27, 28, 29)

mean(wertevektor)

#Mittelwert = 25
#Alle Daten sind Symetrisch gestreut

# Gesucht Werte für Varianz 26
# Elemente in Liste 9 + 2

# Varianz = 1 / ( 11 -1) * Summe(Diff^2)
# 
# x ( E < 21 )

potDiffSumme = (21-25)^2 + (22-25)^2+ (23-25)^2+ (24-25)^2+ (25-25)^2+ (26-25)^2+ (27-25)^2+ (28-25)^2+ (29-25)^2

# Daraus ergibt sich 1 /10 * ( (x-25)^2 + 60 + (y-25)^2 ) = 26
# Symetrie um den Mittelwert => x = 25 - z | y = 25 + z
# 1 /10 * ( (25-z-25)^2 + 60 + (25+z-25)^2 ) = 26
# 1 /10 * ( ( -z )^2 + 60 + (z)^2 ) = 26
# (2 * z^2 + 60)/10 = 26
# 2 * z^2 + 60 = 260
# z^2 = 200/2 = 100

z <- sqrt(100)
z
x <- 25 -z
y <- 25 +z

#Ausgabe 
sprintf("x1 = %i , x11 = %i", x,y)
