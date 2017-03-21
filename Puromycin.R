
#http://people.math.aau.dk/~sorenh/software/rmarkup/index.html
#library("doBy", lib.loc="~/R/win-library/3.3")
#Rmarkup("Puromycin.R")
#library(markdown)
#markdownToHTML("Puromycin-x.Rmd", "Puromycin-x.html")
#can be turned into a pdf-file using, for example, http://wkhtmltopdf.org/.
#library(prettydoc)
#rmarkdown::render("Puromycin-x.Rmd", html_pretty())



## The puromycin study
## ==========================
## By Winnie the Pooh
## ------------------

## Introduction
## ------------

## The _Puromycin_ data
## --------------------

## The _Puromycin_ dataframe has 23 rows and 3 columns of the reaction
## velocity versus substrate concentration in an enzymatic reaction
## involving untreated cells or cells treated with Puromycin.

head(Puromycin,3)

## Initial graphics shows:
library(ggplot2)
p1<-qplot(conc, rate, colour=state, data=Puromycin)
p2<-qplot(log(conc), rate, colour=state, data=Puromycin)
gridExtra::grid.arrange(p1, p2, ncol=1)

## Fit a model to transformed data
m1 <- lm(rate~state + log(conc), data=Puromycin)
summary(m1)






