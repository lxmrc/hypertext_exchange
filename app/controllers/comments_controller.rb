class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @comments = Comment.all
  end

  def show
  end

  def edit
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to @comment.link, notice: 'Comment was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to link_url(@comment.link), notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text, :link_id)
  end
end
