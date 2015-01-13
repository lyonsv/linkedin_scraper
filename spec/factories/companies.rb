# == Schema Information
#
# Table name: companies
#
#  id                   :integer          not null, primary key
#  title                :string
#  name                 :string
#  start_date           :datetime
#  end_date             :datetime
#  linkedin_company_url :string
#  website              :string
#  industry             :string
#  type                 :string
#  headquarters         :string
#  company_size         :string
#  founded              :string
#  address              :string
#  contact_id           :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  current_company      :boolean
#

FactoryGirl.define do
  factory :company do
    title "MyString"
name "MyString"
start_date "2015-01-12 22:42:02"
end_date "2015-01-12 22:42:02"
linkedin_company_url "MyString"
website "MyString"
industry "MyString"
type ""
headquarters "MyString"
company_size "MyString"
founded "MyString"
address "MyString"
contact nil
  end

end
