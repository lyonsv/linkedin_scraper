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

class Contact < ActiveRecord::Base
  
  has_many :skills 
  has_many :educations 
  has_many :companies
  has_many :recommended_visitors

  after_create :build_profile_from_linkedin_scraper
   
  #
  # Contact Profiles are built by prompting the user to submit a profile url or username and running an after_create method. 
  #
  
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
    profile.skills.each do |skill|
      skill = self.skills.new(name: skill)
    end 
    profile.education.each do |education|
      education = self.educations.new(name: education[:name], description: education[:description], period: education[:period])
    end
    profile.past_companies.each do |company|
      company = self.companies.new(current_company: false, title: company[:title], name: company[:company], start_date: company[:start_date], end_date: company[:end_date], linkedin_company_url: company[:linkedin_company_url], website: company[:url], industry: company[:industry],  headquarters: company[:headquarters], company_size: company[:company_size], founded: company[:founded], address: company[:address], contact_id: company[:contact_id])
    end
    profile.current_companies.each do |company|
      company = self.companies.new(current_company: true, title: company[:title], name: company[:company], start_date: company[:start_date], end_date: company[:end_date], linkedin_company_url: company[:linkedin_company_url], website: company[:url], industry: company[:industry], headquarters: company[:headquarters], company_size: company[:company_size], founded: company[:founded], address: company[:address], contact_id: company[:contact_id])
    end
    profile.recommended_visitors.each do |recommended|
      recommended = self.recommended_visitors.new(linkedin_url: recommended[:link], name: recommended[:name], title: recommended[:title], company: recommended[:company])
    end
    self.save
  end

  def build_profile_from_github
    client = Octokit::Client.new

    user = client.user 'defunkt' 
    raise user
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end
end
