# Feature 6: Publishing year info
get_PubYear= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  PubYear= booksURL %>% read_html(.) %>% html_nodes(".row+ .row") %>% html_text()
  return(PubYear)
}
