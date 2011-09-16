class Participant::Contact::Address < ActiveRecord::Base
  belongs_to :address_street, :class_name => "Address::Street"
  belongs_to :participant_contact_type, :class_name => "Participant::Contact::Type"
  belongs_to :participant_person, :class_name => "Participant::Person"
  validates_presence_of :participant_person_id
  validates_presence_of :participant_contact_type_id
  validates_uniqueness_of :address_place_id
end
