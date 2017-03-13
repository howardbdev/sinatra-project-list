class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      load_projects
      erb :'/projects/projects'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
  end

  get '/logout' do
    logout
  end


end
