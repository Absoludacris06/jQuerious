class Survey < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :survey_users
  has_many :takers, through: :survey_users, source: :user
  has_many :questions
  belongs_to :creator, class_name: "User"
  # alias_attribute :user, :creator
end
