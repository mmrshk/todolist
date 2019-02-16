class Api::V1::TasksController < ApplicationController
  before_action :authorize_request
  before_action :set_current_project

  def index
    @tasks = @project.tasks

    render json: @tasks, status: :ok
  end

  def show
    @task = @project.tasks.find_by(id: params[:id])

    render json: @task
  end

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  def destroy
    return head(:ok) if @task.destroy

    head(:unprocessable_entity)
  end

  def update
    @task = @project.tasks.find_by(id: params[:id])
    command = UpdateTask.call(@task, task_params)

    if command.result
      render json: @task, status: :ok
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  private

  def set_current_project
    @project = current_user.projects.find_by(id: params[:project_id])
  end

  def task_params
    params.permit(:name, :project_id, :completed, :deadline, :move)
  end
end
