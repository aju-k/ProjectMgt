class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :check_admin
  respond_to :html

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    @developers = User.get_all_developers
    respond_with(@project)
  end

  def new
    @project = Project.new
    @developers = User.get_all_developers
    respond_with(@project)
  end

  def edit
    @developers = @project.users
  end

  def create
    @project = Project.new(project_params)
    @project.save
    params[:developers].each do |id|
      @project.project_developers.create(user_id: id)
    end
    respond_with(@project)
  end

  def update
    @project.update(project_params)
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end


  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end
end
