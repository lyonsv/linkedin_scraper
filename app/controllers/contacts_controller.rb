class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contacts = Contact.all
    respond_to do |format|
      format.html
      format.csv { render text: @contacts.to_csv }
    end
  end

  def show
    respond_with(@contact)
  end

  def new
    @contact = Contact.new
    respond_with(@contact)
  end

  def edit
  end

  def create
    @contact = Contact.new(contact_params)
    flash[:notice] = 'Contact was successfully created.' if @contact.save
    respond_with(@contact)
  end

  def update
    flash[:notice] = 'Contact was successfully updated.' if @contact.update(contact_params)
    respond_with(@contact)
  end

  def destroy
    @contact.destroy
    respond_with(@contact)
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:linkedin_url, :name, :notes, :headline, :first_name, :last_name, :title, :summary, :location, :country, :industry, :picture_url)
    end
end
