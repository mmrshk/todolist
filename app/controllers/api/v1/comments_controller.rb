class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request

  load_and_authorize_resource :project, through: :current_user
  load_and_authorize_resource :task, through: :project
  load_and_authorize_resource through: :task, shallow: true

  def index; end

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
    return head(:ok) if @comment.destroy

    head(:unprocessable_entity)
  end

  private

  def comment_params
    params.permit(:text, :file, :file_cache, :remote_file_url, :task_id)
  end
end
