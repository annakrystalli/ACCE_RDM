# ---- create_metadf ----
get_attr_shell <- function(df){
    rows <- ncol(df)
    meta <- data.frame(attributeName = rep(NA, times = rows),
                       attributeDefinition = rep(NA, times = rows),
                       columnClasses = rep(NA, times = rows),
                       measurementScale = rep(NA, times = rows),
                       numberType = rep(NA, times = rows),
                       unit = rep(NA, times = rows),
                       minimum = rep(NA, times = rows),
                       maximum = rep(NA, times = rows),
                       formatString = rep(NA, times = rows),
                       definition = rep(NA, times = rows), 
                       code = rep(NA, times = rows),
                       levels = rep(NA, times = rows),
                       stringsAsFactors = FALSE)
    
    meta$attributeName <- names(df)
    meta$columnClasses <- sapply(df, class)
    meta$columnClasses[meta$columnClasses == "integer"] <- "numeric"
    
    return(meta)
}
