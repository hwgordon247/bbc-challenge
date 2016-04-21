require './lib/models/api_request.rb'

class DataAnalyzer

  attr_accessor :letter, :page

  def initialize(api_request = ApiRequest.new)
    @api_request = api_request
    @letter = :a
    @page = 1
  end

  def get_programs
    @api_request.hit_api(@letter.to_s, @page.to_s)
  end

end
