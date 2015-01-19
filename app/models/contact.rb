# == Schema Information
#
# Table name: contacts
#
#  id                   :integer          not null, primary key
#  name                 :string
#  notes                :text
#  headline             :string
#  first_name           :string
#  last_name            :string
#  title                :string
#  summary              :text
#  location             :string
#  country              :string
#  industry             :string
#  picture_url          :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  linkedin_url         :string
#  github_username      :string
#  github_avatar_url    :string
#  github_url           :string
#  github_html_url      :string
#  github_followers_url :string
#  github_following_url :string
#  gists_url            :string
#  starred_url          :string
#  subscriptions_url    :string
#  organizations_url    :string
#  repos_url            :string
#  events_url           :string
#  received_events_url  :string
#  github_name          :string
#  github_company       :string
#  github_blog          :string
#  github_location      :string
#  github_email         :string
#  github_hireable      :boolean
#  github_bio           :string
#  number_of_repos      :integer
#  number_of_gists      :integer
#  github_followers     :integer
#  github_following     :integer
#

class Contact < ActiveRecord::Base
  
  has_many :skills , dependent: :destroy
  has_many :educations, dependent: :destroy 
  has_many :companies, dependent: :destroy
  has_many :recommended_visitors, dependent: :destroy

  after_create :build_profile_from_linkedin_scraper, if: :user_has_linkedin_profile?
  after_create :build_profile_from_github, if: :user_has_github_profile?
   
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
    client = Octokit::Client.new \
      :client_id     => Rails.application.secrets.github_client_id,
      :client_secret => Rails.application.secrets.github_secret
    user = client.user self.github_username
    self.github_avatar_url = user.avatar_url
    self.github_url = user.url
    self.github_html_url = user.html_url
    self.github_followers_url = user.followers_url
    self.github_following_url = user.following_url
    self.gists_url = user.gists_url     
    self.starred_url = user.starred_url         
    self.subscriptions_url = user.subscriptions_url  
    self.organizations_url = user.organizations_url    
    self.repos_url = user.repos_url      
    self.events_url = user.events_url          
    self.received_events_url = user.received_events_url 
    self.github_name = user.name   
    self.github_company = user.company     
    self.github_blog = user.blog        
    self.github_location = user.location  
    self.github_email = user.email    
    self.github_hireable = user.hireable    
    self.github_bio = user.bio          
    self.number_of_repos = user.number_of_repos     
    self.number_of_gists = user.number_of_gists  
    self.github_followers = user.followers 
    self.github_following = user.following
    self.save   
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |contact|
        csv << contact.attributes.values_at(*column_names)
      end
    end
  end

 def self.dedupe
    # find all models and group them on keys which should be common
    grouped = all.group_by{|contact| [contact.linkedin_url] }
    grouped.values.each do |duplicates|
      # the first one we want to keep right?
      first_one = duplicates.shift # or pop for last one
      # if there are any more left, they are duplicates
      # so delete all of them
      duplicates.each{|double| double.destroy} # duplicates can now be destroyed
    end
  end
  

  def user_has_linkedin_profile?
    self.linkedin_url.present?
  end
  
  def user_has_github_profile?
    self.github_username.present? 
  end



end
