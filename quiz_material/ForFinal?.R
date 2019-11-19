### Gizzard Shad ###
# M.J. Vanni and J.A. Gephart. 2011. Metabolic ecology: How do body size and
# temperature affect nutrient cycling rates? Teaching Issues and Experiments 
# in Ecology 7: March. 
# https://tiee.esa.org/vol/v7/issues/data_sets/vanni/abstract.html
# M. H. Schaus M. J. Vanni T. E. Wissing M. T. Bremigan J. E. Garvey R. A. 
# Stein. Nitrogen and phosphorus excretion by detritivorous gizzard shad in a 
# reservoir ecosystem. 1997. Limnology and Oceanography 42: 1386-1397.
shad <- read_csv("datasets/exams/shad.csv")
pairs(shad[,2:4])
