# for windows
# for mac
# read info/Credits: https://anderfernandez.com/en/blog/how-to-automate-r-scripts-on-windows-and-mac/
#install.packages("cronR")
library(cronR)
Rfile="/Users/pouloeld/Documents/R_Projects/Goodreads/Books_NLP/MultiplePage.R"
cmd= cron_rscript(Rfile)

# cron_add
# Change security options in mac for cron which is located in usr/sbin/bin, R, Rstudio
# to use add in interface use the below packages
# install.packages("miniUI")
# install.packages("shiny")
# install.packages("shinyFiles")
# library(miniUI)
# library(shiny)
# library(shinyFiles)