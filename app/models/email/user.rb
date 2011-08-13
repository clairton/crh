class Email::User < ActiveRecord::Base
  belongs_to :Email ,:class_name => "Participant::Contact::Email"
  belongs_to :Domain, :class_name => "Email::Domain"
  validates_uniqueness_of :name, :scope => :email_domain_id
end

