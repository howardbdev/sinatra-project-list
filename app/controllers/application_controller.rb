require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def login(username, password)
      user = User.find_by(username: username)
      if user && user.authenticate(password)
        session[:user_id] = user.id
        load_projects
        erb :'/projects/projects'
      else
        redirect '/login'
      end
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end

    def load_projects
      @projects = Project.all
    end

    def logout
      session.destroy
      redirect '/login'
    end

  end

end
