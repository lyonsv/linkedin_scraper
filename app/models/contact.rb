class Contact < ActiveRecord::Base
  after_create :build_profile_from_linkedin_scraper
  has_many :skills  
  def build_profile_from_linkedin_scraper  
    profile = Linkedin::Profile.get_profile(self.linkedin_url)
    self.first_name = profile.first_name 
    self.last_name = profile.last_name
    self.name = profile.name   
    self.title = profile.title
    self.country = profile.country
    self.summary = profile.summary
    self.location = profile.location
    self.country = profile.country
    self.industry = profile.industry
    self.picture_url = profile.picture
    profile.skills each do |skill|
      skill = Skill.new(name: skill)
      skill.save
    end 
    self.save
  end

end
