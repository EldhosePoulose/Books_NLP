get_Ratings= function(url1){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(page)
  #page= read_html(page)
  page= read_html(url1)
  Ratings= page %>% html_nodes(".minirating") %>% html_text()
  return(Ratings)
}
