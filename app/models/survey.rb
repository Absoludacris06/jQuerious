class Survey < ActiveRecord::Base
  validates :name, uniqueness: true

  has_many :questions
  belongs_to :creator, class_name: "User"
  # alias_attribute :user, :creator
end
