class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @tags = current_user.tags
  end

end
