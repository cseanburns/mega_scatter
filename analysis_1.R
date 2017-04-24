library("bibliometrix")

nejmdf <- readLines('/home/sean/Dropbox/workspace/mega_scatter/data/nejm.txt')
nejmdf <- isi2df(nejmdf)
nejm.biblio <- biblioAnalysis(nejmdf)
nejmd.sources <- nejm.biblio$Sources

jamadf <- readLines('/home/sean/Dropbox/workspace/mega_scatter/data/jama.txt')
jamadf <- isi2df(jamadf)
jama.biblio <- biblioAnalysis(jamadf)
jama.sources <- jama.biblio$Sources

lancetdf <- readLines('/home/sean/Dropbox/workspace/mega_scatter/data/lancet.txt')
lancetdf <- isi2df(lancetdf)
lancet.biblio <- biblioAnalysis(lancetdf)
lancet.sources <- lancet.biblio$Sources

pldf <- readLines('/home/sean/Dropbox/workspace/mega_scatter/data/plosone.txt')
pldf <- isi2df(pldf)
pl.biblio <- biblioAnalysis(pldf)
pl.sources <- pl.biblio$Sources

bmjdf <- readLines('/home/sean/Dropbox/workspace/mega_scatter/data/bmjopen.txt')
bmjdf <- isi2df(bmjdf)
bmj.biblio <- biblioAnalysis(bmjdf)
bmj.sources <- bmj.biblio$Sources
