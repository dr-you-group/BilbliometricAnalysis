# #https://www.bibliometrix.org/
# #https://github.com/massimoaria/pubmedR
# #https://github.com/massimoaria/bibliometrix

# #Develop version
# install.packages("devtools")
# devtools::install_github("massimoaria/pubmedR")
# devtools::install_github("massimoaria/bibliometrix")

# #Insetall stable version
# install.packages("pubmedR")
# install.packages("bibliometrix")

library(bibliometrix)

Sys.setlocale("LC_ALL", "C") #To avoid error because of local language configuration

api_key <- NULL
query <- "Seng Chan You[au]"
res <- pubmedR::pmQueryTotalCount(query = query, api_key = api_key)
res$total_count#67

D <- pubmedR::pmApiRequest(query = query, limit = res$total_count, api_key = NULL)
M <- convert2df(D, dbsource = "pubmed", format = "api")
results <- bibliometrix::biblioAnalysis(M, sep = ";")

#co-author matrix
A <- cocMatrix(M, Field = "AU", sep = ";")