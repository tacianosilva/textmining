#Regular Expressions in R https://rstudio-pubs-static.s3.amazonaws.com/74603_76cd14d5983f47408fdf0b323550b846.html
library(stringr)
library(NLP)          # Natural Language Processing

# Dados com os comentários dos Pull Requests
dados<-read.csv(file.choose(),head=T,encoding = "UTF-8")

comments <- data.frame(dados$X.body.)
names(comments) <- c("comments")

# Coloca cada observação em um vetor
vs <- DataframeSource(comments)

#gDat <- read.delim("gapminderDataFiveYear.txt")
#files <- c("block0_dplyr-fake.rmd", "block000_dplyr-fake.rmd.txt", "gapminderDataFiveYear.txt", 
#           "regex.html", "regex.md", "regex.R", "regex.Rmd", "regex.Rpres", 
#           "xblock000_dplyr-fake.rmd")

strings <- c("a", "ab", "acb", "accb", "acccb", "accccb")
strings
grep("ac*b", strings, value = TRUE)
grep("ac+b", strings, value = TRUE)
grep("ac?b", strings, value = TRUE)
grep("ac{2}b", strings, value = TRUE)
grep("ac{2,}b", strings, value = TRUE)
grep("ac{2,3}b", strings, value = TRUE)
stringr::str_extract_all(strings, "ac{2,3}b", simplify = TRUE)
