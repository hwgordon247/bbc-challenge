class DataAnalyzer

  def initialize(api_request = ApiRequest.new)
    @api_request = api_request
  end

  def get_programs(letter, page)
    @api_request.hit_api(letter,page)
  end

end
