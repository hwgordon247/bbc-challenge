require 'json'

class ApiRequest

  def hit_api(letter, page)
    url = URI('https://ibl.api.bbci.co.uk/ibl/v1/atoz/' + letter + '/programmes?page=' + page)
    response = Net::HTTP.get(url)
    information = JSON.parse(response)
  end

end
