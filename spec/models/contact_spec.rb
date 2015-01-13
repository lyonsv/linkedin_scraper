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

require 'rails_helper'

RSpec.describe Contact, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end