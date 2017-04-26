library(NLP)          # Natural Language Processing
library(tm)           # Text Mining

# Dados com os comentários dos Pull Requests
dados<-read.csv(file.choose(),head=T,encoding = "UTF-8")

comments <- data.frame(dados$X.body.)
names(comments) <- c("comments")

# Coloca cada observação em um vetor
vs <- DataframeSource(comments)

# Armazena os vetores em documentos
wc_corpus <- Corpus(vs) 

#Coloca tudo em minúsculo
#wc_corpus <- tm_map(wc_corpus, tolower)

#Tira a pountuação e palavras ruído
wc_corpus <- tm_map(wc_corpus, removePunctuation)
wc_corpus <- tm_map(wc_corpus, removeWords, stopwords('english'))

wc_corpus <- tm_map(wc_corpus, stripWhitespace)

inspect(wc_corpus)

BigramTokenizer <-
  function(x)
    unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE)

td_mtx <- TermDocumentMatrix(wc_corpus, control = list(tokenize = BigramTokenizer))

inspect(tdm)

inspect(removeSparseTerms(tdm, 0.99))