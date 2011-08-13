class Email::Domain < ActiveRecord::Base
  has_many :User, :class_name => "Email::User"
  validates_uniqueness_of :name
end

