get_Titles= function(url1){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(page)
  page= read_html(url1)
  Titles= page %>% html_nodes(".bookTitle span") %>% html_text()
  return(Titles)
}

