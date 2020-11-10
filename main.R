# Project: Book Data Analytics
# Goal: Collect 1,000,000 Book Data
# @Author: Eldhose Poulose
# Start Date: 07.11.2020
# Last edit: 10.11.2020

# multiplePage.R --> Version4 TDD 

# Requirements
library(rvest)
library(dplyr)

#Source all Feature Files: 
source("description.R")
source("ISBN.R")
source("NPages.R")
source("BookLanguage.R")
source("Actors.R")
source("PublicationYear.R")
source("ReviewCount.R")
source("Titles.R")
source("Author.R")
source("Scores.R")
source("CurrentVotes.R")
source("Ratings.R")
source("booksURL.R")


## **MAIN SECTION**

url= "https://www.goodreads.com/list/show/1.Best_Books_Ever?page="
bestBooksEver= data.frame() # for storing the metadata

for(page_result in seq(from=1, to=1, by=1)) {
  old=  Sys.time()
  url1= paste0(url,page_result)
  print(url1)
  
  Titles= get_Titles(url1)
  new=  Sys.time()-old
  print(paste("finished_Titles: Page: ",page_result,new))
  
  Author= get_Authors(url1)
  new=  Sys.time()-old
  print(paste("finished_Author: Page: ",page_result,new))
  
  Score= get_Scores(url1)
  new=  Sys.time()-old
  print(paste("finished_Score: Page: ",page_result,new))
  
  CurrentVotes= get_CurrentVotes(url1)
  new=  Sys.time()-old
  print(paste("finished_CVotes: Page:  ",page_result,new))
  
  Ratings= get_Ratings(url1)
  new=  Sys.time()-old
  print(paste("finished_Ratings: Page: ",page_result,new))
  
  booksURL= get_booksURLs(url1)
  new=  Sys.time()-old
  print(paste("finished_booksURL: Page:  ",page_result,new))
  
  Description= sapply(booksURL, FUN= get_desc, USE.NAMES = FALSE)
  new=  Sys.time()-old
  print(paste("finished_Description: Page: ",page_result,new))
  
  Characters= sapply(booksURL, FUN= get_Characters, USE.NAMES = FALSE)
  new=  Sys.time()-old
  print(paste("finished_Characters: Page: ",page_result,new))
  
  Nreviews= sapply(booksURL, FUN= get_Nreviews, USE.NAMES = FALSE)
  new=  Sys.time()-old
  print(paste("finished_Nreviews:  Page: ",page_result,new))
  
  ISBN= sapply(booksURL, FUN= get_ISBN, USE.NAMES = FALSE)
  new=  Sys.time()-old
  print(paste("finished_ISBN: Page: ",page_result,new))
  
  NPages= sapply(booksURL, FUN= get_bookSize, USE.NAMES = FALSE)
  NPages= as.character(NPages)
  new=  Sys.time()-old
  print(paste("finished_NPages: Page: ",page_result,new))
  
  Language= sapply(booksURL, FUN= get_Language, USE.NAMES = FALSE)
  Language= as.character(Language)
  new=  Sys.time()-old
  print(paste("finished_Language: Page: ",page_result,new))
  
  PubYear= sapply(booksURL, FUN= get_PubYear, USE.NAMES = FALSE)
  PubYear= as.character(PubYear)
  new=  Sys.time()-old
  print(paste("finished_PubYear: Page: ",page_result,new))
  
  bestBooksEver1= rbind(bestBooksEver,data.frame(Titles,Author,ISBN,NPages,PubYear,Language,Characters,Score,CurrentVotes,Ratings,Nreviews,booksURL,stringsAsFactors = FALSE))
  new=  Sys.time()-old
  print(paste("Finished Page: ",page_result,new))
}

#View(bestBooksEver1)
# write.csv(bestBooksEver1, "bestBooksEverGoodReads.csv")

