require './lib/models/api_request.rb'

describe ApiRequest do

  subject(:api_request) {described_class.new}

  before(:example) do
    file = File.join(File.dirname(__FILE__), '../letter_a_page_1.json')
    json_file = File.read(file)
    @info = JSON.parse(json_file)
  end

  it "can request information from the api" do
    expect(api_request.hit_api('a','1')).to eq @info
  end

end
