# Title     : Playground for Fonts
# Objective : getting familiar with windows Fonts in R Plots
# Created by: Daniel Wernle
# Created on: 02/04/2021

# Clear Console
cat("\014")

#
#Libraries and Packages
#
#install.packages("ggplot2")
library(ggplot2)

install.packages('showtext', dependencies = TRUE)
library(showtext)

#Some Fontmagic to use windows fonts :(
font_paths()
fonts <- font_files()
fonts
font_add("Comic Sans MS", "comic.ttf")
font_families()

## Automatically use showtext to render text
showtext_auto()

