# spsurvey.manuscript

### A Supplementary R Package to to "spsurvey: spatial sampling design and analysis in R"

##### Michael Dumelle<sup>1</sup>, Tom Kincaid<sup>1</sup>, Anthony R. Olsen<sup>1</sup>, Marc Weber<sup>1</sup>

##### <sup>1</sup>United States Environmental Protection Agency

### Abstract
spsurvey is an R package for design-based statistical inference, with a focus on spatial data. spsurvey provides the generalized random-tesselation stratified (GRTS) algorithm to select spatially balanced samples via the `grts()` function. The `grts()` function flexibly accomodates several sampling design features, including stratification, varying inclusion probabilities, legacy (or historical) sites, minimum distances between sites, and two options for replacement sites. spsurvey also provides a suite of data analysis options, including categorical variable analysis (`cat_analysis()`), continuous variable analysis (`cont_analysis()`), relative risk analysis (`relrisk_analysis()`), attributable risk analysis (`attrisk_analysis()`), difference in risk analysis (`diffrisk_analysis()`), change analysis (`change_analysis()`), and trend analysis (`trend_analysis()`). In this manuscript, we first provide background for the GRTS algorithm and the analysis approaches and then show how to implement them in spsurvey. We find that the spatially balanced GRTS algorithm yields more precise parameter estimates than alternative sampling approaches that ignore spatial information.

### Package Overview

This supplementary R package contains all files used in the creation of this document. Next we discuss how to use the package to access these files.

### Installation

To install the supplementary R package, either install the tarball provided alongside the submission or run
```r
install.packages("remotes") # if you don't already have remotes installed
remotes::install_github("USEPA/spsurvey.manuscript", ref = "main", dependencies = TRUE)
```

The package must be installed to view any of the files we discuss throughout this `README` on your machine. This package does not have to be installed to view any of these files if you want to look at them interactively using this GitHub repository.

To install the development vesion of spsurvey that corresponds to this submission, either install the tarball provided alongside the submission or run
```r
remotes::install_github("USEPA/spsurvey", ref = "develop")
```

### Replication Scripts

After installing the package, the replication scripts are available in the "replication" folder located on your machine at the file path found by running
```r
system.file("scripts/replication", package = "spsurvey.manuscript")
```

There are four files in this folder:

1. `code.Rmd`: An R Markdown document that contains 1) text explaining the code output and 2) the code output itself. Knitting this document yields two output files, `code.md`, and`code.html`, which we dicuss next.
2. `code.md`: A Markdown document that contains the output from `code.Rmd`. Rather than compiling `code.Rmd` itself, we recommend viewing the contents of `code.md` on this repository available [here](https://github.com/USEPA/spsurvey.manuscript/blob/main/inst/scripts/replication/code.md) (or by interactively navigating to inst/scripts/replication/code.md on this GitHub repository).
3. `code.html`: The HTML output viewable after knitting `code.Rmd`. However, we recommend using `code.md` to view the `code.Rmd` output.
4. `code.R`: An R script that contains comments that 1) briefly explains the code output and 2) contains the code output itself. However, we recommend using `code.Rmd` to run the code and `code.md` to view the output.

### Other Scripts

There are three other folders containing scripts located on your machine at the file path found by running
```r
system.file("scripts", package = "spsurvey.manuscript")
```

1. `simulation`: This folder contains the script used to perform the simulation discussed in the Application section of the manuscript.
2. `images`: This folder contains the scripts used to generate the figures in the manuscript.
3. `data_cleaning`: This folder contains the script used to clean the publicly available 2012 National Lakes Assessment data to put it into the format used for the simulation discussed in the Application section of the manuscript. 

### Data Availability

After loading the supplementary package, the raw data are available by running
```r
data("NLA12_keyvariables")
```
and the cleaned data are available by running
```r
data("NLA12")
```

### Manuscript

The files required to reproduce the manuscript are avaiable at the file path found by running
```r
system.file("rticle", package = "spsurvey.manuscript")
```
or available for viewing [here](https://github.com/USEPA/spsurvey.manuscript/blob/main/inst/rticle/rticle.pdf). To reproduce the manuscript, run `rticle.Rmd`. This manuscript was created using the rticles R package. More information about rticles is available [here](https://github.com/rstudio/rticles).

### Output 

Summary output from the simulation trials is available at the file path found by running
```r
system.file("output", package = "spsurvey.manuscript")
```
There are two `.csv` files:

1. `cat_summaries.csv`: Contains the summary output for the Atrazine presence simulations
2. `cont_summaries.csv`: Contains the summary output for the BMMI simulations

Raw simulation output for the Atrazine presence simulations is not included in the package installation but is available [here](https://github.com/USEPA/spsurvey.manuscript/blob/main/inst/output/cat_results.csv). Raw simulation output for the BMMI simulations is not included in the package installation but is available [here](https://github.com/USEPA/spsurvey.manuscript/blob/main/inst/output/cont_results.csv).

### Disclaimer

The views expressed in this manuscript are those of the authors and do not necessarily represent the views or policies of the U.S. Environmental Protection Agency. Any mention of trade names, products, or services does not imply an endorsement by the U.S. government or the U.S. Environmental Protection Agency. The U.S. Environmental Protection Agency does not endorse any commercial products, services, or enterprises.
