# EDIRquery
---
## Introduction 

Intragenic exonic deletions are known to contribute to genetic diseases and are 
often flanked by regions of homology. The Exome Database of Interspersed Repeats
(EDIR) was developed to provide an overview of the positions of repetitive 
structures within the human genome composed of interspersed repeats encompassing
a coding sequence. 

The package `EDIRquery` provides user-friendly tools to query
this database for genes of interest.


&nbsp;
### Dataset

EDIR provides a dataset of pairwise repeat structures in which both sequences are located within a maximum of 1000 bp from each other, differ by at most a 1-bp mismatch, and and fulfill one of the following selection criteria:

-   \>= 1 repeat located in an exon
-   Both repeats situated in different introns flanking one or more exons

Example data provided includes a subset of the data for the gene GAA 
(ENSG00000171298) on chromosome 17. 

To query the full the database, download the files at the link below, and provide 
the data directory to `gene_lookup()` in the `path` parameter.

&nbsp;
### Usage
#### Installation
To install this package, enter the following in R:

```{r, eval=FALSE}
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("EDIRquery")
```

Then load the package:


```{r}
library("EDIRquery")
```

&nbsp;

EDIR can easily be queried using the `gene_lookup` function, using the gene name
and additional parameters:

| Argument | Description                                                                                                                                       | Default |
|----------------|---------------------------------------------|-----------|
| gene     | **required:** The gene name (ENSEMBLE ID or HGNC symbol)                                                                                          | \-      |
| length   | Repeat sequence length, must be between 7 and 20. If NA, results will include all available lengths in dataset for queried gene  | NA      |
| mindist  | Minimum spacer distance (bp) between repeats        | 0       |
| maxdist  | Maximum spacer distance (bp) between repeats                                                                                                      | 1000    |
| summary  | Logical value indicating whether to store summary                                                                                               | FALSE   |
| mismatch | Logical value indicating whether to allow 1 mismatch in sequence                                                                                  | TRUE    |
| path     | String containing path to directory holding downloaded dataset files. If not provided (`path = NA`), example subset of data will be used | NA      |

A summary of the input printed to console, including the gene name, gene length 
(bp), Ensembl transcript ID, queried distance between repeats (default: 0-1000 
bp), and an overview of total results for the given repeat length. Console 
outputs include runtime.

&nbsp;
### Examples

Example querying the gene "GAA" with repeats of length 7, and allowing for 
1 mismatch:

```{r}
# Summary of results (printed to console)
gene_lookup("GAA", length = 7, mismatch = TRUE)
```

If no `length` is provided, a summary of all available repeat length results will
be printed:

```{r}
# Summary of results (printed to console)
gene_lookup("GAA", mismatch = TRUE)
```

Storing the output in a variable allows viewing of the individual results in the 
output dataframe:

```{r}
# Database output of query
results <- gene_lookup("GAA", length = 7, mismatch = TRUE)
head(results)
```
---
## Links
- Full dataset download: 
  - https://osf.io/m3gvx/
  - [Direct download](http://193.70.34.71/EDIR.tar.gz)

---
## Contact
Laura DT Vo Ngoc: doan.vongoc@vub.be
