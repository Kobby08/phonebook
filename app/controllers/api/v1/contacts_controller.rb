module Api
  class V1::ContactsController < ApplicationController
    before_action :set_contact, only: %i[show update destroy]

    def index
      contacts = Contact.all
      render status: 200, json: ContactSerializer.new(contacts)
    end

    def show
      render status: 200, json: ContactSerializer.new(@contact)
    end

    def create
      contact = Contact.new(contact_params)
      if contact.save
        render status: 201, json: ContactSerializer.new(contact)
      else
        render status: 422, json: contact.errors.full_messages
      end
    end

    def update
      if @contact.update(contact_params)
        render status: 201, json: ContactSerializer.new(@contact)
      else
        render status: 422, json: contact.errors.full_messages
      end
    end

    def destroy
      if @contact.destroy
        render status: 204
      else
        render status: 422, json: contact.errors.full_messages
      end
    end

    private

    def contact_params
      params.required(:contact).permit(:first_name, :last_name, :phone_number)
    end

    def set_contact
      @contact = Contact.find_by_id!(params[:id])
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      render status: 404, json: [e]
    end
  end
end
