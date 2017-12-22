class Api::V1::ContactsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }
  
  def index
    contacts = Contact.all
    render json: {contacts: contacts}
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: {contact: contact}
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :updates)
  end
end
