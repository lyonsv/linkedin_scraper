class AddLinkedinUrlToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :linkedin_url, :string
  end
end
