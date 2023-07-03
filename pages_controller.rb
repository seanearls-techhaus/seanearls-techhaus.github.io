require 'sinatra/base'

class PagesController < Sinatra::Base
  get '/site1' do
    @email = request.cookies['userEmail']
    erb :site1
  end

  get '/site2' do
    @email = request.cookies['userEmail']
    erb :site2
  end

  post '/submit_email' do
    email = params[:email]
    if email.nil? || email.empty?
      redirect '/site1'
    else
      response.set_cookie('userEmail',
      {
          :value => email,
          :path => "/",
          :expires => Time.now + 3600,
          :secure => request.secure?,
          :httponly =>true,
          :samesite => "Strict"
      })
      redirect '/site2'
    end
  end

  get '/clear_cookie' do
    response.delete_cookie('userEmail')
    redirect '/site1'
  end
end