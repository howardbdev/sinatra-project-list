class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end

  post '/signup' do
    u = User.create(username: params[:username], password: params[:password])
    if !params[:username].empty? && !params[:password].empty? && !!u.id
      session[:user_id] = User.last.id
      load_projects
      erb :'/projects/projects'
    else
      redirect '/signup'
    end
  end

end
