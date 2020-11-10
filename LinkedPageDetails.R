# Project: Book Data Analytics
# Goal: Collect 1,000,000 Book Data
# @Author: Eldhose Poulose
# Start Date: 07.11.2020

## Updated version of basic.R --> Version2

## Updation: Able to extract more info from a single page

library(rvest)
library(dplyr)

# For 1 page/item
url= "https://www.goodreads.com/list/show/1.Best_Books_Ever?page="
pageNum=as.character(1)
url1= paste0(url,pageNum)

page= read_html(url1)
Titles= page %>% html_nodes(".bookTitle span") %>% html_text()
#Author= page %>% html_nodes(".authorName span") %>% html_text()
#Score= page %>% html_nodes(".uitext a:nth-child(1)") %>% html_text()
#CurrentVotes= page %>% html_nodes(".uitext .greyText+ a") %>% html_text()
#Ratings= page %>% html_nodes(".minirating") %>% html_text()

# For Linked pages
# Coming Up

# **I would like to collect more details which is present inside each book page**

# Col: Book URL, 
# Remember piping takes what is on left, and then what is on right. Thus, prefixURL + href that is represented as (dot)
prefixURL= "https://www.goodreads.com"
booksURL= page %>% html_nodes(".bookTitle") %>% html_attr("href") %>% paste0(prefixURL,.) 

# Function 1: For Collecting Description of each book
get_desc= function(booksURL){
  # booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  bookDescription= booksURL %>% read_html(.) %>% html_node("#description span+ span") %>% html_text()
  #booksURL %>% read_html(.) %>% html_node("#description span") %>% html_text() #for less
  return(bookDescription)
}

# Function 2: For Collecting ISBN of each book
get_ISBN= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  bookISBN= booksURL %>% read_html(.) %>% html_node("#bookDataBox .clearFloats .infoBoxRowItem .greyText") %>% html_text()
  return(bookISBN)
}

# Function 3: For Collecting the number of pages of each book
get_bookSize= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  bookSize= booksURL %>% read_html(.) %>% html_nodes("#details span~ span+ span") %>% html_text()
  if(!(grepl("pages",bookSize))){
    bookSize= booksURL %>% read_html(.) %>% html_nodes("#details .row span+ span") %>% html_text() 
  }
  if(length(bookSize)==0){
    bookSize= booksURL %>% read_html(.) %>% html_nodes("#details .row span+ span") %>% html_text() 
  }
  #OR
  #booksURL %>% read_html(.) %>% html_nodes("#details .row:nth-child(1) span~ span~ span") %>% html_text()
  return(bookSize)
}

# Function 4: For Collecting Language of each book
get_Language= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksURL="https://www.goodreads.com/book/show/1423.The_Compleat_Works_of_Wllm_Shkspr"
  print(booksURL)
  booksPage= read_html(booksURL)
  LanList=c("Arabic","Bosnian","Bulgarian","Catalan; Valencian","Croatian","Czech","Danish","Dutch","Elamite","English","English, Old (ca.450-1100)",
            "Estonian","Finnish","Galician","Georgian","Greek, Modern (1453-)","Gujarati","Hindi","Hungarian","Icelandic",
            "Indonesian","Italian","Multiple languages","Norse, Old","Norwegian","Persian","Polish","Portuguese","Romanian","Russian",
            "Serbian","Spanish","Swedish","Turkish","Ukrainian","Urdu")
  bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(3) .infoBoxRowItem") %>% html_text()
  if(length(bookLanguage!=0)){
    if(!(is.element(bookLanguage,LanList))){
      bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(2) .infoBoxRowItem ") %>% html_text()
    }
  } else{
    bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(2) .infoBoxRowItem ") %>% html_text()
  }
  return(bookLanguage)
}
# Function 5: For Collecting Characters/Actors of each book
get_Characters= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  Characters= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(5) .infoBoxRowItem") %>% html_text() %>% paste(collapse = ",")
  return(Characters)
}

# Function 6: Publishing year info
get_PubYear= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  PubYear= booksURL %>% read_html(.) %>% html_nodes(".row+ .row") %>% html_text()
  return(PubYear)
}

# Function 7: Number of Reviews 
get_Nreviews= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  booksPage= read_html(booksURL)
  Nreviews= booksURL %>% read_html(.) %>% html_node(".reviewControls--left.greyText") %>% html_text()
  return(Nreviews)
}

Description= sapply(booksURL, FUN= get_desc, USE.NAMES = FALSE)
ISBN= sapply(booksURL, FUN= get_ISBN, USE.NAMES = FALSE)
NPages= sapply(booksURL, FUN= get_bookSize, USE.NAMES = FALSE)
Language= sapply(booksURL, FUN= get_Language, USE.NAMES = FALSE)
Characters= sapply(booksURL, FUN= get_Characters, USE.NAMES = FALSE)
PubYear= sapply(booksURL, FUN= get_PubYear, USE.NAMES = FALSE)
Nreviews= sapply(booksURL, FUN= get_Nreviews, USE.NAMES = FALSE)


Language= as.character(Language)
NPages= as.character(NPages)
PubYear= as.character(PubYear)
#page1
bestBooksEver1= data.frame(Titles,Author,ISBN,NPages,PubYear,Language,Characters,Score,CurrentVotes,Ratings,Nreviews,booksURL,stringsAsFactors = FALSE)
View(bestBooksEver1)
#write.csv(bestBooksEver1, "bestBooksEverGoodReads.csv")


# **Now scrape from other pages
# The fist step is to identify how the URL changes when you move around the pages





