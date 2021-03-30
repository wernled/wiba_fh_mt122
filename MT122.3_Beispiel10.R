#Beispiel 10 Skritpum MT122.3 Seite 55

#Daten aus Tabelle einlesen (vorbereitet als CSV table3.3.csv)
dataset <- read.csv(file = "./table3.3.csv", encoding = "UTF-8", header = TRUE, sep = ",")

#Konveriteren der Position in einen Numeric Wert
dataset$position <- as.numeric(as.character(dataset$position))  

x75 <- quantile(dataset$position,na.rm = TRUE, 0.75 )
IQR(dataset$position, na.rm = TRUE)
A0 = x75 + 1.5 * IQR(dataset$position, na.rm = TRUE)

nanreplacement = A0 + max(dataset$position, na.rm=TRUE)

sprintf("Extremwert für NaN Werte: %f", nanreplacement)

dataset$position[is.na(dataset$position)] <- nanreplacement
quantile(dataset$position)
