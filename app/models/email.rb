class Email < ActiveRecord::Base
  validates_presence_of :email_type_id
  has_one :Person
end
