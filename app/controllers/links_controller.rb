# frozen_string_literal: true
class LinksController < ApplicationController
  def index
    @links = if params[:tag]
               Link.tagged_with(params[:tag])
             else
               current_user.links
    end
  end

  def show
    @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      TagCreator.new(params[:link], @link, current_user).call
      redirect_to links_path
    else
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:user_id, :link_name, :description)
  end
end
