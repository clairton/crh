class Participant::Contact::Type < ActiveRecord::Base
  has_many :Email
  has_many :Address
end

