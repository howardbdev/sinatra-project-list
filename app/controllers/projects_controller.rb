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
      @message = "Something went wrong.  Project not saved. All projects must include a name, location, and description."
      erb :'/projects/create_project'
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
    @project = current_user.projects.find_by_id(params[:id])
    if @project
      erb :'/projects/edit_project'
    else
      @message = "You do not have permission to edit that project."
      load_projects
      erb :'/projects/projects'
    end
  end

  patch '/projects/:id/edit' do
    redirect '/login' unless logged_in?
    @project = current_user.projects.find_by_id(params[:id])
    if @project && @project.user_id == current_user.id
      @project.name = params[:name]
      @project.location = params[:location]
      @project.description = params[:description]
      @project.status = params[:status]
      @project.notes = params[:notes]
      @project.tools = params[:tools]
      @project.materials = params[:materials]
      @project.priority = params[:priority]
    else
      @message = "Project not edited.  Seems like a permission error."
      load_projects
      erb :'/projects/projects'
    end

    if @project.save
      erb :'/projects/show_project'
    else
      @message = "Project not edited.  All projects must have a name, location, and description."
      load_projects
      erb :'/projects/projects'
    end
  end

  delete '/projects/:id/delete' do
    @project = current_user.projects.find_by_id(params[:id])
    if @project && @project.user_id == current_user.id
      @project.delete
      redirect '/projects'
    else
      @message = "PROJECT NOT DELETED.  You do not have permission to delete that project."
      load_projects
      erb :'projects/projects'
    end
  end
end
