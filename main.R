
# Project: Book Data Analytics
# Goal: Collect 1,000,000 Book Data
# @Author: Eldhose Poulose
# Start Date: 07.11.2020

install.packages(c("rvest","dplyr"))
library(rvest)
library(dplyr)

# For 1 page
url= "https://www.goodreads.com/list/show/1.Best_Books_Ever?page="
pageNum=as.character(1)
url1= paste0(url,pageNum)

page= read_html(url1)
Titles= page %>% html_nodes(".bookTitle span") %>% html_text()
Author= page %>% html_nodes(".authorName span") %>% html_text()
Score= page %>% html_nodes(".uitext a:nth-child(1)") %>% html_text()
CurrentVotes= page %>% html_nodes(".uitext .greyText+ a") %>% html_text()
Ratings= page %>% html_nodes(".minirating") %>% html_text()
#AvgRating= page %>% html_nodes("") %>% html_text()

books= data.frame(Titles,Author,Ratings,Score,CurrentVotes,stringsAsFactors = FALSE)
View(books)

# For Linked pages
# Coming Up