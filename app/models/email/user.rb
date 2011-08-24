class Email::User < ActiveRecord::Base
  has_one :Email ,:class_name => "Participant::Contact::Email"
  belongs_to :Domain, :class_name => "Email::Domain"
  validates_uniqueness_of :name, :scope => :email_domain_id
  validates_presence_of :name,:email_domain_id
  validates_associated :Email ,:class_name => "Participant::Contact::Email"
  validates_associated :Domain, :class_name => "Email::Domain"
end

