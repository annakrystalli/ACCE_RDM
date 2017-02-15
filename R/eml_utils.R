# ---- create_metadf ----
get_attr_shell <- function(df){
    rows <- ncol(df)
    meta <- data.frame(attributeName = rep(NA, times = rows),
                       attributeDefinition = rep(NA, times = rows),
                       columnClasses = rep(NA, times = rows),
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

extract_attr_tbl <- function(attr_tbl) {
 attr_hd <- c("attributeName", "attributeDefinition", "numberType",
      "unit", "minimum", "maximum", "formatString", "definition")
 attr_tbl[,attr_hd]
}

get_attr_factors <- function(attr_tbl) {
    factors <- NULL
    vars <- attr_tbl$attributeName[attr_tbl$columnClasses == "factor"]
    for(var in vars){
        x <- attr_tbl[attr_tbl$attributeName == var, , drop = F]
        f_tbl <- data.frame(
            attributeName = x$attributeName, 
            code = unlist(strsplit(x$code, ";")),
            definition = unlist(strsplit(x$levels, ";"))
        )
        factors <- rbind(factors, f_tbl)
    }
    return(factors)
}