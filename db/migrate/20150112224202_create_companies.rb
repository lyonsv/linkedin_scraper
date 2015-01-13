class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :title
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :linkedin_company_url
      t.string :website
      t.string :industry
      t.string :type
      t.string :headquarters
      t.string :company_size
      t.string :founded
      t.string :address
      t.references :contact, index: true

      t.timestamps null: false
    end
    add_foreign_key :companies, :contacts
  end
end
