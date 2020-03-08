class User
  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
   has_many :links
   has_and_belongs_to_many :tags

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
