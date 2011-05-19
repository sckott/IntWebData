# Development of a package for interfacing with 
# the Interaction Web Database (http://www.nceas.ucsb.edu/interactionweb/)
# intwebdata.R

# Load packages
require(gdata); require(plyr)

# URL's of datasets
AkatoreA <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/AkatoreA.xls"
AkatoreB <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/AkatoreB.xls"
Catlins <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Catlins.xls"
Berwick <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Berwick.xls"
Venlaw <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Venlaw.xls"
Narrowdale <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Narrowdale.xls"
Blackrock <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Blackrock.xls"
Broad <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Broad.xls"
Canton <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Canton.xls"
DempstersSu <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/DempstersSu.xls"
DempstersAu <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/DempstersAu.xls"
DempstersSp <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/DempstersSp.xls"
German <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/German.xls"
Healy <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Healy.xls"
LilKyeburn <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/LilKyeburn.xls"
Stony <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Stony.xls"
SuttonSu <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/SuttonSu.xls"
SuttonAu <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/SuttonAu.xls"
SuttonSp <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/SuttonSp.xls"
Kyeburn <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Kyeburn.xls"
Northcol <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Northcol.xls"
Powder <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Powder.xls"
Troy <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Troy.xls"
Martins <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Martins.xls"
Coweeta17 <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Coweeta17.xls"
Coweeta1 <- "http://www.nceas.ucsb.edu/interactionweb/data/predator_prey/excel_matrices/Coweeta1.xls"

# Function to get data from Interaction Web Database (IWD)
# Outputs data sets in a list 
# datasets: is a list of dataset names
get_IWD_data <- function(datasets) {
  dats <- as.list(datasets)
  dat_list <- llply(dats, read.xls)
}

#listurls <- list(AkatoreA, AkatoreB, Catlins, Berwick, Venlaw, Narrowdale, 
#    Blackrock, Broad, Canton, DempstersSu, DempstersAu, DempstersSp, German, 
#    Healy, LilKyeburn, Stony, SuttonSu, SuttonAu, SuttonSp, Kyeburn, Northcol, 
#    Powder, Troy, Martins, Coweeta17, Coweeta1)
    
# Example
AkatoreA_dat <- get_IWD_data(AkatoreA)
AkatoreA_B_dat <- get_IWD_data( c(AkatoreA, AkatoreB) )

# Function to get taxon names from downloaded data sets
get_IWD_names <- function(y) {
  get_names <- function(x) {
    temp1 <- names(x)[-1]
    temp2 <- as.vector(x[, 1])
    temp <- c(temp1, temp2)
    return(temp)
  }
  tax_names <- laply(y, get_names)
  return(tax_names)
}

# Example
akatore_names <- get_IWD_names(AkatoreA_dat)
get_IWD_names(AkatoreA_B_dat)

# Query the IWD
# query: species name, or genus name, etc.
query_IWD <- function(query) {
  
}

# Example query
query_IWD(akatore_names, "Zelandotipula")



