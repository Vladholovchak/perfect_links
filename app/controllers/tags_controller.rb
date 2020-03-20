class TagsController < ApplicationController
  def index
    # binding.pry
    @tags = current_user.tags
  end
end
