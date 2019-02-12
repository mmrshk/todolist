require 'pry'

class Api::V1::ProjectsController < ApplicationController
  before_action :set_project

  # GET /projects
  # GET /projects.json
  api :GET, "/projects", "Get list of projects"

  def index
    @projects = Project.all

    render json: @projects, status: :ok
  end

  # GET /projects
  # GET /projects.json
  api :GET, "/project/:id", "Get list of projects"
  param :id, String, "ID of the project", required: true

  def show
    render json: @project, status: :ok
  end

  # POST /projects
  # POST /projects.json
  api :POST, "/projects", "Create a project"
  param :name, String, "Name of the project", required: true

  def create
    @project = Project.new(project_params)
    @project.save

    render json: @project, status: :created
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  api :DELETE, "/projects/:id", "Delete project"
  param :id, String, "ID of the project", required: true

  def destroy
    return head(:ok) if @project.destroy

    head(:unprocessable_entity)
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  api :PUT, "/projects/:id", "Update a project"
  param :id, String, "ID of the project", required: true
  param :name, String, "Name of the project", required: true

  def update
    @project.update(project_params)

    render json: @project, status: :ok
  end

  private

  def project_params
    params.permit(:name)
  end

  def set_project
    @project = Project.find_by(id: params[:id])
  end
end
