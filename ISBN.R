# Feature 2: For Collecting ISBN of each book
get_ISBN= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  bookISBN= booksURL %>% read_html(.) %>% html_node("#bookDataBox .clearFloats .infoBoxRowItem .greyText") %>% html_text()
  return(bookISBN)
}
