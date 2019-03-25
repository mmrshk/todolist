class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request
  load_and_authorize_resource through: :current_user

  def create
    if @project.save
      render :show, status: :created
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
      render :show, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.permit(:name, :user_id)
  end
end
