read.table(file="DUN_SMG.txt", header = TRUE, sep="\t", stringsAsFactors = FALSE)->Test
Test[which(Test$SGT == "CC"),]->CC_Test
CC_Test$Genomic_Racing_Value
mean(CC_Test$Genomic_Racing_Value, na.rm = TRUE)

table(CC_Test$Genomic_Racing_Value)->GRV
barplot(GRV)

