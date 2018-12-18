library("bibliometrix")

all <- readFiles("data/web_of_science_core.txt")
all <- isi2df(all)
all.results <- biblioAnalysis(all)
all.summary <- summary(object = all.results, k = 10, pause = FALSE)


test <- readFiles("~/Downloads/lancet.bib")
test.s <- convert2df(test, dbsource = "scopus", format = "bibtex")
s.results <- biblioAnalysis(test.s)
s.summary <- summary(object = s.results, k = 10, pause = FALSE)