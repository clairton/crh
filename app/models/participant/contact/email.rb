class Participant::Contact::Email < ActiveRecord::Base
  belongs_to :User, :class_name => "Email::User"
  belongs_to :type, :class_name => "Participant::Contact::type"
  belongs_to :Person, :class_name => "Participant::Person"
  validates_presence_of :participant_person_id
  validates_presence_of :participant_contact_type_id
  validates_uniqueness_of :email_user_id
end
