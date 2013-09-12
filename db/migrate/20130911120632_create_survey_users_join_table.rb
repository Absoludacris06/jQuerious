class CreateSurveyUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.integer :survey_id
      t.integer :user_id
    end
    add_index(:survey_users, [:survey_id, :user_id], :unique => true)
  end
end