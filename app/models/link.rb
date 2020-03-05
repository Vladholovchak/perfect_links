class Link < ApplicationRecord
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user

  def self.tagged_with(name_tag)
    Tag.find_by!(name_tag: name_tag).links
  end

  def all_tags
    tags.map(&:name_tag).join(', ')
  end

  def all_tags=(tag_names)
    self.tags = tag_names.split(',').map do |n|
      Tag.where(name_tag: n.strip).first_or_create!
    end
  end
end
