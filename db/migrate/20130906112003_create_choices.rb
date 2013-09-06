class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
    t.references :question
    t.string :option
    t.timestamps
  end
  end
end
