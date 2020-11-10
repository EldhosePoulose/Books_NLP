
get_Scores= function(url1){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(page)
  #page= read_html(page)
  page= read_html(url1)
  Score= page %>% html_nodes(".uitext a:nth-child(1)") %>% html_text()
  return(Score)
}
