# == Schema Information
#
# Table name: recommended_visitors
#
#  id           :integer          not null, primary key
#  linkedin_url :string
#  name         :string
#  title        :string
#  company      :string
#  contact_id   :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :recommended_visitor do
    linkedin_url "MyString"
name "MyString"
title "MyString"
company "MyString"
contact nil
  end

end
