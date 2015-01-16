class AddGithubUsernameToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :github_username, :string
  end
end
