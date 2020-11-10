
# Feature 4: For Collecting Language of each book
get_Language= function(booksURL){
  #booksURL="https://www.goodreads.com/book/show/1423.The_Compleat_Works_of_Wllm_Shkspr"# for testing
  #print(booksURL)
  booksPage= read_html(booksURL)
  LanList=c("Arabic","Bosnian","Bulgarian","Catalan; Valencian","Croatian","Czech","Danish","Dutch","Elamite","English","English, Old (ca.450-1100)",
            "Estonian","Finnish","Galician","Georgian","Greek, Modern (1453-)","Gujarati","Hindi","Hungarian","Icelandic",
            "Indonesian","Italian","Multiple languages","Norse, Old","Norwegian","Persian","Polish","Portuguese","Romanian","Russian",
            "Serbian","Spanish","Swedish","Turkish","Ukrainian","Urdu")
  bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(3) .infoBoxRowItem") %>% html_text()
  if(length(bookLanguage!=0)){
    if(!(is.element(bookLanguage,LanList))){
      bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(2) .infoBoxRowItem ") %>% html_text()
    }
  } else{
    bookLanguage= booksURL %>% read_html(.) %>% html_nodes(".clearFloats:nth-child(2) .infoBoxRowItem ") %>% html_text()
  }
  return(bookLanguage)
}