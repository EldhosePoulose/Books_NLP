# Feature 3: For Collecting the number of pages of each book
get_bookSize= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  print("reading NPage")
  bookSize= booksURL %>% read_html(.) %>% html_nodes("#details span~ span+ span") %>% html_text()
  #print(bookSize)
  if(length(bookSize)!=0){
    if(!(grepl("pages",bookSize))){
      bookSize= booksURL %>% read_html(.) %>% html_nodes("#details .row span+ span") %>% html_text() 
      #print(bookSize)
    }
  }
  if(length(bookSize)==0){
    bookSize= booksURL %>% read_html(.) %>% html_nodes("#details .row span+ span") %>% html_text()
    #print(bookSize)
  }
  #booksURL %>% read_html(.) %>% html_nodes("#details .row:nth-child(1) span~ span~ span") %>% html_text()
  return(bookSize)
}
