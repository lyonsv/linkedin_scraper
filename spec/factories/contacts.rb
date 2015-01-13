# == Schema Information
#
# Table name: contacts
#
#  id           :integer          not null, primary key
#  name         :string
#  notes        :text
#  headline     :string
#  first_name   :string
#  last_name    :string
#  title        :string
#  summary      :text
#  location     :string
#  country      :string
#  industry     :string
#  picture_url  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  linkedin_url :string
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
