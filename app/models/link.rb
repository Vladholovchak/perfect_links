# frozen_string_literal: true
class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :link_name, type: String
  field :description, type: String

  has_and_belongs_to_many :tags
  belongs_to :user
  validates :link_name, presence: true
  scope :tagged_with, ->(name_tag) { where(:tag_ids.in => Tag.where(name_tag: name_tag).pluck(:id))}

  def all_tags
    tags.pluck(:name_tag)
  end
end
