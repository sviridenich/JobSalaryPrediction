require('tm')
require('Snowball')

get.tdm <- function(doc.vec)
{
  control <- list(stopwords = TRUE,
                  removePunctuation = TRUE,
                  removeNumbers = TRUE,
                  minDocFreq = 2)
  doc.corpus <- Corpus(VectorSource(doc.vec))
  tm_map(doc.corpus,tolower)  
       # FIX ME
       # tm_map(temp, stemDocument)
       doc.dtm <- DocumentTermMatrix(doc.corpus, control)
  return(doc.dtm)
}

count.word <- function(observation, term)
{
  
  observation.corpus <- Corpus(VectorSource(observation))
  # Hard-coded TDM control
  control <- list(stopwords = TRUE,
                  removePunctuation = TRUE,
                  removeNumbers = TRUE)
  observation.tdm <- TermDocumentMatrix(observation.corpus, control)
  word.freq <- rowSums(as.matrix(observation.tdm))
  term.freq <- word.freq[which(names(word.freq) == term)]
  # We use ifelse here because term.freq = NA if nothing is found
  return(ifelse(length(term.freq) > 0, term.freq, 0))
}

decompose.observation <- function(observarion, SomeCorpora ) {
  res <- mat.or.vec(nr=1, nc= SomeCorpora$ncol)
  for ( i in seq(along=SomeCorpora$dimnames$Terms ) ){
    res[1,i] <- count.word(observation ,SomeCorpora$dimnames$Terms[i])
  }

  res

}

MainCorpora <- get.tdm(DTB$Title)

inspect( MainCorpora[1:10,1:20] )

MainCorporaHF <- MainCorpora[ , findFreqTerms(MainCorpora, 5)]

inspect( MainCorporaHF[1:20,1:20] )

observation <- Train_DTB$Title[3456]

count.word( observation , 'nurse')

?tmFilter

# match obsevartion
observation <- Train_DTB$Title[3456]

t <- decompose.observation ( observation, MainCorporaHF )
sum(t)


