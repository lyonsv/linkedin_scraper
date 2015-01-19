class AddGithubInfoToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :github_avatar_url, :string
    add_column :contacts, :github_url, :string
    add_column :contacts, :github_html_url, :string
    add_column :contacts, :github_followers_url, :string
    add_column :contacts, :github_following_url, :string
    add_column :contacts, :gists_url, :string
    add_column :contacts, :starred_url, :string
    add_column :contacts, :subscriptions_url, :string
    add_column :contacts, :organizations_url, :string
    add_column :contacts, :repos_url, :string
    add_column :contacts, :events_url, :string
    add_column :contacts, :received_events_url, :string
    add_column :contacts, :github_name, :string
    add_column :contacts, :github_company, :string
    add_column :contacts, :github_blog, :string
    add_column :contacts, :github_location, :string
    add_column :contacts, :github_email, :string
    add_column :contacts, :github_hireable, :boolean
    add_column :contacts, :github_bio, :string
    add_column :contacts, :number_of_repos, :integer
    add_column :contacts, :number_of_gists, :integer
    add_column :contacts, :github_followers, :integer
    add_column :contacts, :github_following, :integer
  end
end
