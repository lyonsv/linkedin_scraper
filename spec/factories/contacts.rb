# == Schema Information
#
# Table name: contacts
#
#  id                                :integer          not null, primary key
#  name                              :string
#  notes                             :text
#  headline                          :string
#  first_name                        :string
#  last_name                         :string
#  title                             :string
#  summary                           :text
#  location                          :string
#  country                           :string
#  industry                          :string
#  picture_url                       :string
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  linkedin_url                      :string
#  github_username                   :string
#  github_avatar_url                 :string
#  github_url                        :string
#  github_html_url                   :string
#  github_followers_url              :string
#  github_following_url              :string
#  gists_url                         :string
#  starred_url                       :string
#  subscriptions_url                 :string
#  organizations_url                 :string
#  repos_url                         :string
#  events_url                        :string
#  received_events_url               :string
#  github_name                       :string
#  github_company                    :string
#  github_blog                       :string
#  github_location                   :string
#  github_email                      :string
#  github_hireable                   :boolean
#  github_bio                        :string
#  number_of_repos                   :integer
#  number_of_gists                   :integer
#  github_followers                  :integer
#  github_following                  :integer
#  linkedin_api_url                  :string
#  linkedin_id                       :string
#  site_standard_profile_request_url :string
#

FactoryGirl.define do
  factory :contact do
    name "MyString"
notes "MyText"
headline "MyString"
first_name "MyString"
last_name "MyString"
title "MyString"
summary "MyText"
location "MyString"
country "MyString"
industry "MyString"
picture_url "MyString"
  end

end
