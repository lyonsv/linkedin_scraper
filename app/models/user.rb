# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  provider               :string
#  uid                    :string
#  firstname              :string
#  lastname               :string
#  linkedin_token         :string
#  linkedin_secret        :string
#  picture_url            :string
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  def self.from_omniauth(auth, params)
#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#      user.name = auth.info.name
#      user.provider = auth.provider
#      user.uid = auth.uid
#      user.email = auth.info.email
#      user.firstname = auth.info.first_name
#      user.lastname = auth.info.last_name
#      user.password = Devise.friendly_token[0,20]
#      user.linkedin_token = auth.credentials.token
#      user.linkedin_secret = auth.credentials.secret
#      user.picture_url = auth.info.image    
#    end
#  end
end
