# Megajournal Source Analysis

## TEST

This is a test project. Not active as of Tue 18 Dec 2018.

---

Do a comprehensive search in the journals below and look at relevance ranking 
and see how differences impact the ranking.

1. Examine the relevance ranking 

- the appearance of the keywords in the title
  - the position of the keywords
  - whether both keywords are included
  - whether the keyword appears in the abstract
  - whether the keyword appears in the author supplied keywords
- the number of times cited
- the number of cited references
- the year of publication
- whether it's a traditional journal or a megajournal

2. Model differences in ranking between traditional journals and megajournals


## Data Collection

Need to repeat these queries in the additional databases but also figure out 
how to sort by relevance in PubMed.gov, because when I do right now, the result 
is 0.

PubMed.gov

Date: 2017-05-04

These are searches for the title keyword "cancer" for each individual journal for the dates 2012-01-01 through 2016-12-31. The total equal the amount when I include all titles in the search query.

Lancet:
("0140 6736"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results = 335

NEJM:
("0028 4793"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results = 482

JAMA:
("0098 7484"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results = 314

Nature:
("0028 0836"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results = 318

BMJ Open:
("2044 6055"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results = 325

PLOS ONE:
("1932 6203"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND (cancer[Title])
Results: 6806

Include all journal ISSN numbers and the total equals the same as above:

("0140 6736"[Journal] OR "0028 4793"[Journal] OR "0098 7484"[Journal] OR "0028 0836"[Journal] OR "2044 6055"[Journal] OR "1932 6203"[Journal] AND ("2012/01/01"[PDAT] : "2016/12/31"[PDAT])) AND 
(cancer[Title])

Results = 8580
