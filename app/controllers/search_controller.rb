class SearchController < ApplicationController
  def search
    query = ArticleIndex.search(params[:title].to_s)
    @results = query.records
    @total_results = query.total_entries
    @res = []
    @results.each do |article|
      @res << article.id.to_s
    end
    @hash = {}
    n = 1
    @res.each do |id|
      @hash[n] = id
      n = n + 1
    end
    redirect_to pages_resultsearch_path(@hash)
  end
end
