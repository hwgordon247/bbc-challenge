require './lib/models/data_analyzer'

describe DataAnalyzer do

  let(:api_request) do
    file = File.join(File.dirname(__FILE__), '../api_response.json')
    json_file = File.read(file)
    double(:api_request, :hit_api => JSON.parse(json_file))
  end

  before(:example) do
    file = File.join(File.dirname(__FILE__), '../api_response.json')
    json_file = File.read(file)
    @info = JSON.parse(json_file)
  end

  subject(:data_analyzer) {described_class.new(api_request)}

  it 'can get the relevant information from the api' do
    expect(data_analyzer.get_programs).to eq @info
  end

end
