class ContactType < ActiveRecord::Base
  has_many :Address
  has_many :Email
  has_many :Phone
end

