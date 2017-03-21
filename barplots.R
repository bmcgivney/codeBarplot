Test<-read.table(file="data/WHS.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE)

SGT<-table(Test$SGT)
#n SGT
SGT
barplot(SGT)
#%SGT
round((prop.table(SGT)*100), 0)

Test$Raced<-Test$TotalStarts
Test$Raced[which(Test$Raced>0)]<-"Raced"
Test$Raced[which(Test$Raced == 0)]<-"Unraced"
Raced<-table(Test$Raced, Test$SGT)
#n SGT
Raced
barplot(Raced)
#%SGT
#Use 1 to get row percentages and 2 to get column percentages
RacedP<-round((prop.table(Raced, 2)*100), 0)
barplot(RacedP)
