class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :links, through: :taggings
end
