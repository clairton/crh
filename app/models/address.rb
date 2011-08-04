class Address < ActiveRecord::Base
  has_one :ContactType
  has_one :Person
  has_one :Street
end

