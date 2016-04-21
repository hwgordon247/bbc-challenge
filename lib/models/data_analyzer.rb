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
    programmes = @information['atoz_programmes']['elements']
  end

  def page_count
    total_programmes = @information['atoz_programmes']['count']
    @pages = (total_programmes.to_f/20).ceil
  end

end
