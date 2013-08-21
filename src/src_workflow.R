# linggi Aug 5, 2013
# combine all src in correct order
# input: project with data, labelled as in munge folder code
# output: write a .csv file with date'workflow.output'. has fold changes of all combos (no cuttoff), with annotations. .#
#   This file will be in the "output" folder and will need to be polished and then put in "report" folder

setwd('/Volumes/Documents/R_onAir/Belieav_RNA_Rproj/Syn_CC_Belieav_RNA_projtemp  /')
load.project()
setwd('/Volumes/Documents/R_onAir/Belieav_RNA_Rproj/Syn_CC_Belieav_RNA_projtemp  /')
source('./src/norm1.R')
source('./src/fold_change.R')
source('./src/annotate.R')
setwd('output/')
write.csv(annotate.output,paste("workflow_output",Sys.time(),'.csv'))
