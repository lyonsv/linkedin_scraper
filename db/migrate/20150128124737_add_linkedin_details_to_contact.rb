class AddLinkedinDetailsToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :linkedin_api_url, :string
    add_column :contacts, :linkedin_id, :string
    add_column :contacts, :site_standard_profile_request_url, :string
  end
end
