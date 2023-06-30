require 'sinatra'
require_relative 'pages_controller'

pages_controller = PagesController.new

get '/site1' do
  pages_controller.site1(request.cookies['userEmail'])
end

get '/site2' do
  pages_controller.site2(request.cookies['userEmail'])
end

post '/submit_email' do
  pages_controller.submit_email(params[:email])
end

get '/clear_cookie' do
    pages_controller.refresh_cookie
end