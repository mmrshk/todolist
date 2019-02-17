class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request
  load_and_authorize_resource through: :current_user

  def index
    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      render json: @project, status: :created
    elsif current_user.projects.find_by(name: params[:name])
      render json: { message: 'The project with such name does already exist.' }, status: :conflict
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return head(:ok) if @project.destroy

    head(:unprocessable_entity)
  end

  def update
    if @project.update(project_params)
      render json: @project, status: :ok
    elsif current_user.projects.find_by(name: params[:name])
      render json: { message: 'The project with such name does already exist.' }, status: :conflict
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.permit(:name, :user_id)
  end
end
