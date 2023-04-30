class LinksController < ApplicationController
  before_action :set_link, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @links = Link.all
  end

  def show
    @comment = @link.comments.new
  end

  def new
    @link = current_user.links.new
  end

  def edit
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to @link, notice: 'Link was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      redirect_to @link, notice: 'Link was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
    redirect_to links_url, notice: 'Link was successfully destroyed.'
  end

  private

  def set_link
    @link = Link.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:title, :url, :description)
  end
end
