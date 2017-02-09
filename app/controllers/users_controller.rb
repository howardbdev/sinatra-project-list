class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    if !params[:username].empty? && !params[:password].empty? && User.create(username: params[:username], password: params[:password])
      session[:user_id] = User.last.id
      erb :'/projects/projects'
    else
      redirect '/signup'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/projects'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    login(params[:username], params[:password])
  end

  post '/logout' do
    logout
  end
end
