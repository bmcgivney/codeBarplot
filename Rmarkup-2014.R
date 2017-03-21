
Rmarkup <- function(filename, overwrite=FALSE){
    filename2 <- gsub("\\..*","",filename)

    inlines <-readLines( filename )
    N <- length(inlines)

    has.txt <- sapply(inlines, function(l) length(grep("^##", l))>0)
    has.txt.b <- unname(unlist(has.txt))

    has.mty <- sapply(inlines, function(l) length(grep("^$", l))>0)
    has.mty.b <- unname(unlist(has.mty))

    has <- cbind(has.txt.b, has.mty.b)

    types <- c("text","empty","code")

    has.code.b <- !has.txt.b & !has.mty.b
    has <- cbind(has, has.code.b)
    lty <- has[,1]*1+has[,2]*2+has[,3]*3
    lty <- types[lty]

    xxx <- doBy::subSeq( lty )

    inlines2 <- inlines
    for (i in 1:N){
        if (has.txt[i]){
            l <- inlines[i]
            inlines2[i] <- gsub("^## *","",l)
        }
    }

    outlines <- vector("character", 2*N)
    k <- 1
    for (i in 1:nrow(xxx)){
        zzz <- xxx[i,]
        ##print(zzz)
        if( zzz$value %in% c("text","empty") ){
            for (j in zzz$first:zzz$last ){
                outlines[k] <- inlines2[j]
                k <- k + 1
            }
        } else {
            outlines[k] <- "```{r}"
            k <- k+1
            for (j in zzz$first:zzz$last ){
                outlines[k] <- inlines2[j]
                k <- k + 1
            }
            outlines[k] <- "```"
            k <- k+1
        }
    }


    head(outlines, 25)
    outfilename <- paste(filename2, "-x.Rmd", sep='')

    if (file.exists(outfilename)){
        if (!overwrite)
            stop(sprintf("File %s exists; stopping (set overwrite=T for force)\n",
                         outfilename))
        else
            writeLines(outlines, con=outfilename)
    } else
        writeLines(outlines, con=outfilename)
}





## l <- "## # TEXT"
## gsub("## *","", l)
