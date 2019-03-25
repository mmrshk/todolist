class Api::V1::TasksController < ApplicationController
  before_action :authorize_request

  load_and_authorize_resource :project, through: :current_user
  load_and_authorize_resource through: :project, shallow: true

  def index
    render :index, status: :ok
  end

  def show
    render :show, status: :ok
  end

  def create
    if @task.save
      render :show, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return head(:ok) if @task.destroy

    head(:unprocessable_entity)
  end

  def update
    UpdateTaskPosition.call(@task, position_param)

    if @task.update(task_params)
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.permit(:name, :project_id, :completed, :deadline)
  end

  def position_param
    params.permit(:position)
  end
end
