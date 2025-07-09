# ================================
# INSTALL ALL PACKAGES FROM FILE
# ================================

# 1. Install & Load Base Tools
install_if_missing <- function(pkg) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
}

# Install base installers
install_if_missing("devtools")
install_if_missing("remotes")
install_if_missing("BiocManager")

# 2. Install Bioconductor Packages
BiocManager::install("EBImage")
BiocManager::install("ComplexHeatmap")

# 3. Install GitHub Packages
devtools::install_github("andersst91/UAStools")
devtools::install_github('allogamous/EnvRtype')
devtools::install_github("rfn-qtl/SoilType")
remotes::install_github("rstudio/tensorflow")
devtools::install_github("rstudio/keras")
# regarding keras and tensor flow, in case of issue, please take a look at
#https://tensorflow.rstudio.com/install/

# 4. Install Source File (if needed)
source("https://raw.githubusercontent.com/allogamous/EnvRtype/master/Supplementary%20Source%20and%20Data/get_weather_v2")

# 5. Install CRAN Packages (deduplicated and normalized)
cran_packages <- c(
  "magick", "imager", "magrittr", "raster", "sp", "sf", "rlas", "data.table", "pliman", 
  "tidyr", "doParallel", "iterators", "foreach", "lidR", "png", "terra", "ggplot2", 
  "heatmaply", "caretEnsemble", "caret", "lattice", "superheat", "abind", "Cairo", 
  "keras3", "tensorflow", "reticulate", "factoextra", "cluster", "lubridate", "forcats", 
  "dplyr", "purrr", "readr", "tibble", "tidyverse", "stringr", "SoilType", "EnvRtype", 
  "viridis", "viridisLite", "plotly"
)

# Deduplicate and install
cran_packages <- unique(cran_packages)
for (pkg in cran_packages) {
  install_if_missing(pkg)
}