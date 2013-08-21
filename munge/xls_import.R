# linggi aug 20,2013
# input : 1. xlsx file with sheets for each condition, has columns for RPKM and gene id
# output : 'xls.output' dataframe with a column for each condition, rownames for gene id
require("XLConnect")
# get names of xlsx files in data folder to process. 

xls.files = list.files(pattern='*.xlsx')

# loop through files, get data out and export as dataframe
for (j in 1:length(xls.files)){
  xls.working.1 =loadWorkbook(xls.files[j])
  
  #get names of conditions
  xls.conditions = getSheets(xls.working.1)
  rows = length(readWorksheet(xls.working.1, sheet =1)$RPKM)
  cols = length(xls.conditions)
  # create data frame and fill columns with RPKM data from xls sheets
  RPKM.list  = data.frame(matrix(NA, nrow = rows, ncol = cols))
  for (i in 1:length(xls.conditions)){
    
    RPKM.list[,i]= readWorksheet(xls.working.1, sheet=i)$RPKM
  }
  # add annotations
  row.names(RPKM.list) = readWorksheet(xls.working.1, sheet=i)$Transcripts
  colnames(RPKM.list) = xls.conditions
  
  xls.output = RPKM.list
  #output data with name from filename!! yeah
  assign(xls.files[j],RPKM.list)
}
A= Beleav_080213_meng.xlsx 
B= BelieavCoculture_120731_meng_SynOnly.xlsx
xls_import.output = cbind(A,B)
#8/21/13 code looks good. spot checked with a few points from original data