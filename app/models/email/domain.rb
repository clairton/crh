class Email::Domain < ActiveRecord::Base
  has_many :email_user, :class_name => "Email::User"
  validates_uniqueness_of :name
  validates_presence_of :name
end

