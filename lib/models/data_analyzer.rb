require './lib/models/api_request.rb'
require 'singleton'

class DataAnalyzer
  include Singleton
  PROGRAMMES_PER_PAGE = 20

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
    @pages = (total_programmes.to_f/PROGRAMMES_PER_PAGE).ceil
  end

  private

  def restructure_data
    programmes = @information['atoz_programmes']['elements']
    iterate_programmes(programmes)
  end

  def iterate_programmes(programmes)
    programme_store = []
    programmes.each do |programme|
      url = generate_image_url(programme)
      programme_store << programme_hash(url, programme)
    end
    programme_store
  end

  def generate_image_url(programme)
    raw_url = programme['images']['standard']
    raw_url.gsub!('{recipe}','192x108')
  end

  def programme_hash(url, programme)
    current = {}
    current['title'] = programme['title']
    current['image_url'] = url
    current
  end

end
