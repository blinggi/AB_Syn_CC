# linggi August 1,2013
# updated Aug 19,2012
# munge script for csv files for Belieav data
# input : csv files for each condition. Sent from meng. Have "RPKM" column.  Use gene column "Transcripts" for ids (same for each)
# output: ('parse1_output') dataframe. with row.names as gene symbol or locus id.  Col.names as condition_descriptors, each column is rpkm value


#get data files from workspace after auto data import (all have name 'MM')
#get from workspace names



# TO DO automate this..

# have to manually input the columns of the data here, then add the names in line 17
all.RPKM = cbind(cbind(Beleav.080213.AB.3.1.Highlight.highO2$RPKM),cbind(Beleav.080213.AB.3.2.lowlight.highO2$RPKM),cbind(Beleav.080213.AB.3.3.lowlight.lowO2$RPKM), cbind(Beleav.080213.AB.3.4.HighLight.low02$RPKM)) # 11, 6, 9
colnames(all.RPKM) = c('HL_HO2', 'LL_HO2','LL_LO2','HL_LO2')
rownames(all.RPKM)=Beleav.080213.AB.3.1.Highlight.highO2$X.Gene.ID
# remove rows that have 'gene', this is duplicated in this output (Lifescope)
parse1.output=all.RPKM[!grepl('gene',row.names(all.RPKM)),]
