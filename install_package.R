# Package list to have
package.list <- 
  c('dplyr','ggplot2','data.table','stringr','XML','rvest','httr','tidyverse')

# Not installed packages among needed packages
not.found.packages <- 
  package.list[!package.list %in% installed.packages()[,1]]

# Set repos : cran.rstudio.com
repos <- c('https://cran.rstudio.com/')
names(repos) <- 'CRAN'

# install.packages
sapply(
  not.found.packages, 
  function(x) install.packages(pkgs=x, repos=repos, quiet=TRUE))

# load packages
sapply(
  package.list, 
  function(x) library(x, character.only=TRUE))

