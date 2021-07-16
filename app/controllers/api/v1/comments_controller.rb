class Api::V1::CommentsController < ApplicationController
  before_action :get_project, only: [:index, :create]

  # GET /comments
  def index
    @comments = @project.comments
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = @project.comments.build(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: { message: 'Error: Failed to add comment.'}
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_project
      @project ||= Project.find(params[:project_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:author, :email, :content, :project_id)
    end
end
