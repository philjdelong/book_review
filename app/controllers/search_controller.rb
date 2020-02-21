class SearchController < ApplicationController

   def index
      return @nyt_conn if @nyt_conn
      @nyt_conn = Faraday.new(url: "https://api.nytimes.com/svc/books/v3/reviews.json") do |f|
         f.params['api-key'] = ENV['NYT_API_KEY']
         f.params['title'] = params['title']
         f.adapter Faraday.default_adapter
      end

      nyt_response = @nyt_conn.get.env.response_body
      nyt_parsed = JSON.parse(nyt_response)
      @nyt_reviews = nyt_parsed["results"]
      
      return @lib_conn if @lib_conn
      @lib_conn = Faraday.new(url: "http://openlibrary.org/search.json?") do |f|
         f.params['title'] = params['title']
         f.adapter Faraday.default_adapter
      end
      lib_response = @lib_conn.get.env.response_body
      lib_parsed = JSON.parse(lib_response)
      @book_info = lib_parsed["docs"].first
   end
end