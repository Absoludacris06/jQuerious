class Choice < ActiveRecord::Base
  validates :option, presence: true, length: { minimum: 1 }


  has_many :answers
  has_many :users, through: :answers
  belongs_to :question

  
end
