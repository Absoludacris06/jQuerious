class CreateSurveysUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :surveys_users do |t|
      t.integer :survey_id
      t.integer :user_id
    end
  end
end
