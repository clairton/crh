class Participant::Contact::Email < ActiveRecord::Base
  has_one :User, :class_name => "Email::User"
  belongs_to :Type, :class_name => "Participant::Contact::Type"
  belongs_to :Person, :class_name => "Participant::Person"
  #validates_uniqueness_of :email_user_id, :scope => :participant_person_id,:participant_contact_type_id
end