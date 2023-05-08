read.csv("C:/Users/pooji/OneDrive/Desktop/project.txt")
readLines("project.txt")
str(readLines("project.txt"))
text<-paste(readLines("project.txt"),collapse=" ")
text
#text preprocessing
text2<- gsub(pattern = "\\W",replace=" ",text) # remove punctuations
text2<- gsub(pattern = "\\d",replace=" ",text2) #remove numbers
text2
text2<-tolower(text2) # to change to lower case
install.packages("tm") # text mining
library(tm)
stopwords()
# stop words removal
text2<-removeWords(text2,stopwords())
text2
text2<-gsub(pattern = "\\b[A-z]\\b{1}",replace=" ",text2) #remove single lettered words
text2<-stripWhitespace(text2) #cover up white spaces
text2
text3<-text2
text3
install.packages("stringr")
install.packages("wordcloud")
install.packages("lubridate")
install.packages("reshape2")
library(stringr)
library(wordcloud)
library(lubridate)
library(reshape2)
#sentimental analysis
#textbag<-str_split(text2,pattern = "\\s+") # split the sentence wrt space
#class(textbag)
#textbag<-unlist(textbag) # removes from the list
options(max.print = 10000)
#textbag 
#str(textbag)
text3<-str(text3)
tdm<-TermDocumentMatrix(text3)
tdm
tdm<-as.matrix(tdm)
str(tdm)
dim(tdm)

w<-rowSums(tdm)
w
barplot(w,las=0,col = rainbow(10))
library(wordcloud)
w<-sort(rowSums(tdm),decreasing = TRUE)
set.seed(222)
wordcloud(words = names(w),freq = w)
#sentimental analysis
library(syuzhet)
library(lubridate)
install.packages("ggplot2")
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)
read.csv("C:/Users/pooji/OneDrive/Desktop/project.csv")
comp<-readLines("project.csv")
s<-get_nrc_sentiment(comp)
head(s)
#print(s)
comp[3]
barplot(colSums(s),las=2,col=rainbow(10),ylab='Count',main='Sentiment scores for Amazon Reviews')

match(textbag,"poswords.txt")
sum(!is.na(match(textbag,"poswords.txt")))
sum(!is.na(match(textbag,"negwords.txt")))
score<-unlist(sum(!is.na(match(textbag,"poswords.txt")))-sum(!is.na(match(textbag,"negwords.txt"))))
score
#neutral document
#can find mean,standard deviation.
#wordcloud(textbag,random.order = FALSE,colors = rainbow(3)) #to display group of words,puts frequent terms in the middle
#corpus3<-Corpus(VectorSource(text3))
#corpus3
#tdm<-TermDocumentMatrix(corpus3)
#tdm
#as.matrix(tdm)
#hist(score)

