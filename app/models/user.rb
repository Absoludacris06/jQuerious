class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
  has_many :created_surveys, foreign_key: :creator_id, dependent: :destroy, class_name: "Survey"
  has_many :answers
  has_many :choices, through: :answers
  has_many :taken_surveys, source: :surveys, through: :surveys_users

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
