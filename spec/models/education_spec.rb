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

require 'rails_helper'

RSpec.describe Education, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
