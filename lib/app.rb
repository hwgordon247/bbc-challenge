require 'sinatra/base'
require 'sinatra'
require './lib/models/data_analyzer.rb'

class BBC < Sinatra::Base

  before do
    @data_analyzer = DataAnalyzer.new
  end

  get '/' do
    @letter = @data_analyzer.letter
    @page = @data_analyzer.page
    @programmes = @data_analyzer.get_programmes
    erb :'index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
