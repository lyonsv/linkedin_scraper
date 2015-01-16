class PeopleSearchController < ApplicationController
  def search
    # investigating best way to perform a people search for linkedin.
    # Linkedin Search API is ultimately unusable
    # Search requires a Verified API Key - seems a bit unreliable.  
    # [TODO] investigate search APIs. Google API is deprecated.
    # Writing a Crawler isn't an option due to speed.  
  end
end
