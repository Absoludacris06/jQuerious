class CreateAnswers < ActiveRecord::Migration
  def change
    create_answers do |t|
      t.references :user
      t.references :question
      t.references :choice
      t.timestamps
    end
  end
end
