# Title     : Beispiel 18 Skritpum MT122.4 Seite 80
# Objective : Beispiel 18
# Created by: Wernle Daniel
# Created on: 03/04/2021

dataset <- read.csv(file = "./table4.1.csv", encoding = "UTF-8", header = TRUE, sep = ",")

korrelationskoeffizient <- cor(dataset$height,dataset$weight)

determinationskoeffizient <- korrelationskoeffizient^2

determinationskoeffizient <- round(determinationskoeffizient,4)

sprintf("Der Korrelationskoeffizient lautet %f", korrelationskoeffizient)
sprintf("Der Determinantionskoeffizient lautet %.4f", determinationskoeffizient)
sprintf("Das Gewicht lässt sich zu etwa %1.0f  Prozent durch den linearen zusammenhang zwischen Körpergröße und Körpergewicht ableiten",determinationskoeffizient*100 )
