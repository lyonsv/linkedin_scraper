class AddLinkedinToUser < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :linkedin_token, :string
    add_column :users, :linkedin_secret, :string
    add_column :users, :picture_url, :string
  end
end
