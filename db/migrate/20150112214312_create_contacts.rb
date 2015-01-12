class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.text :notes
      t.string :headline
      t.string :first_name
      t.string :last_name
      t.string :title
      t.text :summary
      t.string :location
      t.string :country
      t.string :industry
      t.string :picture_url

      t.timestamps null: false
    end
  end
end
