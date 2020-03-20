# frozen_string_literal: true
class TagCreator
  def initialize(link_params,link, current_user)
    @link_params = link_params
    @link = link
    @user = current_user
  end

  def call
    @link_params[:all_tags].split(',').map do |n|
      @link.tags << Tag.where(name_tag: n.strip, user_id: @user.id).first_or_create!
    end
  end
end