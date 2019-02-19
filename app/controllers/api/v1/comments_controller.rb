class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request

  load_and_authorize_resource :project, through: :current_user
  load_and_authorize_resource :task, through: :project
  load_and_authorize_resource through: :task, shallow: true

  def index
    render :index
  end

  def show
    render :show
  end

  def create
    @comment = @task.comments.build(comment_params)

    if @comment.save
      render :show, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      render :show, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.permit(:text, :file, :file_cache, :remote_file_url, :task_id)
  end
end
