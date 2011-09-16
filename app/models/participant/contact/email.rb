class Participant::Contact::Email < ActiveRecord::Base
  belongs_to :email_user, :class_name => "Email::User"
  belongs_to :particpant_contact_type, :class_name => "Participant::Contact::Type"
  belongs_to :participant_person, :class_name => "Participant::Person"
  validates_presence_of :participant_person_id
  validates_presence_of :participant_contact_type_id
  validates_uniqueness_of :email_user_id
end
