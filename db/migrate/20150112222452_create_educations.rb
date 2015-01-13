class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.text :description
      t.string :period
      t.references :contact, index: true

      t.timestamps null: false
    end
    add_foreign_key :educations, :contacts
  end
end
