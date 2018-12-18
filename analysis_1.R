library("dplyr")

all_articles <- read.csv("data/byjournal/all_results/all_articles_no_titles.csv")

all_articles$database <- factor(all_articles$database,
                                levels = c("pubmed", "ebsco", "proquest",
                                           "wos_medline", "wos_core", "scopus"),
                                labels = c("pubmed", "ebsco", "proquest",
                                           "wos_medline", "wos_core", "scopus"),
                                ordered = TRUE)


## These numbers are the totals for each search
# MEDLINE databases (Pubmed, Ebsco, Proquest, Web of Science Medline)
lancet_med <- c(182,170,172,180)
nejm_med   <- c(184,183,183,183)
jama_med   <- c(148,148,148,152)
bmj_med    <- c(337,650,337,337)
plos_med   <- c(6925,6923,6923,6925)

# General databases (Web of Science Core Collection, Scopus)
lancet_gen <- c(78,75)
nejm_gen   <- c(123,143)
jama_gen   <- c(60,73)
bmj_gen    <- c(311,301)
plos_gen   <- c(6978,6893)

# per database category

medline_db <- read.csv("data/byjournal/all_results/medline_databases_no_titles.csv")
general_db <- read.csv("data/byjournal/all_results/general_databases_no_titles.csv")

medline_db$database <- factor(medline_db$database,
                              levels = c("pubmed", "ebsco", "proquest", "wos_medline"),
                              labels = c("pubmed", "ebsco", "proquest", "wos_medline"),
                              ordered = TRUE)

general_db$database <- factor(general_db$database,
                              levels = c("wos_core", "scopus"),
                              labels = c("wos_core", "scopus"),
                              ordered = TRUE)


table(medline_db$journal, medline_db$check)
table(medline_db$database, medline_db$check)
        
## Table 3 in manuscript
# MEDLINE databases
med_tab <- xtabs(check ~ journal + database, data = medline_db)

# General databases
gen_tab <- xtabs(check ~ journal + database, data = general_db)

# Percent overlap for MEDLINE databases
(80 - sum(med_tab[1,])) / 80 # bmjopen
(80 - sum(med_tab[2,])) / 80 # jama
(80 - sum(med_tab[3,])) / 80 # lancet
(80 - sum(med_tab[4,])) / 80 # nejm
(80 - sum(med_tab[5,])) / 80 # plosone

# Percent overlap for General databases
(40 - sum(gen_tab[1,])) / 40 # bmjopen
(40 - sum(gen_tab[2,])) / 40 # jama
(40 - sum(gen_tab[3,])) / 40 # lancet
(40 - sum(gen_tab[4,])) / 40 # nejm
(40 - sum(gen_tab[5,])) / 40 # plosone

---
# calulate idf
lancet_tot <- 1337
nejm_tot   <- 1515
jama_tot   <- 937
bmj_tot    <- 5621
plos_tot   <- 133873
        
idf <- function(N, d) {
        log2(N) - log2(mean(d)) + 1
}

idf(lancet_tot, lancet_med)
idf(nejm_tot, nejm_med)
idf(jama_tot, jama_med)
idf(bmj_tot, bmj_med)
idf(plos_tot, plos_med)

idf(lancet_tot, lancet_gen)
idf(nejm_tot, nejm_gen)
idf(jama_tot, jama_gen)
idf(bmj_tot, bmj_gen)
idf(plos_tot, plos_gen)

journals  <- c("Lancet", "NEJM", "JAMA", "BMJ Open", "PLOS ONE")
idf_m     <- c(3.9, 4, 3.7, 4.8, 5.3)
idf_g     <- c(5.1, 4.5, 4.8, 5.2, 5.3)
overlap_m <- c(0.125, 0.238, 0.30, 0.163, 0.0)
overlap_g <- c(0.05, 0.025, 0.075, 0.025, 0.0)
idf_df    <- data.frame(journals, idf_m, idf_g, overlap_m, overlap_g) 

table(idf_m, overlap_m)
table(idf_g, overlap_g)

library("ggplot2")
m <- ggplot(idf_df, aes(x = idf_m, y = overlap_m, label = journals))
m + geom_point() + geom_text() + theme_bw() +
        xlab("IDF MEDLINE Databases") +
        ylab("Overlap")

g <- ggplot(idf_df, aes(x = idf_g, y = overlap_g, label = journals))
g + geom_point() + geom_text() + theme_bw() +
        xlab("IDF General Databases") +
        ylab("Overlap")
