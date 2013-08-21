# Linggi, Aug 1,2013
# updated: Aug21,2013
# normalize RNA-seq data using DE-Seq Package

#input:  ('xls_import.output'): file with columns for each condition, row.names as genes.
#output: "norm1_output":  normalized data

require("DESeq")
# remove duplicate row names, DEseq will not work otherwise *may check for loss of interesting genes

# do no need : parse1.output.no.dups = parse1.output[!(duplicated(row.names(parse1.output))),]
CountTable = xls_import.output
conditions = colnames(CountTable)
cds= newCountDataSet(floor(CountTable),conditions) 
cds=estimateSizeFactors(cds)
sizeFactors(cds)
Counts.norm = (counts(cds, normalized=TRUE) )
norm1.output = Counts.norm
