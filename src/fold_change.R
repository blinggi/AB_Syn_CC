# linggi, stared:Aug 6, 2013
# using git to version control
# fold change calculation for RNA-seq data.
# input: 'norm.output': has 3 columns of data and other columns 
# output: "FC.all.conds': fold change values between all compbinations with col labels that inform with direction change is happening. Do not use any cuttoff. 

fold.change.working.1 = as.data.frame(norm1.output)

# remove any 0 value to all fold change calc to be a real number
fold.change.working.1[fold.change.working.1==0] = .123
attach(fold.change.working.1)

#need to get names automatically and perform division calcs

# need to annotate below for conditions (automate TODO)
# pick control columns, all will be divided by it
control.col = 1

#get index of all other columns
test.cols.names = setdiff(colnames(fold.change.working.1),name.for.fold.change.column)
name.for.fold.change.column = colnames(fold.change.working.1)[control.col]

fold.change.working.2 = data.frame(matrix( NA, ncol =length(test.cols.names) , nrow= nrow(fold.change.working.1) ))
for (v in 1:length(test.cols.names))
{
  fold.change.working.2[,v]=fold.change.working.1[,control.col]/fold.change.working.1[,test.cols.names[v]]
}

# get col titles for fold change cols
fc.col.name.list = list()
for (a in 1:length(test.cols.names))
{
fc.col.name.list[a] = paste(name.for.fold.change.column,'div',test.cols.names[a])
}
colnames(fold.change.working.2) = fc.col.name.list

FC.all.conds=cbind(fold.change.working.1,fold.change.working.2)

