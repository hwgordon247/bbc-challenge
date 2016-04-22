require './lib/models/api_request.rb'
require 'singleton'

class DataAnalyzer
  include Singleton

  attr_accessor :letter, :page

  def initialize
    @letter = :a
    @page = 1
  end

  def inject_api(api_request = ApiRequest.new)
    @api_request = api_request
  end

  def get_programmes
    @information = @api_request.hit_api(@letter.to_s, @page.to_s)
    programmes = restructure_data
  end

  def page_count
    total_programmes = @information['atoz_programmes']['count']
    @pages = (total_programmes.to_f/20).ceil
  end

  private
  
  def restructure_data
    programme_store = []
    programmes = @information['atoz_programmes']['elements']
    programmes.each do |programme|
      current = {}
      raw_url = programme['images']['standard']
      url = raw_url.gsub!('{recipe}','192x108')
      current['title'] = programme['title']
      current['image_url'] = url
      programme_store << current
    end
    programme_store
  end

end
