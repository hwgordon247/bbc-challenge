require 'sinatra/base'
require 'sinatra'
require './lib/models/data_analyzer.rb'

class BBC < Sinatra::Base

  before do
    @data_analyzer = DataAnalyzer.new
  end

  get '/' do
    @letter = @data_analyzer.letter
    erb :'index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
