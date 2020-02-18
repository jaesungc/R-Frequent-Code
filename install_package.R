# Packages to be installed
package.list <- 
  c('dplyr','ggplot2','data.table','stringr','XML','rvest','httr','tidyverse','gmailr','lubridate','RSelenium')

# Not installed packages among needed packages
not.found.packages <- 
  package.list[!package.list %in% installed.packages()[,1]]

# install.packages
install.packages(not.found.packages)
