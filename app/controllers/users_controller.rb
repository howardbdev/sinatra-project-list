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
    erb :'/users/login'
  end

  post '/login' do
    user = User.find(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/projects/projects'
    else
      redirect '/users/login'
    end

  end

  post '/logout' do
    session.destroy
    redirect '/login'
  end
end
