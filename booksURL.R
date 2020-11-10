

get_booksURLs= function(url1){
  #booksURL="https://www.goodreads.com/book/show/2767052-the-hunger-games" # for testing
  #print(page)
  #page= read_html(page)
  page= read_html(url1)
  prefixURL= "https://www.goodreads.com"
  booksURL= page %>% html_nodes(".bookTitle") %>% html_attr("href") %>% paste0(prefixURL,.) 
  return(booksURL)
}
