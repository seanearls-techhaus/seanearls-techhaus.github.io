require 'sinatra/base'

class PagesController < Sinatra::Base
    before do
        unless request.cookies['sessionID']
            domain = settings.environment == :production ? ".motorcultureaustralia.com" : nil
            response.set_cookie('sessionID', {
                :value => SecureRandom.hex,
                :domain => domain,
                :path => "/",
                :expires => Time.now + 3600,
                :secure => request.secure?,
                :httponly => true,
                :same_site => "Strict"
            })
        end
    end

    get '/' do
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
            :same_site => "Strict"
        })
        redirect '/site2'
        end
    end

    get '/clear_cookie' do
        response.delete_cookie('userEmail')
        redirect '/site1'
    end

end