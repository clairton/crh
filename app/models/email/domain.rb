class Email::Domain < ActiveRecord::Base
  belongs_to :email_user, :class_name => "Email::User"
  validates_uniqueness_of :name
  validates_presence_of :name
end

