class ProjectsController < ApplicationController

  get '/projects/new' do
    erb :'/projects/create_project'
  end

  get '/projects/projects' do
    if logged_in?
      load_projects
      erb :'projects/projects'
    else
      redirect '/login'
    end
  end

  post '/projects' do
    project = Project.new
    project.user_id = session[:user_id]
    project.name = params[:name]
    project.location = params[:location]
    project.description = params[:description]
    project.status = params[:status] if !params[:status].empty?
    project.status = params[:notes] if !params[:notes].empty?
    project.status = params[:tools] if !params[:tools].empty?
    project.status = params[:materials] if !params[:materials].empty?
    project.status = params[:priority] if !params[:priority].empty?
    if project.save
      load_projects
      redirect '/projects/projects'
    else
      redirect '/projects/new'
    end
  end
end
