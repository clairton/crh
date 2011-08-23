class Participant::Contact::Address < ActiveRecord::Base
  has_one :Street, :class_name => "Address::Street"
  belongs_to :Type, :class_name => "Participant::Contact::Type"
  belongs_to :Person, :class_name => "Participant::Person"
  validates_presence_of :participant_person_id
  validates_presence_of :participant_contact_type_id
end