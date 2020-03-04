class Link < ApplicationRecord
  has_many :taggings
  has_many :tags, through :taggings

  def self.tagged_with(name_tag)
    Tag.find_by!(name_tag: name_tag).links
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id)
    as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name_tag).join(', ')
  end

  def tag_list=(tag_names)
    self.tags = names.split(',').map do |n|
      Tag.where(name_tag: n.strip).first_or_create!
    end
end
