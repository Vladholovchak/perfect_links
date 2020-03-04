class LinksController < ApplicationController
  def index
    params[:tag] ? @links = Link.tagged_with(params[:tag]) : @links = Link.all
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to links_path
    else
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:link_name, :description, :all_tags)
  end
end
