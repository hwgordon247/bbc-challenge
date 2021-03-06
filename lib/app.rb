require 'sinatra/base'
require 'sinatra'
require './lib/models/data_analyzer.rb'

class BBC < Sinatra::Base
  enable :sessions

  before do
    @data_analyzer = DataAnalyzer.instance
    @data_analyzer.inject_api
  end

  get '/' do
    @letter = @data_analyzer.letter
    @page = @data_analyzer.page
    @programmes = @data_analyzer.get_programmes
    @page_count = @data_analyzer.page_count
    erb :'index'
  end

  post '/letter' do
    @data_analyzer.letter = params[:letter].to_sym
    @data_analyzer.page = 1;
    redirect '/'
  end

  post '/page' do
    @data_analyzer.page = params[:page]
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
