require './lib/models/data_analyzer'

describe DataAnalyzer do

  let(:api_request) do
    file = File.join(File.dirname(__FILE__), '../letter_a_page_1.json')
    json_file = File.read(file)
    double(:api_request, :hit_api => JSON.parse(json_file))
  end

  before(:example) do
    file = File.join(File.dirname(__FILE__), '../letter_a_page_1.json')
    json_file = File.read(file)
    @info = JSON.parse(json_file)
  end

  subject(:data_analyzer) {described_class.instance}

  before(:example) do
    data_analyzer.inject_api(api_request)
  end

  it 'can get the relevant information from the api' do
    expect(data_analyzer.get_programmes).to include({"title"=>"Abadas", "image_url"=>"http://ichef.bbci.co.uk/images/ic/192x108/p017mqg6.jpg"})
  end

  it 'can calculate the total number of pages' do
    data_analyzer.get_programmes
    expect(data_analyzer.page_count).to eq 4
  end

end
