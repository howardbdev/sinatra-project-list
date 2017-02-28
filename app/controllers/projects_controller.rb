class ProjectsController < ApplicationController

  get '/projects/new' do
    erb :'/projects/create_project'
  end

  get '/projects' do
    if logged_in?
      load_projects
      erb :'/projects/projects'
    else
      redirect '/login'
    end
  end

  post '/projects' do
    @project = Project.new
    @project.user_id = session[:user_id]
    @project.name = params[:name]
    @project.location = params[:location]
    @project.description = params[:description]
    @project.status = params[:status]
    @project.notes = params[:notes]
    @project.tools = params[:tools]
    @project.materials = params[:materials]
    @project.priority = params[:priority]
    if @project.save
      load_projects
      erb :'/projects/show_project'
    else
      redirect '/projects/new'
    end
  end

  get '/projects/:id' do
    redirect '/login' unless logged_in?
    @project = Project.find_by_id(params[:id])
    if @project
      erb :'/projects/show_project'
    else
      redirect '/projects'
    end
  end

  get '/projects/:id/edit' do
    redirect '/login' unless logged_in?
    @project = current_user.projects.find_by_id(:id)
    if @project
      erb :'/projects/edit_project'
    else
      @message = "You do not have permission to edit this project."
      redirect '/projects'
    end
  end
end
