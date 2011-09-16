class Participant::Contact::Type < ActiveRecord::Base
  has_many :participant_contact_email, :class_name => "Participant::Contact::Email"
  has_many :participantcontatct_address, :class_name => "Participant::Contact::Address"
  validates_presence_of :name
  validates_uniqueness_of :name
end

