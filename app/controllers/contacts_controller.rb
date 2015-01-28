class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :find_tags, only: [:new, :create, :edit, :update]
  respond_to :html

  def index
    @contact = Contact.new        
    @contacts_search = Contact.search(params[:q])
    if params[:tag]
      @contacts = Contact.tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
    else
      @contacts = @contacts_search.result.includes(:skills, :educations, :companies).paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
    end
    respond_to do |format|
      format.html
      format.csv { render text: @contacts.to_csv }
      format.js{render layout: false}
      
    end
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    flash[:notice] = 'Contact was successfully created.' if @contact.save
     if @contact.save
    flash[:notice] = "Successfully created contact."
    redirect_to contacts_url
  else
    render :action => 'index'
  end 
  end

  def update
    flash[:notice] = 'Contact was successfully updated.' if @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  def tags
    tags = Contact.all_tag_counts.by_tag_name(params[:q]).token_input_tags

    respond_to do |format|
      format.json { render json: tags }
    end
  end

  def create_connections_from_linkedin
    client = LinkedIn::Client.new
    client.authorize_from_access(current_user.linkedin_token, current_user.linkedin_secret)
    client.connections.all.each do |connection|
      unless connection.id == "private" 
        @contact = Contact.create(linkedin_api_url: connection.api_standard_profile_request.url, first_name: connection.first_name, headline: connection.headline, linkedin_id: connection.id, industry: connection.industry, last_name: connection.last_name, location: connection.location.name, picture_url: connection.picture_url, site_standard_profile_request_url: connection.site_standard_profile_request.url) 
        @contact.save
      end
    end
    redirect_to :root
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:tag_list_tokens, :github_username,:linkedin_url, :name, :notes, :headline, :first_name, :last_name, :title, :summary, :location, :country, :industry, :picture_url)
    end
    
    def find_tags
      @contact_tags = params[:id].present? ? Contact.find(params[:id]).tags.token_input_tags : []
    end

end
