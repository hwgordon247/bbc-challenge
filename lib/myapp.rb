require 'sinatra/base'

class BBC < Sinatra::Base
  get '/' do
    'Hello BBC!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
