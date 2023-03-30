#'
#' R/sysdata.rda
#'
#' Internal data parsed by the `gene_lookup()` function if no input
#' file directory is specified in the `path` parameter.
#'
#' The data included contains a subset of the EDIR database
#' (from https://osf.io/m3gvx/ or http://193.70.34.71/EDIR.tar.gz)
#' representing the results for the gene GAA/ENSG00000171298 on
#' chromosome 17.
#'
#' `sysdata.rda` contains the `genes_chr` dataset of gene names and
#' corresponding chromosome numbers, as well as the  GAA subset of
#' EDIR. For the latter, the data is separated by the results of each
#' possible repeat lengths (7-20 bp) available in the EDIR database.
#'

# -----------
# IMPORT DATA
# -----------

# Genes and chromosomes table
gene_chr <- readRDS("C:/Users/rockp/AppData/Local/Packages/
                    CanonicalGroupLimited.Ubuntu18.04onWindows_
                    79rhkp1fndgsc/LocalState/rootfs/home/laura/
                    Data_input/genes_chromosome.rds")

# Get files (chr17 subset from EDIR database acquired from
# https://osf.io/m3gvx/ or http://193.70.34.71/EDIR.tar.gz)
dir <- "../../../AppData/Local/Packages/
    CanonicalGroupLimited.Ubuntu18.04onWindows_79rhkp1fndgsc
    /LocalState/rootfs/home/laura/EDIR_chr17"
files <- list.files(dir, pattern = "*_dist1000_*")
filenames <- unlist(lapply(files,
                           function(x) strsplit(x, "\\.")[[1]][1]))


# -----------------------
# SUBSETTING EDIR RESULTS
# -----------------------

# For each file
for (i in 1:length(files)) {
    file <- filenames[i]
    print(file)

    # Import data
    temp <- readRDS(paste0("../../../AppData/Local/Packages/
                           CanonicalGroupLimited.Ubuntu18.04onWindows_
                           79rhkp1fndgsc/LocalState/rootfs/home/laura/
                           EDIR_chr17/", file, ".rds"))

    # Extract GAA only results
    temp <- temp[which(temp$hgnc_symbol=="GAA"),]

    # Assign to variable with same name as file
    assign(file, temp)
}

# ----------------------------------------
# STORING AS sysdata.rda FOR INTERNAL DATA
# ----------------------------------------

# Save all files as list of "gene_chr" and individual dataframes from
# dataset. Stored in "R/sysdata.rda" for function parsing
save(list = c("gene_chr", filenames[1:length(filenames)]),
     file = "R/sysdata.rda",
     compress = "xz")
