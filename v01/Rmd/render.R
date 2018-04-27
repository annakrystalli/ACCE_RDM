require(rmarkdown)
require(dplyr)

# cp "/Users/Anna//Documents/workflows/ACCE_RDM/Rmd/css/ioslide_handout.css" "ioslide_handout.min.css"
# cd "/Users/Anna//Library/R/3.3/library/rmarkdown/rmd/h/bootstrap-3.3.5/css/"


# ---- RDM_intro ----
file <- "RDM_intro"
# render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation") MANUAL
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- tidy_data ----
file <- "tidy_data"
# render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation") MANUAL
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- exercises ----
file <- "exercises"
# render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation") MANUAL
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- metadata ----
file <- "metadata"
# render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation") MANUAL
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- ropensci ----
file <- "ROpenSci"
#render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation")
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- outro ----
file <- "outro"
#render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation")
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document",
       output_file = paste0("../docs/", file, ".html"))

# ---- index ----
file <- "index"
#render(paste0("Rmd/", file, ".Rmd"), output_format = "ioslides_presentation")
render(paste0("Rmd/", file, ".Rmd"), output_format = "html_document")
