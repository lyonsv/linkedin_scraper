# == Schema Information
#
# Table name: educations
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  period      :string
#  contact_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :education do
    name "MyString"
description "MyText"
period "MyString"
contact nil
  end

end
