class CreateRecommendedVisitors < ActiveRecord::Migration
  def change
    create_table :recommended_visitors do |t|
      t.string :linkedin_url
      t.string :name
      t.string :title
      t.string :company
      t.references :contact, index: true

      t.timestamps null: false
    end
    add_foreign_key :recommended_visitors, :contacts
  end
end
