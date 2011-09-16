class Email::User < ActiveRecord::Base
  has_one :participant_email ,:class_name => "Participant::Contact::Email"
  belongs_to :email_domain, :class_name => "Email::Domain"
  validates_uniqueness_of :name, :scope => :email_domain_id
  validates_presence_of :name,:email_domain_id
  validates_associated :participant_email ,:class_name => "Participant::Contact::Email"
  validates_associated :email_domain, :class_name => "Email::Domain"
end

