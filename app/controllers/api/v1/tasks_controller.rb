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
    @task = @project.tasks.build(task_params)

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
    command = UpdateTask.call(@task, task_params)

    if command.result
      render :show, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.permit(:name, :project_id, :completed, :deadline, :move)
  end
end
