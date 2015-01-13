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

class Company < ActiveRecord::Base
  belongs_to :contact
end
