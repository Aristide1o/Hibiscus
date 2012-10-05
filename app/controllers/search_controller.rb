require 'open-uri'

class SearchController < ApplicationController

  def self.index_tank
    @api  = IndexTank::Client.new(ENV['SEARCHIFY_API_URL'] || 'http://your_api_url')
    @index ||= @api.indexes(ENV['SEARCHIFY_HIBISCUS_INDEX'] || 'hibiscus')
  end

  # retrieve docs from IndexTank
  def self.search(query)
    index_tank.search("#{query} OR title:#{query}", :fetch => 'timestamp,url,text,title', :snippet => 'text')
  end

  def index
    @docs = SearchController.search(params[:query]) if params[:query].present?
  end
end
