require(dplyr)

x1 <- rnbinom(500, mu = 4, size = 1)
x2 <- rnbinom(500, mu = 4, size = 10)
x3 <- rnbinom(500, mu = 4, size = 100)
h1 <- hist(x1, breaks = 20, plot = FALSE)
h2 <- hist(x2, breaks = h1$breaks, plot = FALSE)
h3 <- hist(x3, breaks = h1$breaks, plot = FALSE)
barplot(rbind(h1$counts, h2$counts, h3$counts),
        beside = TRUE, col = c("red","blue","cyan"),
        names.arg = round(h1$breaks[-length(h1$breaks)]))



stocks <- data.frame(
  date = (as.Date('2014/01/01') + 0:179) %>% format("%m-%d-%Y") ,
  X = rnorm(180, 0, 1),
  Y = rnorm(180, 0, 2),
  Z = rnorm(180, 0, 4)
)

write.csv(stocks, "~/Google Drive/ACCE course/Tidy Data exersize/stocks.csv", row.names = F)

test <- read.csv("~/Google Drive/ACCE course/Tidy Data exersize/stocks.csv")



birds <- data.frame(
  pairID = 1:20,
  region = rep(LETTERS[1:5], each = 4),
  male = rnorm(20, 5, 1),
  female = rnorm(20, 3.7, 1)
)

write.csv(birds, "~/Google Drive/ACCE course/Tidy Data exersize/birds.csv", row.names = F)

gather(birds, sex, length, male:female)



trees <- data.frame(
  spl = paste(1:15, rep(c("above", "below"), each = 15), sep = "/"),
  species = rep(rep(LETTERS[1:3], each = 5),2),
  temperature = c(rnorm(15, 32, 4), rnorm(15, 24, 4)),
  humidity = c(rnorm(15, 60, 5), rnorm(15, 90, 4)),
  seq = c(seq(1, 29, by = 2), seq(2, 30, by = 2))
)

trees <- trees[order(trees$seq),-5]


separate(data = trees, col = spl, into = c("tree id", "elevation"), sep = "/")

write.csv(trees, "~/Google Drive/ACCE course/Tidy Data exersize/trees.csv", row.names = F)
test <- read.csv("~/Google Drive/ACCE course/Tidy Data exersize/trees.csv")

#_________________________________________________________________________________________


load("~/Documents/TRAINING DATA/training extra data.RData")


dd <- master.m.x
rm(master.m.x)
dd <- dd[, - which(names(dd) %in% c("overlap", "chlorophyll_index", "loc.index", 
                                    "w.index", "m.index", "r.ind", "c.ind", "tow.id"))]

nms <- c("lon" ,       "lat"  ,      "tow"    ,    "sample.no.",  "year"    ,   "month" ,
"week" , "day"  , "time"    ,  "tem"  ,      "centrot"   , "calfin"  ,   "calhel"   ,
"metrilu"  ,  "T.m"    ,    "Tf.m"   ,    "Sed.m"  ,    "Sedf.m"  ,   "Chf.m"   ,   "Ch.m" ,    
  "fdist.m" ,   "fside.m"  , "fdist.c.m" , "fside.c.m" , "bath",  
"NAO" )

dd <- dd[, nms]

names(dd)[names(dd) ==  "sample.no."] <-  "sample no."

write.csv(dd, "~/Google Drive/ACCE course/Metadata exercise/master.csv", row.names = F)



# Bird network example data create ##############################################################

## METADATA EXERCISE

input.folder <- "~/Documents/WORK/ACCE Data management course/workflow/inputs/exercises/metadata/"

# DATA
vars <- c("max.altitude", "inc","dev.mode", "courtship.feed.m", "song.dur", "breed.system")
dd <- read.csv(paste(input.folder,"master wide.csv", sep =""))
dd <- dd[,c("species", vars)]

# METADATA
meta <- read.csv(paste(input.folder,"metadata2.csv", sep =""), stringsAsFactors = F)
meta[meta == ""] <- NA
names(meta)[names(meta)== "master.vname"] <- "code"
meta$type <- tolower(meta$type)
meta <- meta[meta$code %in% vars, c("code", "orig.vname", "cat", "descr", 
                                    "scores", "levels", "type","units")]
meta <- meta[match(names(dd)[-1], meta$code),]




write.csv(meta, paste(input.folder,"metadata.csv", sep =""), row.names = F)
write.csv(dd, paste(input.folder,"data.csv", sep =""), row.names = F)

## METADATA DEMO

ddl <- read.csv(paste(input.folder,"master.csv", sep =""), stringsAsFactors = F,
                fileEncoding = "mac")[1:100,]
ddl$observer <- "Elliot Smith"
ddl$observer[1:10] <- "Jane Green"


meta <- read.csv(paste(input.folder,"metadata2.csv", sep =""), stringsAsFactors = F,
                 fileEncoding = "mac")
meta[meta == ""] <- NA
names(meta)[names(meta)== "master.vname"] <- "code"
meta$type <- tolower(meta$type)
meta <- meta[, c("code", "orig.vname", "cat", "descr",
                 "scores", "levels", "type","units", "notes", "source")]
meta$source[meta$source == "original"] <- "D0"



write.csv(meta, paste(input.folder,"meta1.csv", sep =""), row.names = F,
          fileEncoding = "mac")
write.csv(ddl, paste(input.folder,"data1.csv", sep =""), row.names = F,
          fileEncoding = "mac")
