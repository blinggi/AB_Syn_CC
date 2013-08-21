# linggi Aug 1, 2013
# add annotations to Belieav data. Use Margie's annotation set
# input: FC.all.conds
# output: 'annotate.output'

# prep ref annotitions
ref.annotions = read.csv('ref_files/7002_full_annots.csv')

# move over the id of interested into row.names, make only 4 last character (**specfic to this list)
short_IDS = sapply(as.character(ref.annotions$Locus.tag), FUN = function(x){substr(x,nchar(x)-4, nchar(x))})
# make a shortened version for each match, put in row.names
shortID.ref.annotations = cbind(short_IDS,ref.annotions)

# prep row names from data to match ref
annotate1.working = FC.all.conds
# pull out part of list #that matches ref.annotation format, use underscore to find end
row.names(annotate1.working)=sapply(row.names(annotate1.working), FUN = function(x){substr(x, regexpr('_',x)+1,  nchar(x))})
# ** currently (08/1/13), the above has some gene symbols left over, need to fix orignal mapping 


#grab annotations for genes in annotate1.working
picked.annots = ref.annotions[match(row.names(annotate1.working),shortID.ref.annotations$short_IDS),]
# add annotations to data
annotate.output = cbind(annotate1.working,picked.annots)