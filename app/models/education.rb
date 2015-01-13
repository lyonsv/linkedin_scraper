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

class Education < ActiveRecord::Base
  belongs_to :contact
end
