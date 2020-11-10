get_CurrentVotes= function(url1){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(page)
  #page= read_html(page)
  page= read_html(url1)
  CurrentVotes= page %>% html_nodes(".uitext .greyText+ a") %>% html_text()
  return(CurrentVotes)
}
