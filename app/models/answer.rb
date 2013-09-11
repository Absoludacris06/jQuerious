class Answer < ActiveRecord::Base
  validates :user_id, presence: :true
  validates :choice_id, presence: :true
  
  belongs_to :user
  belongs_to :choice
  #provide output to user attempting to retake survey
end
