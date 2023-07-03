require 'sinatra'
require_relative 'pages_controller'

class MyApp < Sinatra::Base
  use PagesController

  run! if app_file == $0
end