class ProjectsController < ApplicationController

  get '/signup' do
    erb :'/users/create_user'
  end
end
