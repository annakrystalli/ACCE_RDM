pkgs <- c("dplyr", "magrittr", "tidyr")
if (!require("pacman")) install.packages("pacman")
pacman::p_load(pkgs, character.only = T)
