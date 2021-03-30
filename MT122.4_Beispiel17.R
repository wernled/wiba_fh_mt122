# Title     : Beispiel 17 Skritpum MT122.4 Seite 78
# Objective : Beispiel 17
# Created by: Wernle Daniel
# Created on: 30/03/2021

dataset <- read.csv(file = "./table4.1.csv", encoding = "UTF-8", header = TRUE, sep = ",")

korrelationskoeffizient <- cor(dataset$height,dataset$weight)
sprintf("Der Korrelationskoeffizient lautet %f", korrelationskoeffizient)