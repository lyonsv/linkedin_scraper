class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.from_omniauth(auth, params)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
      user.linkedin_token = auth.credentials.token
      user.linkedin_secret = auth.credentials.secret
      user.picture_url = auth.info.image    
    end
  end
end
