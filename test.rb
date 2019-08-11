  
 
require 'nokogiri'
require 'open-uri'

def movie_ranker_scraper
  
  html = File('https://www.ranker.com/crowdranked-list/the-best-movies-of-all-time')
  ranker = Nokogiri::HTML(open("https://www.ranker.com/crowdranked-list/the-best-movies-of-all-time"))
  
  movies = {}
  
    ranker.css("listItem.listItem__h2.listItem__h2--grid.-nvscdSdow__r2--zyzEz.pointer.listItem__h2--buyButton.flex.relative.robotoC").each do |movie|
 title = movie.css("div.listItem__data span.listItem__info.block a").text
    movies[title] = {
      rank:           movie.css("ul.project-meta span.location-name").text,
      description: 	  movie.css("div.listItem__data span.listItem__props.block div.listItem__blather.grey.default span").text,
      actors:         movie.css("div.listItem__data span.listItem__props.block span").text
    }
  end 
  puts movies

end

movie_ranker_scraper