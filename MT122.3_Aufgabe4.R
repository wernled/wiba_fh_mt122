#Aufgabe 4 Skritpum MT122.3 Seite 60

#Console Löschen ;)
cat("\014")  

# Beim ersten Durchlauf müssen die verwendeten Packages installiert werden, diese bieten zusätzliche Funktionen die nicht im R-Standard Repertoire enthalten sind
# Funktionen für besseres Table Handling
# install.packages("data.table")
# Referenz: https://github.com/Rdatatable/data.table

# Funktionen für hübsche Plots ;)
# install.packages("ggplot2")

library(ggplot2)
library(data.table)

#Daten aus CSV Tabelle in ein data.table Objekt (variable) laden
planetentable  <- read.table(file = "./MT122.3_Aufgabe4.csv",encoding="UTF-8", header = TRUE, sep=",",check.names=FALSE)
setDT(planetentable)

#Sortieren in richtige Reihenfolge (im Beispiel bereits in richtiger Reihenfolge angegeben, wurde aber zum Üben im CSV Verändert)
planetentable <- planetentable[order(Durchmesser),]

#Ausgeben der Planetentabelle
planetentable

#Minimum Ermitteln
#Kurze Erklärung 
#Es wird ein Subtable erstellt die alle Elemente des Planetentables enthällt bei denen der Durchmesser der Minimumvalue entspricht
#Das wurde gemacht weil es durchaus mehrere Planeten geben können die gleich groß sind bzw. für die die Daten so ungenau sind das sie gleich groß erscheinen

min.rows <- planetentable[ Durchmesser == min(planetentable$Durchmesser)]

#Ausgabe der Zeilen für Planeten die den kleinsten Durchmesser haben
min.rows


#Maximum Ermitteln
max.rows <- planetentable[ Durchmesser == max(planetentable$Durchmesser)]

#Ausgabe der Zeilen für Planeten die den größten Durchmesser haben
max.rows

#Exakte Quartile ermitteln
quantile(planetentable$Durchmesser)
quantile(planetentable$Durchmesser,0.25)
quantile(planetentable$Durchmesser,0.5)
quantile(planetentable$Durchmesser,0.75)

#Die Aufgabenstellung "Visuell" ist schwer in R umzusetzen also zeichnen wir etwas, dann haben wir auch was visuelles ;)
#Für die Darstellung von Quantiles finde ich Boxplott recht schön

#Erstelle eine ggplot Grafik
p <- ggplot(planetentable, aes(y=Durchmesser)) 
#Wir möchten ein Boxplot
p <- p+geom_boxplot( outlier.colour="red", outlier.shape=16, outlier.size=3, notch=FALSE, fill = "white", colour = "#3366FF",outlier.alpha = 0.5)
#Eigentlich ist blau recht hübsch
p <- p+scale_fill_brewer(palette="Blues")
#Das Koordinatensystem von Y soll von 0 - 600 gehen
p <- p+coord_cartesian(ylim = c(0, 600))
#wir hätten gerne 20 Werte auf der linken Seite
p <- p+scale_y_continuous(breaks = scales::pretty_breaks(n = 20))
#Da die X Achse uninteressant ist blenden wir die default-lables aus
p <- p+theme(axis.title.x=element_blank(),axis.text.x=element_blank(),axis.ticks.x=element_blank())
#Die Grafik wird ausgegeben
p

