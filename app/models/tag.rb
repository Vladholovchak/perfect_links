class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name_tag, type: String
  has_and_belongs_to_many :links
  belongs_to :user, dependent: :destroy

  def user_tag
    User.in(id: links.pluck(:user_id))
  end
end
