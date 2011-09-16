class Participant::Person < ActiveRecord::Base
  has_many :participant_contat_email, :class_name => "Participant::Contact::Email"
  has_many :participant_contact_address, :class_name => "Participant::Contact::Address"
  validates_presence_of :first_name,:code
  validates_uniqueness_of :code
end

