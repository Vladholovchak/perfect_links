class Tag
  include Mongoid::Document

  field :name_tag, type: String
  has_and_belongs_to_many :links
end
