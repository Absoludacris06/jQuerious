class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :user
      t.references :choice
      t.timestamps
    end
    add_index(:answers, [:choice_id, :user_id], :unique => true)
  end
end
