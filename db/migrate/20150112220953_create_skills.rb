class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.references :contact, index: true

      t.timestamps null: false
    end
    add_foreign_key :skills, :contacts
  end
end
