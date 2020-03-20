# frozen_string_literal: true
class User
  include Mongoid::Document
  include Mongoid::Timestamps

  has_many :links
  has_many :tags
  field :email, type: String
  field :encrypted_password, type: String
  field :admin, type: Boolean, default: false
  field :reset_password_token, type: String
  field :reset_password_sent_at, type: DateTime
  field :remember_created_at, type: DateTime
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end