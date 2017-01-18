require(rmarkdown)
require(dplyr)

file <- "RDM_intro.Rmd"
render(paste0("Rmd/", file), output_format = "ioslides_presentation",
       output_dir = "docs/", output_file = gsub(".Rmd", ".html", file))
