# Feature 1: For Collecting Description of each book
get_desc= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  bookDescription= booksURL %>% read_html(.) %>% html_node("#description span+ span") %>% html_text()
  #booksURL %>% read_html(.) %>% html_node("#description span") %>% html_text() #for less
  return(bookDescription)
}