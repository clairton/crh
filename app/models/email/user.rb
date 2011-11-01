class Email::User < ActiveRecord::Base
  has_one :email ,:class_name => "Participant::Contact::Email"
  belongs_to :domain, :class_name => "Email::Domain"
  validates_uniqueness_of :name, :scope => :email_domain_id
  validates_presence_of :name,:email_domain_id
  validates_associated :email ,:class_name => "Participant::Contact::Email"
  validates_associated :domain, :class_name => "Email::Domain"
end

