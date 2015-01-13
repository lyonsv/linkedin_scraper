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

class RecommendedVisitor < ActiveRecord::Base
  belongs_to :contact
end
