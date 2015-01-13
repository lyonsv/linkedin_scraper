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

require 'rails_helper'

RSpec.describe RecommendedVisitor, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
