class Question < ActiveRecord::Base
  validates :title, presence: :true, length: { minimum: 1 }

  has_many :choices
  belongs_to :survey
end
