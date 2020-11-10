# Feature 7: Number of Reviews 
get_Nreviews= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  Nreviews= booksURL %>% read_html(.) %>% html_node(".reviewControls--left.greyText") %>% html_text()
  return(Nreviews)
}
