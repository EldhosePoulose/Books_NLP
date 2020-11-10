# Feature 5: For Collecting Characters/Actors of each book
get_Characters= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  Characters= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(5) .infoBoxRowItem") %>% html_text() %>% paste(collapse = ",")
  return(Characters)
}