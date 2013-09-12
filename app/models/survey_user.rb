class SurveyUser < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user

  # Remember to create a migration!
end
