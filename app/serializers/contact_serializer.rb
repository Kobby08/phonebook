class ContactSerializer < ApplicationSerializer
  attributes :name, :phone_number, :created_at, :updated_at
end
