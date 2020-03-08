class Link
  include Mongoid::Document

  field :link_name, type: String
  field :description, type: String

  has_and_belongs_to_many :tags
  belongs_to :user, dependent: :destroy

  validates :link_name, presence: true

  scope :tagged_with, ->(name_tag) {joins(:tags).where(tags:{name_tag: name_tag })}

  def all_tags
    tags.pluck(:name_tag)
  end

  def all_tags=(tag_names)
      self.tags = tag_names.split(',').map do |n|
      Tag.where(name_tag: n.strip).first_or_create!
    end
  end
end
