library(NLP)          # Natural Language Processing
library(tm)           # Text Mining
library(RColorBrewer) # Paleta de Cores
library(wordcloud)    # Wordcloud

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
#wc_corpus <- tm_map(wc_corpus, removeWords, c("voto","presidente"))

wc_corpus <- tm_map(wc_corpus, stripWhitespace)

#Cria a frequência de palavras
#wc_corpus <- tm_map(wc_corpus, PlainTextDocument)

# sugestão no stack overflow, algumas vezes tm_map não retorna um corpus 
# (ocorria um erro na linha anterior, removê-lá sem adicionar essa funciona também)
#wc_corpus <- Corpus(VectorSource (wc_corpus))

td_mtx <- TermDocumentMatrix(wc_corpus, control = list())

v <- sort(rowSums(as.matrix(td_mtx)), decreasing=TRUE) #ordena as palavras

df <- data.frame(word=names(v), freq=v) #organiza um novo banco

#Paleta de Cores
pal1 <- brewer.pal(12,"Paired")
pal3 <- brewer.pal(12,"Set3")

WC<- wordcloud(df$word, df$freq, min.freq=40,
               max.words=Inf, random.order=FALSE, 
               rot.per=.15,colors=pal1)

