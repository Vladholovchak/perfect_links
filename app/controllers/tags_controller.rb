class TagsController < ApplicationController

  def index
    @tags = current_user.tags.uniq
  end
end
